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
        $type = request()->post('type');
        $sign = request()->post('sign');
        $type =isset($type) ? $type : '';
        $sign = isset($sign) ? $sign : '';

        if (empty($type || $sign)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
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
            return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
        }else{
            return json( array('error' => 0, 'errorMsg' => '请求成功', 'type' => 0, 'typeMsg'=>'绑定手机号'));
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
        $number = $request->post('number');
        $mobile = $request->post('mobile');

        $type =isset($type) ? $type : '';
        $sign = isset($sign) ? $sign : '';//qq weixin mobile唯一标识
        $ip = isset($ip) ? $ip : '';
        $sex = isset($sex) ? $sex : '';
        $avatar = isset($avatar) ? $avatar : '';
        $number = isset($number) ? $number : ''; //qq weixin号
        $mobile = isset($mobile) ? $mobile : '';

        $data['user_type'] = 2;//用户类型
        $data['create_time']=time();
        $data['last_login_time']=time();
        $data['uid'] = getRandNumber(0, 9, 8);
        $data['token'] = settoken();
        $data['last_login_ip']=$ip;
        $data['avatar']=$avatar;
        $data['sex'] = $sex;
        switch ($type) {
            case 'weixin':
                $data['openid']=$sign;
                $data['weixin']=$number;
                break;
            case 'qq':
                $data['qqid']=$sign;
                $data['qq']=$number;
                break;
            case 'mobile':
                $data['mobile']=$sign;
                break;
        }
        if (empty($type || $sign)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }

        $res = Db::name('user')->where('mobile',$mobile)->find();
        if(empty($res)){
            $user = Db::name('user')->insert($data);
            if($user){
                return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
            }else{
                return json( array('error' => 1,  'errorMsg' => '请求失败'));
            }
        }else{

            $data['id'] = $res['id'];
            $user = Db::name('user')->update($data);

            if($user){
                return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
            }else{
                return json( array('error' => 1,  'errorMsg' => '请求失败'));
            }
        }
    }
    /**
     * 修改昵称、性别接口
     * type 登录类型
     * nickname 昵称
     * sex 性别
     */
    public function nickname()
    {
        $request = request();
        $nickname = $request->post('nickname');
        $user_id = $request->post('user_id');
        $sex = $request->post('sex');
        $avatar = $request->post('avatar');

        $user_id =isset($user_id) ? $user_id : '';
        if (empty($user_id)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }
        $data['nickname']=$nickname;
        $data['sex']=$sex;
        $data['avatar']=isset($avatar) ? $avatar: '';
        $user = Db::name('user')->where('uid',$user_id)->update($data);
        if($user){
            return json( array('error' => 0,  'errorMsg' => '请求成功'));
        }else{
            return json( array('error' => 1,  'errorMsg' => '请求失败'));
        }
    }
    /**
     * 绑定用户接口
     * mobile 手机号
     */
    public function bindmobile()
    {
        $request = request();
        $mobile = $request->post('mobile');
        if (empty($mobile) || !isMobile($mobile)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }
        $code =getRandNumber(0, 9, 4);
        $data['mobile'] = $mobile;
        $data['sendtime'] = time();
        $data['code'] = $code;
        $res = Db::name('login_code')->where('mobile',$mobile)->find();
        if(!$res){
            //调用短信接口发送短信并生成短信验证码
//            sendMSG
            $status = Db::name('login_code')->insert($data);
            if($status){
                return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
            }else{
                return json( array('error' => 1,  'errorMsg' => '请求失败'));
            }
        }
        if($res && time() - $res['sendtime']>60){
            //调用短信接口发送短信并生成短信验证码
//            sendMSG
            $data['id'] = $res['id'];
            $status = Db::name('login_code')->update($data);
            if($status){
                return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
            }else{
                return json( array('error' => 1,  'errorMsg' => '请求失败'));
            }
        }else{
            return json( array('error' => 1,  'errorMsg' => '请求失败'));
        }
    }
    /**
     * 检查短信验证码接口
     * mobile 手机号
     * code 验证码
     */
    public function cheke_login_code()
    {
        $request = request();
        $mobile = $request->post('mobile');
        $code = $request->post('code');
        if (empty($mobile)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }
        $data['mobile'] = $mobile;
        $data['code'] = $code;
        $res = Db::name('login_code')->where('mobile',$mobile)->find();
        if(!empty($res) && $res['code'] == $code){
            return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));
        }else{
            return json( array('error' => 1,  'errorMsg' => '请求失败'));
        }
    }
}