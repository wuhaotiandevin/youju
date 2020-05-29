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
		$error =0;
		//用户头像
			//$avatar =  isset($_POST['avatar']) ? $_POST['avatar'] : '';
		//昵称
		if(isset($_POST['nickname']) && !empty($_POST['nickname'])){
			$data['nickname'] =  $_POST['nickname'];
			$error ++;
		}
		//生日
		if(isset($_POST['nickname']) && !empty($_POST['birthday'])){
			$data['birthday'] =  $_POST['birthday'];
			$error ++;
		}
		//地址
		if(isset($_POST['address']) && !empty($_POST['address'])){
			$data['address'] =  $_POST['address'];
			$error ++;
		}
		//个性签名
		if(isset($_POST['gexing']) && !empty($_POST['gexing'])){
			$data['gexing'] =  $_POST['gexing'];
			$error ++;
		}
		if(isset($_POST['province']) && is_numeric($_POST['province'])  && isset($_POST['city'])  && is_numeric($_POST['city']) &&  isset($_POST['district']) && is_numeric($_POST['district']) && isset($_POST['country']) && is_numeric($_POST['country'])){
			$data['province'] =    $_POST['province'] ;
			$data['city'] =    $_POST['city'] ;
			$data['district'] =   $_POST['district'] ;
			$data['country'] =    $_POST['country'] ;
			$error ++;
		}
		if($error > 0){
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
		}else{
			echo json_encode( array('error' => 1,  'errorMsg' => '请求失败'));
			die();
		}
    }
}