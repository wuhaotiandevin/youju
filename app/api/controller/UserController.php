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
//        file_put_contents ( './test.txt' ,request());
//        halt(request()->post('type'));
        $type = request()->post('type');
        $sign = request()->post('sign');
        $type =isset($type) ? $type : '';
        $sign = isset($sign) ? $sign : '';

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
            echo json_encode( array('error' => 0, 'errorMsg' => '请求成功', 'type' => 0, 'typeMsg'=>'绑定手机号'));
            die();
        }
    }
    /**
     * 存入数据库接口
     * type 登录类型
     * sign 微信、qq、手机号标识
     */
    public function insert()
    {
        $request = request();
        $type = $request->post('type');
        $sign = $request->post('sign');
        $ip = $request->post('ip');
        $sex = $request->post('sex');
        $avatar = $request->post('avatar');
        $weixin = $request->post('avatar');

        $type =isset($type) ? $type : '';
        $sign = isset($sign) ? $sign : '';
        $ip = isset($ip) ? $ip : '';
        $sex = isset($sex) ? $sex : '';
        $avatar = isset($avatar) ? $avatar : '';

        if (empty($type || $sign)) {
            return json_encode(array('error' => 1, 'errorMsg' => '请求失败'));
        }
        $data['user_type'] = 2;//用户类型
        $data['create_time']=time();
        $data['last_login_time']=time();
        $data['uid'] = nonceStr();
        $data['token'] = create_token($data['uid'],strtotime('+ 5 days'));
        $data['last_login_ip']=$ip;
        $data['avatar']=$avatar;
        $data['sex'] = $sex;
        switch ($type) {
            case 'weixin':
                $data['openid']=$sign;
                break;
            case 'qq':
                $data['qqid']=$sign;
                break;
            case 'mobile':
                $data['mobile']=$sign;
                break;
        }
        $user = Db::name('user')->insert($data);
        if($user){
            return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
        }else{
            return json_encode( array('error' => 0,  'errorMsg' => '请求失败'));
        }
    }
}