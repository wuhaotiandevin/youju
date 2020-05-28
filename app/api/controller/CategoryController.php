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
    public function get_categoty()
    {
        $code=isset($_GET['code'])?$_GET['code']:'';
        if(empty($code)){
            echo json_encode( array('code' => 1,  'msg' => '请求失败'));
            die();
        }
        if($code == 'is_tuijian'){
            $where['is_tuijian'] = 1;

        }elseif($code == 'is_hot'){
            $where['is_hot'] = 1;

        }else{
            $where = [];
        }
        $cats = Db::name('category')
                  ->where($where)
                  ->order('list_order DESC')
                  ->field('id,cat_name,img_z,width,height')
                  ->select();
        $data = array();
        if($cats){
            foreach($cats as $k=>$v){
                $data[$k]['title']=$v['cat_name'];
                if(!empty($v['img_z'])){
                    $data[$k]['url']=cmf_get_image_preview_url($v['img_z']);
                    $size = @getimagesize( $data[$k]['url']);
                    $data[$k]['width']=$size[0];
                    $data[$k]['height']=$size[1];
                }
                else {
                    $data[$k]['url'] = '';
                }
            }
            halt($data);
            echo json_encode( array('code' => 0,  'errorMsg' => '请求成功','data'=>$data));
            die();
        }else{
            echo json_encode( array('code' => 1,  'errorMsg' => '暂无资源'));
            die();
        }
    }
    /**
     * 品类接口
     * $code 关键字标识
     */
    public function get_categoty_all()
    {
        $cats1 = Db::name('category')
            ->where("parent_id",0)
            ->order('list_order DESC')
            ->field('id,cat_name')
            ->select();

        $data = array();
        if($cats1){
            foreach($cats1 as $k=>$v){
                $data[$k]['title']=$v['cat_name'];
                if(!empty($v['img_z'])){
                    $data[$k]['url']=cmf_get_image_preview_url($v['img_z']);
                    $size = @getimagesize( $data[$k]['url']);
                    $data[$k]['width']=$size[0];
                    $data[$k]['height']=$size[1];
                }
                else {
                    $data[$k]['url'] = '';
                }
                $cats2 = Db::name('category')
                    ->where("parent_id",$v['id'])
                    ->order('list_order DESC')
                    ->field('id,cat_name')
                    ->select();

                $data[$k]['child']=$cats2;;

            }
            echo json_encode( array('code' => 0,  'errorMsg' => '请求成功','data'=>$data));
            die();
        }else{
            echo json_encode( array('code' => 1,  'errorMsg' => '暂无资源'));
            die();
        }
    }
}