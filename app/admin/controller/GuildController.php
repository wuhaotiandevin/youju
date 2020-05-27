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
use app\admin\model\GuildModel;

class GuildController extends AdminBaseController
{

    
    public function index()
    {
        $guilds     = Db('guild')->alias('a')->field("a.*,IFNULL((select count(*) from cmf_user u where u.guild = a.id and u.guild_status=1),'0') as count,IFNULL((select count(*) from cmf_user u where u.guild = a.id and u.guild_status=0),'0') as count1")->select();
        $this->assign('guilds', $guilds);

        return $this->fetch();
    }

    
    public function add()
    {
        return $this->fetch();
    }

    
    public function addPost()
    {
        $data      = $this->request->param();
        $GuildModel = new GuildModel();
        $result    = $GuildModel->validate(true)->allowField(true)->save($data);
        if ($result === false) {
            $this->error($GuildModel->getError());
        }

        $this->success("添加成功！", url("guild/index"));
    }

    
    public function edit()
    {
        $id        = $this->request->param('id', 0, 'intval');
        $GuildModel = GuildModel::get($id);
        $this->assign('guild', $GuildModel);
        return $this->fetch();
    }

    
    public function editPost()
    {
        $data      = $this->request->param();
        $GuildModel = new GuildModel();
        $result    = $GuildModel->validate(true)->allowField(true)->isUpdate(true)->save($data);
        if ($result === false) {
            $this->error($GuildModel->getError());
        }

        $this->success("保存成功！", url("guild/index"));
    }

    public function member()
    {
       $id = $this->request->param('id', 0, 'intval');
       $this->assign('id',$id);
       $users = Db('user')->where(['guild'=>$id,'guild_status'=>0])->select();
       $this->assign('users',$users);
       return $this->fetch();
    }

    public function member1()
    {
       $id = $this->request->param('id', 0, 'intval');
       $this->assign('id',$id);
       $users = Db('user')->where(['guild'=>$id,'guild_status'=>1])->select();
       $this->assign('users',$users);
       return $this->fetch();
    }

    public function ban()
    {
        $id = $this->request->param('id', 0, 'intval');
        $status = $this->request->param('status', 1, 'intval');
        if($status==1)
        {
              Db('user')->where('id',$id)->update(['guild_status'=>1]);
        }
        else
        {
            Db('user')->where('id',$id)->update(['guild'=>0,'guild_reason'=>'','guild_status'=>0]);
        }
        $this->success("审核成功！");
    }

    
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        GuildModel::destroy($id);

        $this->success("删除成功！", url("guild/index"));
    }

    
    public function listOrder()
    {
        $GuildModel = new  GuildModel();
        parent::listOrders($GuildModel);
        $this->success("排序更新成功！");
    }

    
    

}