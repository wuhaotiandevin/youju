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
					  ->field('a.title,url,image,width,height')
					  ->select();
			$data = array();
			if($slides){
				foreach($slides as $k=>$v){
					$data[$k]['title']=$v['title'];
					if(!empty($v['url']))
						$data[$k]['url']=$v['url'];
					else
						$data[$k]['url']=cmf_get_image_preview_url($v['image']);
					$data[$k]['width'] = $v['width'];
					$data[$k]['height']=$v['height'];
					$data[$k]['href']=$v['href'];

				}
				echo json_encode( array('code' => 0,  'msg' => '请求成功','data'=>$data));
				die();
			}else{
				echo json_encode( array('code' => 100,  'msg' => '暂无资源'));
				die();
			}
    }

    
}