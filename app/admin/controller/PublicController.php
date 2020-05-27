<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;

class PublicController extends AdminBaseController
{
    public function _initialize()
    {
    }

    /**
     * 后台登陆界面
     */
    public function login()
    {
        $loginAllowed = session("__LOGIN_BY_CMF_ADMIN_PW__");
        if (empty($loginAllowed)) {
            $this->error('非法登录!', cmf_get_root() . '/');
        }

        $admin_id = session('ADMIN_ID');
        if (!empty($admin_id)) {//已经登录
            redirect(url("admin/Index/index"));
        } else {
            $site_admin_url_password = config("cmf_SITE_ADMIN_URL_PASSWORD");
            $upw                     = session("__CMF_UPW__");
            if (!empty($site_admin_url_password) && $upw != $site_admin_url_password) {
                redirect(ROOT_PATH . "/");
            } else {
                session("__SP_ADMIN_LOGIN_PAGE_SHOWED_SUCCESS__", true);
                $result = hook_one('admin_login');
                if (!empty($result)) {
                    return $result;
                }
                return $this->fetch(":login");
            }
        }
    }

    /**
     * 登录验证
     */
    public function doLogin()
    {
        $loginAllowed = session("__LOGIN_BY_CMF_ADMIN_PW__");
        if (empty($loginAllowed)) {
            $this->error('非法登录!', cmf_get_root() . '/');
        }

        $captcha = $this->request->param('captcha');
        if (empty($captcha)) {
            $this->error(lang('CAPTCHA_REQUIRED'));
        }
        //验证码
        if (!cmf_captcha_check($captcha)) {
            $this->error(lang('CAPTCHA_NOT_RIGHT'));
        }

        $name = $this->request->param("username");
        if (empty($name)) {
            $this->error(lang('USERNAME_OR_EMAIL_EMPTY'));
        }
        $pass = $this->request->param("password");
        if (empty($pass)) {
            $this->error(lang('PASSWORD_REQUIRED'));
        }
        if (strpos($name, "@") > 0) {//邮箱登陆
            $where['user_email'] = $name;
        } else {
            $where['user_login'] = $name;
        }

        $result = Db::name('user')->where($where)->find();

        if (!empty($result) && $result['user_type'] == 1) {
            if (cmf_compare_password($pass, $result['user_pass'])) {
                $groups = Db::name('RoleUser')
                    ->alias("a")
                    ->join('__ROLE__ b', 'a.role_id =b.id')
                    ->where(["user_id" => $result["id"], "status" => 1])
                    ->value("role_id");
                if ($result["id"] != 1 && (empty($groups) || empty($result['user_status']))) {
                    $this->error(lang('USE_DISABLED'));
                }
                //登入成功页面跳转
                session('ADMIN_ID', $result["id"]);
                session('name', $result["user_login"]);
                $result['last_login_ip']   = get_client_ip(0, true);
                $result['last_login_time'] = time();
                $token                     = cmf_generate_user_token($result["id"], 'web');
                if (!empty($token)) {
                    session('token', $token);
                }
                Db::name('user')->update($result);
                cookie("admin_username", $name, 3600 * 24 * 30);
                session("__LOGIN_BY_CMF_ADMIN_PW__", null);
                $this->success(lang('LOGIN_SUCCESS'), url("admin/Index/index"));
            } else {
                $this->error(lang('PASSWORD_NOT_RIGHT'));
            }
        } else {
            $this->error(lang('USERNAME_NOT_EXIST'));
        }
    }

    /**
     * 后台管理员退出
     */
    public function logout()
    {
        session('ADMIN_ID', null);
        return redirect(url('/', [], false, true));
    }

    public function zidong()
    {
        $faxin = Db::name('yuangong')->where('end_time<UNIX_TIMESTAMP(DATE_SUB(CURDATE(),INTERVAL 3 DAY)) and status=1')->select();
        $data =[];
        if(!empty($faxin))
        {
            foreach ($faxin as $key => $value) {
                Db::name('yuangong')->where('id',$value['id'])->update(['status'=>6]);
                $data = Db::name('yuangong')->where('id',$value['id'])->find();
                $data1 = array();
                $data1['user_id'] = $data['mg_id'];
                $data1['money'] = $data['gongzi'];
                $data1['style'] = '收入';
                $data1['pay_time'] = time();
                $data1['status'] = 1;
                Db::name("user_moneyrecord")->insert($data1);
                $data2 = array();
                $data2['user_id'] = $data['user_id'];
                $data2['money'] = $data['gongzi'];
                $data2['style'] = '支出';
                $data2['pay_time'] = time();
                $data2['status'] = 1;
                Db::name("user_moneyrecord")->insert($data2);
                $mg  = Db::name("user")->where('id',$data['mg_id'])->find();
              
                $jine = $data['gongzi'];
                
                $data_m = array(
                'yue'=>array('exp','yue+'.$jine),
                 );
                Db::name('user_moneyinfo')->where('user_id',$data['mg_id'])->update($data_m);
                $data_n = array(
                'dongjie'=>array('exp','dongjie-'.$jine),
                 );
                Db::name('user_moneyinfo')->where('user_id',$data['user_id'])->update($data_n);
            }
        }
        $jiegu = Db::name('yuangong')->where('jiegu_time<UNIX_TIMESTAMP(DATE_SUB(CURDATE(),INTERVAL 3 DAY)) and jiegu=1 and status!=4')->select();
        $data =[];
        if(!empty($jiegu))
        {
            foreach ($jiegu as $key1 => $value1) {
                $data = Db::name('yuangong')->where('id',$value1['id'])->find();
                Db::name('yuangong')->where('id',$value1['id'])->update(['status'=>4]);
                $data2 = array();
                    $data2['user_id'] = $data['user_id'];
                    $data2['money'] = $data['ketui_money'];
                    $data2['style'] = '收入';
                    $data2['pay_time'] = time();
                    $data2['status'] = 1;
                    Db::name("user_moneyrecord")->insert($data2);
                    $data_m = array(
                    'yue'=>array('exp','yue+'.$data['ketui_money']),
                    'dongjie'=>array('exp','dongjie-'.$data['gongzi']),
                     );
                    Db::name('user_moneyinfo')->where('user_id',$data['user_id'])->update($data_m);
                    $jine = $data['gongzi']-$data['ketui_money'];
                    if($jine>0)
                    {
                    $data3 = array();
                    $data3['user_id'] = $data['mg_id'];
                    $data3['money'] = $jine;
                    $data3['style'] = '收入';
                    $data3['pay_time'] = time();
                    $data3['status'] = 1;
                    Db::name("user_moneyrecord")->insert($data3);
                    $data_n = array(
                    'yue'=>array('exp','yue+'.$jine),
                     );
                    Db::name('user_moneyinfo')->where('user_id',$data['mg_id'])->update($data_n);
                    }
            }
        }
    }
}