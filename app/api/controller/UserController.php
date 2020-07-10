<?php

namespace app\api\controller;

use plugins\mobile_code_demo\MobileCodeDemoPlugin;
//use Token;
use think\Cache;

use think\Db;
use think\Request;

class UserController
{
    /**
     * 登录接口
	 * type 登录类型
     * sign 微信、qq、手机号标识
     */
    public function login(Request $request)
    {
        $redis = new \Redis();
        $redis->connect('127.0.0.1', 6379);
//        $redis->flushAll();
        $user = Db::table('cmf_user')->find(58);

        foreach ($user as $k=>$v){

            $redis->hSet($user['id'],$k,$v);
        }
//        halt($user);
//        halt($user);
//        $redis->hSet('h','k1','v1');
////        $redis->hSet('h','k2','v2');
////        $redis->hSet('h','k3','v3');
/// 'create_time','user_status'
        $field=array('guanzhu','user_status');
        $res = $redis->rPush($user['id'],);

        halt($res);
        $param = $request->param();
        if(!Cache::get('username')){
            Cache::set('username',$param['username']);
        }

        halt(Cache::get('username'));
//        $jwtToken = new \token\Token();
//        $tokenData = array(
//        'openid' => 11,
////        'uniacid' => $_W['uniacid'],
//    );
//        $token = $jwtToken->createToken($tokenData);
//halt($token);
        $_SERVER['HTTP_AUTHORIZATION'] = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1OTExOTczNzAsIm5iZiI6MTU5MTE5NzM3MCwiZXhwIjoxNTkxMjA0NTcwLCJkYXRhIjp7Im9wZW5pZCI6MTF9fQ.GluT5N38A-6O9DBzAP9ulbEaQjQgzYFUTf2CS9aBRbo";
        if (empty($_SERVER['HTTP_AUTHORIZATION']))
        {
            $res['status']="201";
            $res['msg']="no token";
            $res['data']="";//返回的数据
//            sendResponse($res,401,'Unauthorized');
        }
        $token = $_SERVER['HTTP_AUTHORIZATION'];
        $jwtToken = new \token\Token();
        $checkToken = $jwtToken->checkToken($token);
       $checkToken['data']['iat'] = date('Y-m-d,H:i:s',$checkToken['data']['iat']);
       $checkToken['data']['nbf'] = date('Y-m-d,H:i:s',$checkToken['data']['nbf']);
        $checkToken['data']['exp'] = date('Y-m-d,H:i:s',$checkToken['data']['exp']);

        halt($checkToken);
        $data = $checkToken['data']['data'];


        halt($data);


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
        $data['id']=$user_id;
        $data['nickname']=$nickname;
        $data['sex']=$sex;
        $data['avatar']=isset($avatar) ? $avatar: '';
        $user = Db::name('user')->update($data);
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
//        if (empty($mobile) || !isMobile($mobile)) {
//            return json(array('error' => 1, 'errorMsg' => '请求失败'));
//        }
        $code =getRandNumber(0, 9, 4);
        $data['mobile'] = 18700909632;//$mobile;
//        $data['sendtime'] = time();
        $data['code'] = $code;
        $MobileCodeDemoPlugin = new MobileCodeDemoPlugin;
        $MobileCodeDemoPlugin->sendMobileVerificationCode($data);
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