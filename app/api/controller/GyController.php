<?php

namespace app\api\controller;

use app\admin\model\UserModel;
use think\Db;

class GyController
{

    /**
     * 地区接口
	 * type 登录类型
     * openid
     */
    public function region()
    {
        $list = Db('region')->field('region_id as re_value,parent_id,region_name as re_name')->select();
		$data = $this->getTree($list, 0);
		echo json_encode( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
        die();
    }
	public function getTree($arr, $p_id){    //数据层级化，
		$r = array();
		foreach($arr as $key=>$val){
			if($val['parent_id'] == $p_id) {
				$length = count($r);//0
				$r[$length] = $val;	
				if($t = $this->getTree($arr,$val['re_value'])){//$key
					$r[$length]['children'] = $t;
				}
					
			}
		}
		return $r;
	}
	

}