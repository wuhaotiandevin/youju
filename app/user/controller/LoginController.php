<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace app\user\controller;


use think\Validate;
use cmf\controller\HomeBaseController;
use app\user\model\UserModel;
use think\Db;

class LoginController extends HomeBaseController
{

    /**
     * 登录
     */
    public function index()
    {
        $redirect = $this->request->post("redirect");
        if (empty($redirect)) {
            $redirect = $this->request->server('HTTP_REFERER');
        } else {
            $redirect = base64_decode($redirect);
        }
        session('login_http_referer', $redirect);
        if (cmf_is_user_login()) { //已经登录时直接跳到首页
            return redirect($this->request->root() . '/');
        } else {
            return $this->fetch(":login");
        }
    }

    /**
     * 登录验证提交
     */
    public function doLogin()
    {
        if ($this->request->isPost()) {
            $validate = new Validate([
                'username' => 'require',
                'password' => 'require|min:6|max:32',
            ]);
            $validate->message([
                'username.require' => '用户名不能为空',
                'password.require' => '密码不能为空',
                'password.max'     => '密码不能超过32个字符',
                'password.min'     => '密码不能小于6个字符',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }

            /*if (!cmf_captcha_check($data['captcha'])) {
                $this->error('验证码错误');
            }*/

            $userModel         = new UserModel();
            $user['user_pass'] = $data['password'];
            if (Validate::is($data['username'], 'email')) {
                $user['user_email'] = $data['username'];
                $log                = $userModel->doEmail($user);
            } else if (preg_match('/(^(13\d|15[^4\D]|17[013678]|18\d)\d{8})$/', $data['username'])) {
                $user['mobile'] = $data['username'];
                $log            = $userModel->doMobile($user);
            } else {
                $user['user_login'] = $data['username'];
                $log                = $userModel->doName($user);
            }
            $session_login_http_referer = session('login_http_referer');
            $redirect                   = empty($session_login_http_referer) ? $this->request->root() : $session_login_http_referer;
            switch ($log) {
                case 0:
                    cmf_user_action('login');
                    $this->success('登录成功', $redirect);
                    break;
                case 1:
                    $this->error('登录密码错误');
                    break;
                case 2:
                    $this->error('账户不存在');
                    break;
                case 3:
                    $this->error('您的账号目前在审核中...');
                    break;
                default :
                    $this->error('未受理的请求');
            }
        } else {
            $this->error("请求错误");
        }
    }


    /**
     * 找回密码
     */
    public function findPassword()
    {
        return $this->fetch('/find_password');
    }

    

    /**
     * 用户密码重置
     */
    public function passwordReset()
    {

        if ($this->request->isPost()) {
            $validate = new Validate([
                'verification_code' => 'require',
                'password'          => 'require|min:6|max:32',
            ]);
            $validate->message([
                'password.require'          => '密码不能为空',
                'password.max'              => '密码不能超过32个字符',
                'password.min'              => '密码不能小于6个字符',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }

           
            $errMsg = cmf_check_verification_code($data['mobile'], $data['verification_code']);
            if (!empty($errMsg)) {
                $this->error($errMsg);
            }

            $userModel = new UserModel();
            if (preg_match('/(^(13\d|15[^4\D]|17[013678]|18\d)\d{8})$/', $data['mobile'])) {
                $user['mobile'] = $data['mobile'];
                $log            = $userModel->mobilePasswordReset($data['mobile'], $data['password']);
            } else {
                $log = 2;
            }
            switch ($log) {
                case 0:
                    $this->success('密码重置成功', $this->request->root());
                    break;
                case 1:
                    $this->error("您的手机号尚未注册");
                    break;
                case 2:
                    $this->error("您输入的手机号格式错误");
                    break;
                default :
                    $this->error('未受理的请求');
            }

        } else {
            $this->error("请求错误");
        }
    }

    public function bangding()
    {
        $this->assign('a','');
        $data = $this->request->param();
        $result = Db::name("third_party_user")->where('openid', $data['openid'])->find();
        $data1   = Db::name("user")->where('id', $result['user_id'])->find();
        if(empty($data1)){$this->redirect('/');}
        $this->assign('user1',$data1);
        $this->assign('union',$result['union_id']);
        $this->assign('openid',$data['openid']);
        return $this->fetch('/bangding');
    }

    public function bdpost()
    {
           $rules = [
                'verification_code' => 'require',
                'username' => 'require',
                'mobile'=>'require',
                'password' => 'require|min:6|max:32',
            ];
            $validate = new Validate($rules);
            $validate->message([
                'password.require' => '密码不能为空',
                'password.max'     => '密码不能超过32个字符',
                'password.min'     => '密码不能小于6个字符',
                'username.require'=>'用户名不能为空',
                'mobile.require'=>'手机号不能为空',
                'verification_code.require'=>'验证码不能为空',
            ]);
            $data = $this->request->post();
             if (!$validate->check($data)) {
                $this->error($validate->getError());
            }

            $errMsg = cmf_check_verification_code($data['mobile'], $data['verification_code']);
            if (!empty($errMsg)) {
                $this->error($errMsg);
            }
            $result = Db::name("user")->where('user_login', $data['username'])->find();
             if (!empty($result))
             {
                $this->error("您输入的账号已注册过");
             }
             else
             {
                if (preg_match('/(^(13\d|15[^4\D]|17[013678]|18\d)\d{8})$/', $data['mobile'])) {
                  $result = Db::name("user")->where('mobile', $data['mobile'])->find();
                  if (empty($result)) {
                    $user1   = [
                    'user_login'      => $data['username'],
                    'mobile'          => $data['mobile'],
                    'user_pass'       => cmf_password($data['password']),
                    "user_type"       => 2,//会员
                   ];
                   Db::name("user")->where('id',$data['user_id'])->update($user1);
                   $user2   = Db::name("user")->where('id', $data['user_id'])->find();
                   cmf_update_current_user($user2);
                   $this->success('绑定成功', url('/user/profile/center'));
                    }
                    else
                    {
                        $this->error("您的手机号已注册过");
                    }
               
            } else {
                $this->error("您输入的手机号格式错误");
                }

    }
    }

    public function bdpost1()
    {
        $validate = new Validate([
                    'username' => 'require',
                    'password' => 'require|min:6|max:32',
                ]);
                $validate->message([
                    'username.require' => '用户名不能为空',
                    'password.require' => '密码不能为空',
                    'password.max'     => '密码不能超过32个字符',
                    'password.min'     => '密码不能小于6个字符',
                ]);

                $data = $this->request->post();
                if (!$validate->check($data)) {
                    $this->error($validate->getError());
                }
                $userModel         = new UserModel();
                $user['user_pass'] = $data['password'];
                if (preg_match('/(^(13\d|15[^4\D]|17[013678]|18\d)\d{8})$/', $data['username'])) {
                    $user['mobile'] = $data['username'];
                    $log            = $userModel->doMobile($user);
                } else {
                    $user['user_login'] = $data['username'];
                    $log                = $userModel->doName($user);
                }
                switch ($log) {
                    case 0:
                        cmf_user_action('login');
                        $user = cmf_get_current_user();
                        Db::name("third_party_user")->where('user_id',$data['user_id'])->update(['user_id'=>$user['id']]);
                        Db::name("user")->where('id',$data['user_id'])->delete();
                        $this->success('绑定成功', url('/user/profile/center'));
                        break;
                    case 1:
                        $this->error('登录密码错误');
                        break;
                    case 2:
                        $this->error('账户不存在');
                        break;
                    case 3:
                        $this->error('您的账号已封号,有问题请联系管理员...');
                        break;
                    default :
                        $this->error('未受理的请求');
                }
    }

    public function wxlogin()
    {
        $this->config =Db('plugin')->where('name','Wxlogin')->value('config');
        $this->config = json_decode($this->config,true);
     $AppID = $this->config['appid'];
     $AppSecret = $this->config['appsecret'];
     $callback  =  $this->request->domain().'/user/login/weixin/'; //回调地址
    //微信登录
     session_start();
    //-------生成唯一随机串防CSRF攻击
     $state  = md5(uniqid(rand(), TRUE));
     session("wx_state",$state); //存到SESSION
     $callback = urlencode($callback);
     $wxurl = "https://open.weixin.qq.com/connect/qrconnect?appid=".$AppID."&redirect_uri=".$callback."&response_type=code&scope=snsapi_login&state=".$state."#wechat_redirect";
     return redirect($wxurl);
    }

    public function weixin()
    {
     $data      = $this->request->param();
     $array = json_decode($this->openid($data),true);
     //var_export($array);exit();
     $openid = $array['openid'];
     $user_info['openid'] = $openid;
     $user_info['user_pass'] ='123456';
     $log = $this->registerOauth($user_info);
             switch ($log) {
                case '0':
                    $this->redirect('/user/login/bangding',array('openid'=>$openid));
                    break;
                
                default:
                    $this->redirect('/user/profile/center');
                    break;
            }
       
    }

    function registerOauth($user){
        $openid = $user['openid'];
        $result = Db::name("third_party_user")->where('openid', $openid)->find();
        if (empty($result)) {
            $data   = [
                'user_login'      => '',
                'user_pass'       => cmf_password($user['user_pass']),
                'last_login_ip'   => get_client_ip(0, true),
                'create_time'     => time(),
                'last_login_time' => time(),
                'user_status'     => 2,
                "user_type"       => 0,//会员
            ];
            $userId = Db::name("user")->insertGetId($data);
            $data   = Db::name("user")->where('id', $userId)->find();
            $userdata   = [
                'user_id'      => $userId,
                'openid'      => $openid,
                'union_id'      => "微信",
                'create_time'      => time(),
                'last_login_time'      => time(),
            ];
            $partyuserId = Db::name("third_party_user")->insertGetId($userdata);
            //cmf_update_current_user($data);
            return 0;
        }else{
            $data   = Db::name("user")->where('id', $result['user_id'])->find();
            if($data['user_type']==0)
            {
              return 0; 
            }
            else
            {
            cmf_update_current_user($data);
            return 1;
            }
            
        }
        //return 1;
}

    public function openid($data)
       {
        //if($data['state']!=session("wx_state")){
        // exit("5001");
        // }
        $post_data = array();
        $this->config =Db('plugin')->where('name','Wxlogin')->value('config');
        $this->config = json_decode($this->config,true);
        $post_data['appid'] = $this->config['appid'];
        $post_data['secret'] = $this->config['appsecret'];
        $post_data['code'] = $data['code'];
        $post_data['grant_type'] = 'authorization_code'; 
        $o='';  
        foreach ($post_data as $k=>$v)
        {
           $o.="$k=".urlencode($v).'&';
        }
        $post_data=substr($o,0,-1);
        $url='https://api.weixin.qq.com/sns/oauth2/access_token?'.$post_data;
        $httph =curl_init($url);
        curl_setopt($httph, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($httph, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($httph,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($httph, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");
        
        curl_setopt($httph, CURLOPT_RETURNTRANSFER,1);
        //curl_setopt($httph, CURLOPT_HEADER,1);
        $rst=curl_exec($httph);
        curl_close($httph);
        return $rst;
     }


    




}