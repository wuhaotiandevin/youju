<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use app\admin\model\GiftModel;

class GiftController extends AdminBaseController
{

    /**
     * 礼物管理
     * @adminMenu(
     *     'name'   => '礼物',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 50,
     *     'icon'   => '',
     *     'remark' => '礼物管理',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $GiftModel = new GiftModel();
        $gifts     = $GiftModel->select();
        $this->assign('gifts', $gifts);

        return $this->fetch();
    }

    /**
     * 添加礼物
     * @adminMenu(
     *     'name'   => '添加礼物',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加礼物',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 添加礼物提交保存
     * @adminMenu(
     *     'name'   => '添加礼物提交保存',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加礼物提交保存',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $data      = $this->request->param();
        $GiftModel = new GiftModel();
        $result    = $GiftModel->validate(true)->allowField(true)->save($data);
        if ($result === false) {
            $this->error($GiftModel->getError());
        }

        $this->success("添加成功！", url("gift/index"));
    }

    /**
     * 编辑礼物
     * @adminMenu(
     *     'name'   => '编辑礼物',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑礼物',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id        = $this->request->param('id', 0, 'intval');
        $GiftModel = GiftModel::get($id);
        $this->assign('gift', $GiftModel);
        return $this->fetch();
    }

    /**
     * 编辑礼物提交保存
     * @adminMenu(
     *     'name'   => '编辑礼物提交保存',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑礼物提交保存',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
        $data      = $this->request->param();
        $GiftModel = new GiftModel();
        $result    = $GiftModel->validate(true)->allowField(true)->isUpdate(true)->save($data);
        if ($result === false) {
            $this->error($GiftModel->getError());
        }

        $this->success("保存成功！", url("gift/index"));
    }

    /**
     * 删除礼物
     * @adminMenu(
     *     'name'   => '删除礼物',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除礼物',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        GiftModel::destroy($id);

        $this->success("删除成功！", url("gift/index"));
    }

    /**
     * 礼物排序
     * @adminMenu(
     *     'name'   => '礼物排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '礼物排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        $GiftModel = new  GiftModel();
        parent::listOrders($GiftModel);
        $this->success("排序更新成功！");
    }

    /**
     * 礼物显示隐藏
     * @adminMenu(
     *     'name'   => '礼物显示隐藏',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '礼物显示隐藏',
     *     'param'  => ''
     * )
     */
    public function toggle()
    {
        $data      = $this->request->param();
        $GiftModel = new GiftModel();

        if (isset($data['ids']) && !empty($data["display"])) {
            $ids = $this->request->param('ids/a');
            $GiftModel->where(['id' => ['in', $ids]])->update(['status' => 1]);
            $this->success("更新成功！");
        }

        if (isset($data['ids']) && !empty($data["hide"])) {
            $ids = $this->request->param('ids/a');
            $GiftModel->where(['id' => ['in', $ids]])->update(['status' => 0]);
            $this->success("更新成功！");
        }


    }

}