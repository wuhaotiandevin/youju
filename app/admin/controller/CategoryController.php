<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 王 < 393707022@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use app\admin\model\CategoryModel;

use think\Db;

class CategoryController extends AdminBaseController
{
    public function getParents()
    {
        $parents = Db::name('category')->where(['parent_id' => 0])->order("list_order ASC")->select();
        $array  = [];
        $array[0]       = "一级类目";
        foreach ($parents as $r) {
            $array[$r['id']]       = $r['cat_name'];
        }
        return $array;
    }
    
    public function getParentName($parent_id)
    {
        $parent = [];
        $parent_name        = '一级类目';
    	if($parent_id){
    		$parent = Db::name('category')->where(['id' => $parent_id])->select();
    	}
    	if($parent && count($parent)>0){
    		$parent_name        = $parent[0]['cat_name'];
    	}
        return $parent_name;
    }

    /**
     * 服务类目管理
     */
    public function index()
    {
    	$parent_id        = $this->request->param('parent_id', 0, 'intval');
    	$parent_name = $this->getParentName($parent_id);
        $categoryModel = new CategoryModel();
        $categorys     = $categoryModel->where('parent_id', $parent_id)->select();
        $this->assign('categorys', $categorys);
        $this->assign('parent_name', $parent_name);

        return $this->fetch();
    }

    /**
     * 添加服务类目
     */
    public function add()
    {
        $parent_id        = $this->request->param('parent_id', 0, 'intval');
    	$parent_name = $this->getParentName($parent_id);
        //$this->assign('targets', $this->getParents());
        $this->assign('parent_name', $parent_name);
        $this->assign('parent_id', $parent_id);
        return $this->fetch();
    }

    /**
     * 添加服务类目提交保存
     */
    public function addPost()
    {
        $data      = $this->request->param();
        halt($data);exit;
        $categoryModel = new CategoryModel();
        $result    = $categoryModel->validate(true)->allowField(true)->save($data);
        if ($result === false) {
            $this->error($categoryModel->getError());
        }

        $this->success("添加成功！", url("category/index"));
    }

    /**
     * 编辑服务类目
     */
    public function edit()
    {
        $id          = $this->request->param('id', 0, 'intval');
        $parent_id   = $this->request->param('parent_id', 0, 'intval');
    	$parent_name = $this->getParentName($parent_id);
        $categoryModel = CategoryModel::get($id);
        //$this->assign('targets', $this->getParents());
        $this->assign('category', $categoryModel);
        $this->assign('parent_name', $parent_name);
        return $this->fetch();
    }

    /**
     * 编辑服务类目提交保存
     */
    public function editPost()
    {
        $data      = $this->request->param();
        $categoryModel = new CategoryModel();
        $result    = $categoryModel->validate(true)->allowField(true)->isUpdate(true)->save($data);
        if ($result === false) {
            $this->error($categoryModel->getError());
        }
        $this->success("保存成功！", url("category/index"));
    }

    /**
     * 删除服务类目
     */
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        CategoryModel::destroy($id);

        $this->success("删除成功！", url("category/index"));
    }

    /**
     * 服务类目排序
     */
    public function listOrder()
    {
        $categoryModel = new  CategoryModel();
        parent::listOrders($categoryModel);
        $this->success("排序更新成功！");
    }

    /**
     * 服务类目显示隐藏
     */
    public function toggle()
    {
        $data      = $this->request->param();
        $categoryModel = new CategoryModel();

        if (isset($data['ids']) && !empty($data["display"])) {
            $ids = $this->request->param('ids/a');
            $categoryModel->where(['id' => ['in', $ids]])->update(['status' => 1]);
            $this->success("更新成功！");
        }

        if (isset($data['ids']) && !empty($data["hide"])) {
            $ids = $this->request->param('ids/a');
            $categoryModel->where(['id' => ['in', $ids]])->update(['status' => 0]);
            $this->success("更新成功！");
        }


    }

}