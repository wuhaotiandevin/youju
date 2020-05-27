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

class MoneyController extends AdminBaseController
{
    protected $targets = ["_blank" => "新标签页打开", "_self" => "本窗口打开"];


    public function index()
    {   
        $data      = $this->request->param();
        $where['a.status']= 1;
        if(!empty($data['style']))
        {
           $where['a.style'] =  $data['style']; 
        }
        if(!empty($data['keyword']))
        {
            $keyword = $data['keyword'];
            $where['u.user_login'] = ['like', "%$keyword%"];; 
        }
        $join = [
            ['__USER__ u', 'a.user_id = u.id'],
        ];
        $field = 'a.*,u.user_login ';
        $data2    = Db::name("user_moneyrecord")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(17);
           $zjjl = [];
           foreach ($data2 as $k=>$v)  {
            $v['ordersn'] ="";
            if($v['style']=="收入"||$v['style']=="充值")
            {
                $v['money'] = "+".$v['money'];
            }
            else
            {
                $v['money'] = "-".$v['money'];
            }
            $zjjl[]=$v;
           }

           $page = $data2->render();
           $data2->appends($data); 
        $this->assign("page", $page);
        $this->assign("mrecord", $zjjl);
        $this->assign('keyword', isset($data['keyword']) ? $data['keyword'] : '');
        $this->assign('style', isset($data['style']) ? $data['style'] : '');

        return $this->fetch();
    }
}