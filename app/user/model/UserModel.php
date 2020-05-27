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
namespace app\user\model;

use think\Db;
use think\Model;

class UserModel extends Model
{
    public function doMobile($user)
    {
        $userQuery = Db::name("user")->where('user_type!=1');

        $result = $userQuery->where('mobile', $user['mobile'])->find();


        if (!empty($result)) {
            if($result['shenhe']==0)
            {
                $result['user_type']=2;
            }
            $comparePasswordResult = cmf_compare_password($user['user_pass'], $result['user_pass']);
            $hookParam =[
                'user'=>$user,
                'compare_password_result'=>$comparePasswordResult
            ];
            hook_one("user_login_start",$hookParam);
            if ($comparePasswordResult) {
                //拉黑判断。
                if($result['user_status']==0){
                    return 3;
                }
                session('user', $result);
                $data = [
                    'last_login_time' => time(),
                    'last_login_ip'   => get_client_ip(0, true),
                ];
                $userQuery->where('id', $result["id"])->update($data);
                return 0;
            }
            return 1;
        }
        $hookParam =[
            'user'=>$user,
            'compare_password_result'=>false
        ];
        hook_one("user_login_start",$hookParam);
        return 2;
    }

    public function doName($user)
    {
        $userQuery = Db::name("user")->where('user_type!=1');

        $result = $userQuery->where('user_login', $user['user_login'])->find();
        if (!empty($result)) {
            if($result['shenhe']==0)
            {
                $result['user_type']=2;
            }
            $comparePasswordResult = cmf_compare_password($user['user_pass'], $result['user_pass']);
            $hookParam =[
                'user'=>$user,
                'compare_password_result'=>$comparePasswordResult
            ];
            hook_one("user_login_start",$hookParam);
            if ($comparePasswordResult) {
                //拉黑判断。
                if($result['user_status']==0){
                    return 3;
                }
                session('user', $result);
                $data = [
                    'last_login_time' => time(),
                    'last_login_ip'   => get_client_ip(0, true),
                ];
                $userQuery->where('id', $result["id"])->update($data);
                return 0;
            }
            return 1;
        }
        $hookParam =[
            'user'=>$user,
            'compare_password_result'=>false
        ];
        hook_one("user_login_start",$hookParam);
        return 2;
    }

    public function doEmail($user)
    {

        $userQuery = Db::name("user");

        $result = $userQuery->where('user_email', $user['user_email'])->find();


        if (!empty($result)) {
            if($result['shenhe']==0)
            {
                $result['user_type']=2;
            }
            $comparePasswordResult = cmf_compare_password($user['user_pass'], $result['user_pass']);
            $hookParam =[
                'user'=>$user,
                'compare_password_result'=>$comparePasswordResult
            ];
            hook_one("user_login_start",$hookParam);
            if ($comparePasswordResult) {

                //拉黑判断。
                if($result['user_status']==0){
                    return 3;
                }
                session('user', $result);
                $data = [
                    'last_login_time' => time(),
                    'last_login_ip'   => get_client_ip(0, true),
                ];
                $userQuery->where('id', $result["id"])->update($data);
                return 0;
            }
            return 1;
        }
        $hookParam =[
            'user'=>$user,
            'compare_password_result'=>false
        ];
        hook_one("user_login_start",$hookParam);
        return 2;
    }

    public function registerEmail($user)
    {
        $userQuery = Db::name("user");
        $result    = $userQuery->where('user_email', $user['user_email'])->find();

        $userStatus = 1;

        // if (cmf_is_open_registration()) {
        //     $userStatus = 2;
        // }

        if (empty($result)) {
            $data   = [
                'user_login'      => '',
                'user_email'      => $user['user_email'],
                'mobile'          => '',
                'user_pass'       => cmf_password($user['user_pass']),
                'last_login_ip'   => get_client_ip(0, true),
                'create_time'     => time(),
                'last_login_time' => time(),
                'user_status'     => $userStatus,
                "user_type"       => 2,
            ];
            $userId = $userQuery->insertGetId($data);
            Db::name("user_moneyinfo")->insert(['user_id'=>$userId]);
            $date   = $userQuery->where('id', $userId)->find();
            cmf_update_current_user($date);
            return 0;
        }
        return 1;
    }

    public function registerMobile($user)
    {
        $result = Db::name("user")->where('mobile', $user['mobile'])->find();

        $userStatus = 1;

        // if (cmf_is_open_registration()) {
        //     $userStatus = 2;
        // }

        if (empty($result)) {
            $data   = [
                'user_login'      => $user['username'],
                'user_email'      => '',
                'mobile'          => $user['mobile'],
                'user_pass'       => cmf_password($user['user_pass']),
                'last_login_ip'   => get_client_ip(0, true),
                'create_time'     => time(),
                'last_login_time' => time(),
                'user_status'     => $userStatus,
                "user_type"       => $user['user_type'],//会员
            ];
            $userId = Db::name("user")->insertGetId($data);
            $uid = 100000+$userId;
            Db('user')->where('id',$userId)->update(['uid'=>$uid]);
            $data   = Db::name("user")->where('id', $userId)->find();
            cmf_update_current_user($data);
            cmf_send_message($userId,'欢迎注册陪玩网','陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。');
            return 0;
        }
        return 1;
    }

