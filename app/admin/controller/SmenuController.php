<?php

namespace app\admin\controller;
use app\admin\model\SmenuModel;
use think\Db;
use cmf\controller\AdminBaseController;


class SmenuController extends AdminBaseController
{
    /**
     * 首页菜单页面列表
     */
    public function index()
    {
        $result  = Db::name('smenu')->order('list_order desc')->select()->toArray();
        $this->assign('result', $result);
        return $this->fetch();
    }

    /**
     * 首页菜单页面添加
     * @adminMenu(
     *     'name'   => '首页菜单页面添加',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页菜单页面添加',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 首页菜单页面添加提交
     * @adminMenu(
     *     'name'   => '首页菜单页面添加提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页菜单页面添加提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $data = $this->request->param();
		$list = array();
		if($data['post']['image']){
			$img =  cmf_get_image_preview_url($data['post']['image']);
			$list = @getimagesize($img);
		}
		$data['post']['width'] = isset($list[0])?$list[0]:0;
		$data['post']['height'] = isset($list[1])?$list[1]:0;
        Db::name('smenu')->insert($data['post']);
        $this->success("添加成功！", url("smenu/index"));
    }

    /**
     * 首页菜单页面编辑
     * @adminMenu(
     *     'name'   => '首页菜单页面编辑',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页菜单页面编辑',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id     = $this->request->param('id');
        $result = Db::name('smenu')->where(['id' => $id])->find();

        $this->assign('result', $result);
        return $this->fetch();
    }

    /**
     * 首页菜单页面编辑
     * @adminMenu(
     *     'name'   => '首页菜单页面编辑提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页菜单页面编辑提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {
		$list = array();
        $data = $this->request->param();
		if($data['post']['image']){
			$img =  $data['post']["imgurl"];
			$list = @getimagesize($img);
		}
		$data['post']['width'] = isset($list[0])?$list[0]:0;
		$data['post']['height'] = isset($list[1])?$list[1]:0;
        $data['post']['image'] = cmf_asset_relative_url($data['post']['image']);
		unset($data['post']["imgurl"]);
        Db::name('smenu')->update($data['post']);

        $this->success("保存成功！", url("smenu/index"));

    }

    /**
     * 首页菜单页面删除
     * @adminMenu(
     *     'name'   => '首页菜单页面删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页菜单页面删除',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id     = $this->request->param('id', 0, 'intval');

        $smenu = Db::name('smenu')->find($id);

        $result = Db::name('smenu')->delete($id);
        if ($result) {
            //删除图片。
            if (file_exists("./upload/".$smenu['image'])){
                @unlink("./upload/".$smenu['image']);
            }
            $this->success("删除成功！", url("smenu/index"));
        } else {
            $this->error('删除失败！');
        }

    }


    /**
     * 首页菜单页面排序
     * @adminMenu(
     *     'name'   => '首页菜单页面排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '首页菜单页面排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        $smenuModel = new  smenuModel();
        parent::listOrders($smenuModel);
        $this->success("排序更新成功！");
    }
}