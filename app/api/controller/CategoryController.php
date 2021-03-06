<?php

namespace app\api\controller;

use app\admin\model\CategoryModel;
use think\Db;

class CategoryController
{

    /**
     * 品类接口
	 * $code 关键字标识
     */
    public function index()
    {
		
		$uid  = isset($_POST['uid'])?$_POST['uid']:'';
		$all =  isset($_POST['all'])?$_POST['all']:'';
		$cats = Db::name('user_category')
				->alias('a')
				->join('category b','a.category_id=b.id','LEFT')
				->order('create_time DESC')
				->field('b.id,b.cat_name,img_z,width,height')
				->select();
		$mycats = array();
		$my =array();
		if($cats){
			foreach($cats as $k=>$v){
				$mycats[$k]['cid']    = $v['id'];
				$mycats[$k]['title'] = $v['cat_name'];
				$mycats[$k]['img']   = cmf_get_image_preview_url($v['img_z']);
                $mycats[$k]['width'] = $v['width'];
                $mycats[$k]['height']= $v['height'];
				$my[]=$v['id'];
			}
		}
		$where =[];
		if($all){
			$cats = Db::name('category')
                  ->where($where)
                  ->order('list_order DESC')
                  ->field('id,cat_name,img_z,width,height,parent_id,is_hot')
                  ->select();
			$parentData  =array();
			$hot =array();
			$j=0;
			if($cats){
					foreach($cats as $k=>$v){
						if($v['parent_id']){
							$data=array();
							$data['cid']=$v['id'];
							$data['title']=$v['cat_name'];
							$data['url']=cmf_get_image_preview_url($v['img_z']);
							$data['width']=$v['width'];
							$data['height']=$v['height'];
							$data['my_cat']= (in_array($v['id'],$my)) ? 1 : 0; 
							$parentData[$v['parent_id']]['children'][]=$data;
						}else{
							$parentData[$v['id']]['cid']	=	$v['id'];
							$parentData[$v['id']]['title']	=	$v['cat_name'];
						}
						if($v['is_hot']){
							$hot[$j]['cid']=$v['id'];
							$hot[$j]['title']=$v['cat_name'];
							$hot[$j]['url']=cmf_get_image_preview_url($v['img_z']);
							$hot[$j]['width']=$v['width'];
							$hot[$j]['height']=$v['height'];
							$hot[$j]['my_cat']= (in_array($v['id'],$my)) ? 1 : 0; 
						}
						
					}
					$parentDatas = array();
					if($parentData){
						$i=0;
						foreach($parentData as $k=>$v){
							$parentDatas[$i]	= $v;
							$i++;
						}
					}
					echo json_encode( array('error' => 0,  'errorMsg' => '请求成功','data'=>$parentDatas,'hotcats'=>$hot,'mycats'=>$mycats));
					die();
			}else{
					echo json_encode( array('error' => 1,  'errorMsg' => '暂无资源'));
					die();
			}
		}else{
			echo json_encode( array('error' => 0,  'errorMsg' => '','data'=>$mycats));
			die();
		}
    }
	/**
     * 用户品类添加接口
     */
	public function mycats()
	{
			$uid=isset($_POST['uid'])?$_POST['uid']:'';
			$mycats=isset($_POST['mycats'])?$_POST['mycats']:'';
			if(empty($uid)){
				echo json_encode( array('error' => 1,  'errorMsg' => '请求失败'));
				die();
			}
			$where['uid'] = $uid;
			$user = Db::name('user')
                  ->where($where)
                  ->field('id')
                  ->find();
			if($user){
				//1.先清空用户拥有的品类
				Db::name('user_category')
                  ->where($where)
                  ->delete();
				//2.在添加用户品类
				if($mycats){
					foreach($mycats as $k=>$v){
						$data[]=array(
							'uid'			=>	$uid,
							'category_id'	=>	$v,
							'create_time'	=>	time()
						);
					}
					Db::name('user_category')->insertAll($data);
				}
				echo json_encode( array('error' => 0,  'errorMsg' => '保存成功'));
				die();
			}else{
				echo json_encode( array('error' => 1,  'errorMsg' => '请求失败'));
				die();
			}
	}
   
}