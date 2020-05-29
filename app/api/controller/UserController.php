<?php

namespace app\api\controller;

use app\admin\model\UserModel;
use think\Db;

class UserController
{

    /**
     * 用户接口
	 * type 登录类型
     * openid
     */
    public function login()
    {
        $type = 'weixin';//isset($_POST['type']) ? $_POST['type'] : '';
        $sign = 124;//isset($_POST['sign']) ? $_POST['sign'] : '';
        if (empty($type || $sign)) {
            echo json_encode(array('error' => 1, 'errorMsg' => '请求失败'));
            die();
        }
        switch ($type) {
            case 'weixin':
                $where['openid']=$sign;
                break;
            case 'qq':
                $where['qqid']=$sign;
                break;
            case 'mobile':
                $where['mobile']=$sign;
                break;
        }
        $user = Db::name('user')
            ->where($where)
            ->field('id,nickname,mobile,avatar')
            ->find();
        if($user){
            $user['avatar'] = cmf_get_image_preview_url($user['avatar']);
            echo json_encode( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $user));
            die();
        }else{
            echo json_encode( array('error' => 1,  'errorMsg' => '绑定手机号'));
            die();
        }
    }
}