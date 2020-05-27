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

class JinengController extends AdminBaseController
{
    protected $targets = ["_blank" => "新标签页打开", "_self" => "本窗口打开"];

    public function index()
    {
        $data=$this->request->param();
        $where = [];
        
        
        if (!empty($data['status'])){
                $where['a.status'] = $data['status'];   
        }

        $keyword = empty($data['keyword']) ? '' : $data['keyword'];
        if (!empty($keyword)) {
            $where['u.user_login']    = ['like', "%$keyword%"];
        }

        $field = 'a.*,c1.cat_name as jineng,c2.cat_name as dengji,u.user_login,u.qq';
        $join =[
            ['__USER__ u','u.id=a.user_id'],
            ['__CATEGORY__ c1','c1.id=a.cat_id'],
            ['__CATEGORY__ c2','c2.id=a.level'],
        ];
        $jineng = Db::name("user_jineng")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(20);
        $page = $jineng->render();
        $jineng->appends($data);   
        $this->assign('keyword', isset($data['keyword']) ? $data['keyword'] : ''); 
        $this->assign('status', isset($data['status']) ? $data['status'] : 0);
        $this->assign("jineng",$jineng);
        $this->assign("page", $page);
        return $this->fetch();

    }

    
    public function shenhe()
    {
        $id = $this->request->param('id', 0, 'intval');
        $status = $this->request->param('status', 1, 'intval');
        if($status==1)
        {
            $jiage = Db('user_jineng')->where('id',$id)->value('jiage');
            if($jiage<=0)
            {
                $this->error('请先设置价格');
            }
          Db('user_jineng')->where('id',$id)->update(['status'=>1]);
           $this->success("审核成功！", url("jineng/index"));
        }
        else
        {
            Db('user_jineng')->where('id',$id)->delete();
           $this->success("审核成功！", url("jineng/index"));
        }
    }

    public  function jiage()
    {
      $data = $this->request->param();
      $jiage = Db('user_jineng')->where('id',$data['id'])->find();
      $this->assign('jiage',$jiage);
      return $this->fetch();  
    }

    public function edit_jiage()
    {
       $data = $this->request->param();
       Db('user_jineng')->where('id',$data['id'])->update(['jiage'=>$data['jiage']]); 
       $this->success("修改成功！");
    }

   

}