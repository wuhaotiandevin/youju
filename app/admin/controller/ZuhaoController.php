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

class ZuhaoController extends AdminBaseController
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
            $where['a.title']    = ['like', "%$keyword%"];
        }

        $field = 'a.*,u.user_login';
        $join =[
            ['__USER__ u','u.id=a.user_id'],
        ];
        $zuhao = Db::name("zuhao")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(20);
        $page = $zuhao->render();
        $zuhao->appends($data);   
        $this->assign('keyword', isset($data['keyword']) ? $data['keyword'] : ''); 
        $this->assign('status', isset($data['status']) ? $data['status'] : 0);
        $this->assign("zuhao",$zuhao);
        $this->assign("page", $page);
        return $this->fetch();

    }

    
    public function shenhe()
    {
        $id = $this->request->param('id', 0, 'intval');
        $status = $this->request->param('status', 1, 'intval');
        if($status==1)
        {
          Db('zuhao')->where('id',$id)->update(['status'=>1]);
           $this->success("审核成功！", url("zuhao/index"));
        }
        else
        {
            Db('zuhao')->where('id',$id)->delete();
           $this->success("审核成功！", url("zuhao/index"));
        }
    }


   

}