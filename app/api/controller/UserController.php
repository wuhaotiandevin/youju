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
    public function index()
    {
        $type = isset($_GET['type']) ? $_GET['type'] : '';
        $openid = isset($_GET['openid']) ? $_GET['openid'] : '';
        $qqid = isset($_GET['qqid']) ? $_GET['qqid'] : '';
        if (empty($type)) {
            echo json_encode(array('error' => 1, 'errorMsg' => '请求失败'));
            die();
        }
        switch ($type) {
            case 'weixin':
                if (empty($openid)) {
                    echo json_encode(array('error' => 1, 'errorMsg' => '请求失败'));
                    die();
                }
                $where['openid']=$openid;
                break;
            case 'qq':
                if (empty($qqid)) {
                    echo json_encode(array('error' => 1, 'errorMsg' => '请求失败'));
                    die();
                }
                $where['qqid']=$qqid;
                break;
            case 'mobile':
                $mobile = isset($_GET['mobile']) ? $_GET['mobile'] : '';
                if (empty($mobile)) {
                    echo json_encode(array('error' => 1, 'errorMsg' => '请求失败'));
                    die();
                }
                $where['mobile']=$mobile;
                break;
        }
        $user = Db::name('user')
            ->where($where)
            ->field('id,nickname,mobile,avatar')
            ->find();

        if($user){
            echo json_encode( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $user));
            die();
        }else{
            echo json_encode( array('error' => 1,  'errorMsg' => '绑定手机号'));
            die();
        }
    }
}