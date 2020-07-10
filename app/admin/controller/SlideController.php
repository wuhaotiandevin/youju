<?php

namespace app\admin\controller;

use app\admin\model\SlideModel;
use cmf\controller\AdminBaseController;
use think\Db;

class SlideController extends AdminBaseController
{

    /**
     * 轮播图列表
     * @adminMenu(
     *     'name'   => '轮播图管理',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 40,
     *     'icon'   => '',
     *     'remark' => '轮播图管理',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $slidePostModel = new SlideModel();
        $slides         = $slidePostModel->where(['delete_time' => ['eq', 0]])->select();
        $this->assign('slides', $slides);
        return $this->fetch();
    }

    /**
     * 添加轮播图
     * @adminMenu(
     *     'name'   => '添加轮播图',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加轮播图',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 添加轮播图提交
     * @adminMenu(
     *     'name'   => '添加轮播图提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加轮播图提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $data           = $this->request->param();
		$data['remark'] = cmf_random_string(10);;
        $slidePostModel = new SlideModel();
        $result         = $slidePostModel->validate(true)->save($data);
        if ($result === false) {
            $this->error($slidePostModel->getError());
        }
        $this->success("添加成功！", url("slide/index"));
    }

    /**
     * 编辑轮播图
     * @adminMenu(
     *     'name'   => '编辑轮播图',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑轮播图',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id             = $this->request->param('id');
        $slidePostModel = new SlideModel();
        $result         = $slidePostModel->where('id', $id)->find();
        $this->assign('result', $result);
        return $this->fetch();
    }

    /**
     * 编辑轮播图提交
     * @adminMenu(
     *     'name'   => '编辑轮播图提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑轮播图提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        $data           = $this->request->param();
        halt($data);exit;
        $slidePostModel = new SlideModel();
        $result         = $slidePostModel->validate(true)->save($data, ['id' => $data['id']]);
        if ($result === false) {
            $this->error($slidePostModel->getError());
        }
        $this->success("保存成功！", url("slide/index"));
    }

    /**
     * 删除轮播图
     * @adminMenu(
     *     'name'   => '删除轮播图',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除轮播图',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id             = $this->request->param('id', 0, 'intval');
        $slidePostModel = new SlideModel();
        $result       = $slidePostModel->where(['id' => $id])->find();
        if (empty($result)){
            $this->error('轮播图不存在!');
        }

        //如果存在页面。则不能删除。
        $slidePostCount = Db::name('slide_item')->where('slide_id', $id)->count();
        if ($slidePostCount > 0) {
            $this->error('此轮播图有页面无法删除!');
        }

        $data         = [
            'object_id'   => $id,
            'create_time' => time(),
            'table_name'  => 'slide',
            'name'        => $result['name']
        ];

        $resultSlide = $slidePostModel->save(['delete_time' => time()], ['id' => $id]);
        if ($resultSlide) {
            Db::name('recycleBin')->insert($data);
        }
        $this->success("删除成功！", url("slide/index"));
    }
}