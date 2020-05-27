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

class TixianController extends AdminBaseController
{
    protected $targets = ["_blank" => "新标签页打开", "_self" => "本窗口打开"];


    public function index()
    {   
        $data      = $this->request->param();
        $where = "";
        $keyword = empty($data['keyword']) ? '' : $data['keyword'];
        $keywordComplex = [];
        if (!empty($keyword)) {
            $keywordComplex['a.weixin|u.user_login']    = ['like', "%$keyword%"];
        }
        if (isset($data['status'])){
            $status = $data['status'];
            if($status==0)
            {
                $where = "a.txstatus=0";
            }
            else
            {
                $where = "a.txstatus=1";
            }
        }
       
        $join = [
                ['user u', 'a.user_id = u.id'],
            ];
            $field = 'a.*,u.user_login ';
        $Tixians = Db::name('tixian')->alias('a')->field($field)->join($join)->whereOr($keywordComplex)->where($where)->order('a.id desc')->select();
        $this->assign('Tixians', $Tixians);
        $this->assign('status', isset($data['status']) ? $data['status'] : '');

        return $this->fetch();
    }
   
    public function shenhe()
    {
        $id = $this->request->param('id', 0, 'intval');
        $txinfo = Db::name('tixian')->where('id',$id)->find();
        Db::name('tixian')->where('id',$id)->update(['txstatus'=>1]);
        $this->success("打款成功-操作成功！", url("Tixian/index"));
    }

}