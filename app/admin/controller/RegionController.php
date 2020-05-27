<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;


use cmf\controller\AdminBaseController;
use think\Db;
use app\admin\model\RegionModel;

class RegionController extends AdminBaseController
{
	
   
	public function index(){
		$RegionModel = new RegionModel();
		$parent_id = $this->request->param('pid', 0, 'intval');
		$parent_name = $RegionModel->field('region_name,region_type')->where('region_id',$parent_id)->find();
		if(empty($parent_name['region_name'])){ $parent_name['region_name'] = '中国';}
		
		$area_type = array(0=>"市级区域",4=>"四级区域",1=>'区/县区域',2=>'乡镇区域');
		
		$region_type = empty($parent_name['region_type'])?0:$parent_name['region_type'];
		
		$region_type_name = $area_type[$region_type];
		
		

		$area_list = $this->area_list($parent_id);
		
		$this->assign("parent_id",$parent_id);
		$this->assign("region_type",($region_type+1));
		$this->assign("region_type_name",$region_type_name);
		$this->assign("parent_name",$parent_name['region_name']);
		$this->assign("area_list",$area_list);
		//$this->display();
		return $this->fetch();
	}
	
	//新增区域
	function add(){
		$RegionModel = new RegionModel();
		$parent_id      = intval($_POST['parent_id']);
		$region_name    = trim($_POST['region_name']);
		$region_type    = intval($_POST['region_type']);
		if(empty($region_name)){
			$this->error('请填写地区名称');
		}
		$check_name = $RegionModel->where('region_name = "'.$region_name.'" and parent_id = '.$parent_id)->find();
		if($check_name){
			$this->error('该地区已经存在。');
		}else{
			$RegionModel->parent_id=$parent_id;
			$RegionModel->region_name=$region_name;
			$RegionModel->region_type=$region_type;
			$result = $RegionModel->save();
			if ($result) {
					$this->success("添加成功！");
			} else {
					$this->error("添加失败！");
			}
			
		}	
	}
	
	//删除维修方法
	function delete(){
		$RegionModel = new RegionModel();
		$id = $this->request->param('id');
		$dis = $this->request->param('ids');
		if(!empty($id)){
			$id = intval($this->request->param('id'));
			$RegionModel->where('region_id',$id)->delete();
			$this->success("数据删除成功！");
			
		}
		if(!empty($ids)){
			$ids=join(",",$this->request->param('ids'));
			if ($RegionModel->where("region_id in (".$ids.")")->delete()) {
				$this->success("数据删除成功！");
			} else {
				$this->error("数据删除失败！");
			}
		}
		
		
		
	}
	
	//更新地区名称
	function ajax_region_update(){
		$parent_id  = intval($_POST['parent_id']);
		$RegionModel = new RegionModel();
		$result = array('error'=>0,'info'=>'');
		$region_id = intval($_POST['region_id']);
		$region_name = trim($_POST['region_name']);
		if(empty($region_name) || empty($region_id)){
			
			$result['error'] = 1;
			$result['info'] = '名称不能为空！';
		
		}else{
		
			$check_name = $RegionModel->where('region_name = "'.$_POST['region_name'].'" and parent_id = '.$parent_id)->find();
			if($check_name){
				$result['error'] = 1;
				$result['info'] = '该名称已经存在！';
			}else{
				$check = $RegionModel->where('region_id = '.$region_id)->setField('region_name',$_POST['region_name']);
			}
		}
		$data = json_encode($result);
		echo $data;
	}
	/**
	 * 获取地区列表的函数。
	 *
	 * @access  public
	 * @param   int     $region_id  上级地区id
	 * @return  void
	 */
	function area_list($region_id=0)
	{
		$RegionModel = new RegionModel();
		$area_arr = array();
		$row = $RegionModel->where('parent_id',$region_id)->order('region_id')->select();	
		return $row;
	}
	
}