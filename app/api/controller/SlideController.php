<?php

namespace app\api\controller;

use app\admin\model\SlideModel;
use think\Db;

class SlideController 
{

    /**
     * 轮播图接口
	 * code 轮播图位置 唯一码
     */
    public function index()
    {
			$code=isset($_POST['code'])?$_POST['code']:'';
			if(empty($code)){
				echo json_encode( array('code' => 100,  'msg' => '请求失败'));
				die();
			}
			
			$slides = Db::name('slide_item')
					  ->alias('a')
					  ->join('slide b','a.slide_id=b.id','LEFT')
					  ->where('a.status', 1)
					  ->where('b.status', 1)
					  ->where('remark', $code)
					  ->order('list_order DESC')
					  ->field('a.title,url,image')
					  ->select();
			$data = array();
			if($slides){
				foreach($slides as $k=>$v){
					$data[$k]['title']=$v['title'];
					if(!empty($v['url']))
						$data[$k]['url']='http://192.168.0.177/upload/'.$v['url'];
					else
						$data[$k]['url']='http://192.168.0.177/upload/'.$v['image'];
				}
				echo json_encode( array('code' => 0,  'msg' => '请求成功','data'=>$data));
				die();
			}else{
				echo json_encode( array('code' => 100,  'msg' => '暂无资源'));
				die();
			}
    }

    
}