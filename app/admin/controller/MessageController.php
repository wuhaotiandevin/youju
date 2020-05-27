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
use app\admin\model\MessageModel;

class MessageController extends AdminBaseController
{
    protected $targets = ["_blank" => "新标签页打开", "_self" => "本窗口打开"];

    /**
     * 友情链接管理
     * @adminMenu(
     *     'name'   => '友情链接',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 50,
     *     'icon'   => '',
     *     'remark' => '友情链接管理',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $data      = $this->request->param();
        

        $keyword = empty($data['keyword']) ? '' : $data['keyword'];
        $where = [];
        if (!empty($keyword)) {
            $where['a.title|a.content|u.user_nickname'] = ['like', "%$keyword%"];
        }

        $join = [
            ['__USER__ u', 'a.user_id = u.id']
        ];
        $field = 'a.*,u.user_nickname ';

        $MessageModel = new MessageModel();
        $Message  = $MessageModel->alias('a')->field($field)->join($join)->where($where)->order('create_time desc')->paginate(15);
        
        $page = $Message->render();
        $this->assign('message', $Message);
        $this->assign("page", $page);
        return $this->fetch();
    }

   public function add()
    {
        $data      = $this->request->param();
        $user_id = "";
        $title = "";
        if(!empty($data['uid'])){
        	$user_id = $data['uid'];
        	$title = "投诉处理情况说明";
        }
        $this->assign('user_id', $user_id);
        $this->assign('title', $title);
        $this->assign('targets', $this->targets);
        return $this->fetch();
    }

    public function addPost()
    {
        $data      = $this->request->param();
        $data['create_time']=time();
        $messageModel = new MessageModel();
        if(empty($data['user_id']))
        {
        $array=[];
        $user = Db::name('user')->select();
        foreach ($user as $users) {
            $array[] =  [
            'user_id'=>$users['id'],
            'title'=>$data['title'],
            'content'=>$data['content'],
            'create_time'=>$data['create_time']
             ];
           
        }
        $result = $messageModel->saveAll($array);
        }
    else
    {
        $result    = $messageModel->allowField(true)->save($data);
    }
        if ($result === false) {
            $this->error($messageModel->getError());
        }

        $this->success("添加成功！", url("message/index"));
    }

    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        MessageModel::destroy($id);

        $this->success("删除成功！", url("Message/index"));
    }

   

}