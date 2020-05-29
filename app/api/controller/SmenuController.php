<?php

namespace app\api\controller;

use app\admin\model\SlideModel;
use think\Db;

class SmenuController 
{

    /**
     * 首页图接口
     */
    public function index()
    {

			$smenu = Db::name('smenu')
					  ->order('list_order DESC')
					  ->field('title,image,width,height,href')
					  ->select();
			$data = array();
			if($smenu){
				foreach($smenu as $k=>$v){
					$data[$k]['title']=$v['title'];
					$data[$k]['url']=cmf_get_image_preview_url($v['image']);
					$data[$k]['width'] = $v['width'];
					$data[$k]['height']=$v['height'];
					$data[$k]['href']= !empty($v['href'])?$v['href']:'';

				}
				echo json_encode( array('error' => 0,  'errorMsg' => '请求成功','data'=>$data));
				die();
			}else{
				echo json_encode( array('error' => 1,  'errorMsg' => '暂无资源'));
				die();
			}
    }

    
}