    /**
     * 通过邮箱重置密码
     * @param $email
     * @param $password
     * @return int
     */
    public function emailPasswordReset($email, $password)
    {
        $result = $this->where('user_email', $email)->find();
        if (!empty($result)) {
            $data = [
                'user_pass' => cmf_password($password),
            ];
            $this->where('user_email', $email)->update($data);
            return 0;
        }
        return 1;
    }

    /**
     * 通过手机重置密码
     * @param $mobile
     * @param $password
     * @return int
     */
    public function mobilePasswordReset($mobile, $password)
    {
        $userQuery = Db::name("user");
        $result    = $userQuery->where('mobile', $mobile)->find();
        if (!empty($result)) {
            $data = [
                'user_pass' => cmf_password($password),
            ];
            $userQuery->where('mobile', $mobile)->update($data);
            return 0;
        }
        return 1;
    }

    public function editData($user)
    {
        $userId           = cmf_get_current_user_id();
        $data['sex'] = $user['sex'];
        //$data['mobile'] = $user['mobile'];
        $data['qq'] = $user['qq'];
        $data['province'] = $user['province'];
        $data['city'] = $user['city'];
        $data['district'] = $user['district'];
        $data['weixin'] = $user['weixin'];
        $data['birthday'] = strtotime($user['birthday']);
        $data['gexing'] = $user['gexing'];
        $data['jieshao'] = $user['jieshao'];
        $data['yuyin'] = $user['yuyin'];
        $userQuery        = Db::name("user");
        if ($userQuery->where('id', $userId)->update($data)) {
            $userInfo = $userQuery->where('id', $userId)->find();
            cmf_update_current_user($userInfo);
            return 1;
        }
        return 0;
    }

    public function editData1($user)
    {
        $userId           = cmf_get_current_user_id();
        //$data['avatar'] = $user['avatar'];
        $data['avatar1'] = $user['avatar1'];
        $data['avatar2'] = $user['avatar2'];
        $data['avatar3'] = $user['avatar3'];
        $data['avatar4'] = $user['avatar4'];
        $data['yuyin'] = $user['yuyin'];
        $data['sex'] = $user['sex'];
        $data['qq'] = $user['qq'];
        $data['province'] = $user['province'];
        $data['city'] = $user['city'];
        $data['district'] = $user['district'];
        $data['birthday'] = strtotime($user['birthday']);
        $data['gexing'] = $user['gexing'];
        $userQuery        = Db::name("user");
        if ($userQuery->where('id', $userId)->update($data)) {
            $userInfo = $userQuery->where('id', $userId)->find();
            cmf_update_current_user($userInfo);
            return 1;
        }
        return 0;
    }

    /**
     * 用户密码修改
     * @param $user
     * @return int
     */
    public function editPassword($user)
    {
        $userId    = cmf_get_current_user_id();
        $userQuery = Db::name("user");
        if ($user['password'] != $user['repassword']) {
            return 1;
        }
        $pass = $userQuery->where('id', $userId)->find();
        if (!cmf_compare_password($user['old_password'], $pass['user_pass'])) {
            return 2;
        }
        $data['user_pass'] = cmf_password($user['password']);
        $userQuery->where('id', $userId)->update($data);
        return 0;
    }

    public function comments()
    {
        $userId               = cmf_get_current_user_id();
        $userQuery            = Db::name("Comment");
        $where['user_id']     = $userId;
        $where['delete_time'] = 0;
        $favorites            = $userQuery->where($where)->order('id desc')->paginate(10);
        $data['page']         = $favorites->render();
        $data['lists']        = $favorites->items();
        return $data;
    }

    public function deleteComment($id)
    {
        $userId              = cmf_get_current_user_id();
        $userQuery           = Db::name("Comment");
        $where['id']         = $id;
        $where['user_id']    = $userId;
        $data['delete_time'] = time();
        $userQuery->where($where)->update($data);
        return $data;
    }

    /**
     * 绑定用户手机号
     */
    public function bindingMobile($user)
    {
        $userId      = cmf_get_current_user_id();
        $data ['mobile'] = $user['username'];
        Db::name("user")->where('id', $userId)->update($data);
        $userInfo = Db::name("user")->where('id', $userId)->find();
        cmf_update_current_user($userInfo);
        return 0;
    }

    /**
     * 绑定用户邮箱
     */
    public function bindingEmail($user)
    {
        $userId     = cmf_get_current_user_id();
        $data ['user_email'] = $user['username'];
        Db::name("user")->where('id', $userId)->update($data);
        $userInfo = Db::name("user")->where('id', $userId)->find();
        cmf_update_current_user($userInfo);
        return 0;
    }
}
