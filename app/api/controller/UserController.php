<?php

namespace app\api\controller;

use app\admin\model\UserModel;
use think\Db;

class UserController
{
    /**
     * 登录接口
	 * type 登录类型
     * sign 微信、qq、手机号标识
     */
    public function login()
    {
        $type =isset($_POST['type']) ? $_POST['type'] : '';
        $sign = isset($_POST['sign']) ? $_POST['sign'] : '';
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
            ->field('id,nickname,mobile,avatar,token')
            ->find();
        if($user){
            $data['userid'] = $user['id'];
            $data['nickname'] = $user['nickname'];
            $data['mobile'] = $user['mobile'];
            $data['avatar'] = cmf_get_image_preview_url($user['avatar']);
            $data['token'] = $user['token'];
            echo json_encode( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
            die();
        }else{
            echo json_encode( array('error' => 0, 'errorMsg' => '绑定手机号', 'type' => 0, 'typeMsg'=>'绑定手机号'));
            die();
        }
    }
    /**
     * 绑定手机号接口
     * type 登录类型
     * sign 微信、qq、手机号标识
     */
    public function bindmobile()
    {
        $type =isset($_POST['type']) ? $_POST['type'] : '';
        $sign = isset($_POST['sign']) ? $_POST['sign'] : '';
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