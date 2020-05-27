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

class ChatController extends AdminBaseController
{

    public function index()
    {
       $join = [['user u','u.id=a.user_id']];
        $chats     = Db('chat')->alias('a')->field('a.*,u.user_login')->join($join)->order('a.id desc')->select();
        $this->assign('chats', $chats);

        return $this->fetch();
    }

    public function add()
    {
        $users = Db('user')->where(['user_type'=>3,'user_status'=>1])->select();
        $this->assign('users', $users);
        return $this->fetch();
    }


    public function addPost()
    {
        require_once "./agora/api/Project.php";
        $data      = $this->request->param();
        
        if(empty($data['name']))
        {
            $this->error('请输入大厅名');
        }
        if(empty($data['ename']))
        {
            $this->error('请输入英文名');
        }
        $chat['name'] = $data['name'];
        $chat['ename'] = $data['ename'];
        $chat['create_time'] = time();
        $chat['description'] = $data['description'];
        $chat['user_id'] = $data['user_id'];
        $result    = Db('chat')->insert($chat);
      

        $this->success("添加成功！", url("chat/index"));
    }


    public function edit()
    {
        $id        = $this->request->param('id', 0, 'intval');
        $chat = Db('chat')->where('id',$id)->find();
       
        $this->assign('chat', $chat);

        $users = Db('user')->where('user_type',3)->where('user_status',1)->select();
        $this->assign('users', $users);
        return $this->fetch();
    }


    public function editPost()
    {
        $data      = $this->request->param();
        if(empty($data['name']))
        {
            $this->error('请输入大厅名');
        }
        if(empty($data['ename']))
        {
            $this->error('请输入英文名');
        }
        $chat['name'] = $data['name'];
        $chat['ename'] = $data['ename'];
        $chat['create_time'] = time();
        $chat['description'] = $data['description'];
        $chat['user_id'] = $data['user_id'];
        $result    = Db('chat')->where('id',$data['id'])->update($chat);

        $this->success("修改成功！", url("chat/index"));
    }


    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        Db('chat')->where('id',$id)->delete();

        $this->success("删除成功！", url("chat/index"));
    }

    

}