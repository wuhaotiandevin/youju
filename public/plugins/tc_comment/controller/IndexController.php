<?php
// +----------------------------------------------------------------------
// | TcComment [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 Tangchao All rights reserved.
// +----------------------------------------------------------------------
// | Author: Tangchao <79300975@qq.com>
// +----------------------------------------------------------------------
namespace plugins\tc_comment\controller;
use cmf\controller\PluginBaseController;
use think\Db;
use app\user\model\UserModel;

class IndexController extends PluginBaseController
{
    function index()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $post   = $data['post'];
            $user = cmf_get_current_user();
            $admin = Db::name("comment")->where('user_id', $user['id'])->field("create_time")->order(["create_time" => "DESC"])->find();
            if(time()-$admin['create_time']<60) $this->error('1分钟内只能回复一次！');
            $post ['user_id']=$user['id'];
            $post ['full_name']= $user['user_login'];
            $post ['create_time']=time();
            $post ['url']=$_SERVER['HTTP_REFERER'];
            $result = Db::name('comment')->insertGetId($post);
            if ($result) {
                $this->success('回复成功!', url('portal/Article/index', ['id' => $post['object_id']]));
            }else{
                $this->error('数据传入失败！');
            }
        }
    }
}