<?php

namespace app\api\controller;

use app\admin\model\UserModel;
use think\Db;

class UsermessageController
{

    /**
     * 用户信息修改接口
	 * uid 用户
     */
    public function editusermessage()
    {
        $uid = isset($_POST['uid']) ? $_POST['uid'] : '';
        if (empty($uid)) {
            echo json_encode(array('error' => 1, 'errorMsg' => '请求失败'));
            die();
        }
		//用户头像
			//$avatar =  isset($_POST['avatar']) ? $_POST['avatar'] : '';
		//昵称
		if(isset($_POST['nickname']) && !empty($_POST['nickname'])){
			$data['nickname'] =  $_POST['nickname'];
		}
		//生日
		if(isset($_POST['nickname']) && !empty($_POST['birthday'])){
			$data['birthday'] =  $_POST['birthday'];
		}
		//地址
		if(isset($_POST['address']) && !empty($_POST['address'])){
			$data['address'] =  $_POST['address'];
		}
		//个性签名
		if(isset($_POST['gexing']) && !empty($_POST['gexing'])){
			$data['gexing'] =  $_POST['gexing'];
		}
		if(isset($_POST['province']) && isset($_POST['city']) &&  isset($_POST['district']) && isset($_POST['country'])){
			$data['province'] =    $_POST['province'] ;
			$data['city'] =    $_POST['city'] ;
			$data['$district'] =   $_POST['district'] ;
			$data['country'] =    $_POST['country'] ;
		}
		$where['uid'] = $uid;
        $user = Db::name('user')
            ->where($where)
            ->update($data);
        $users = Db::name('user')
            ->where($where)
            ->find();
        if($user){
            echo json_encode( array('error' => 0,  'errorMsg' => '保存成功', 'data' => $users));
            die();
        }else{
            echo json_encode( array('error' => 1,  'errorMsg' => '请求失败'));
            die();
        }
    }
}