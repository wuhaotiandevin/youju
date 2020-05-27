<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace app\user\controller;

use cmf\controller\UserBaseController;
use think\Db;

class XiaoxiController extends UserBaseController
{

    /**
     * 消息中心
     */
    public function index()
    {
        $user              = cmf_get_current_user();
        $this->assign($user);
        $this->assign("a", "xiaoxi");
        $where['user_id'] = $user['id'];
        $whereor['user_id'] = 0;
        $xiaoxi = Db::name("message")->where($where)->whereor($whereor)->order('id desc')->paginate(20);
        $page  = $xiaoxi->render();
        $this->assign("page", $page);
        $this->assign("xiaoxi", $xiaoxi);
        return $this->fetch();
    }

    public function detail()
    {
        $id = $this->request->param('id',0,'intval');
        Db('message')->where('id',$id)->update(['is_read'=>1]);
        $xiaoxi = Db::name("message")->where('id',$id)->find();
        $this->assign('xiaoxi',$xiaoxi);
        return $this->fetch();
    }

    public function delete()
    {
       $id = $this->request->param('id',0,'intval'); 
       Db('message')->where('id',$id)->delete();
       $this->success('删除成功');
    }
    
}