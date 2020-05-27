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

class ShensuController extends AdminBaseController
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
            $where['u.user_login|a.shouji'] = ['like', "%$keyword%"];
        }

        $join = [
            ['__ORDER__ o', 'o.id = a.order_id'],
            ['__USER__ u1', 'o.user_id = u1.id'],
            ['__USER__ u2', 'o.pw_id = u2.id'],
        ];
        $field = 'a.*,u1.user_login,u1.mobile,u1.qq,u2.user_login as user_login1,u2.mobile as mobile1,u2.qq as qq1,o.order_amount ';

        $shensu  = DB::name("shensu")->alias('a')->field($field)->join($join)->where($where)->order('a.create_time desc')->paginate(15);
        
        $page = $shensu->render();
        $this->assign('shensu', $shensu);
        $this->assign("page", $page);
        return $this->fetch();
    }
    /**
     * 投诉审核通过，已受理
     */
    public function up_shensu()
    {
        $id = $this->request->param('id', 0, 'intval');
        $state = $this->request->param('state', 1, 'intval');
        $shensu = DB::name("shensu")->where(["id" => $id])->find();
        $order = Db::name('order')->where('id',$shensu['order_id'])->find();
        if($state==1)
        {
            $data1 = array();
            $data1['user_id'] = $order['user_id'];
            $data1['money'] = $order['order_amount'];
            $data1['order_id'] = $order['id'];
            $data1['style'] = '收入';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            $data1['content'] = '管理员同意撤单,金额退回账户';
            Db::name("user_moneyrecord")->insert($data1);
            $jine = $order['order_amount'];
            $data_m = array(
            'yue'=>array('exp','yue+'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$order['user_id'])->update($data_m);  
            Db::name('order')->where('id',$order['id'])->update(['status'=>0]);
        }
        else
        {
            $bili = Db('option')->where('option_name','fuwufei_kd')->value('option_value');
            Db::name("order")->where('id',$shensu['order_id'])->update(['status'=>5]);
            $data1 = array();
            $data1['user_id'] = $order['pw_id'];
            $data1['money'] = $order['order_amount'];
            $data1['order_id'] = $order['id'];
            $data1['style'] = '收入';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            Db::name("user_moneyrecord")->insert($data1);
            $data2 = array();
            $data2['user_id'] = $order['pw_id'];
            $data2['money'] = $order['order_amount']*$bili;
            $data2['style'] = '支出';
            $data2['content'] = '平台扣去订单管理费';
            $data2['pay_time'] = time();
            $data2['status'] = 1;
            Db::name("user_moneyrecord")->insert($data2); 
            $jine = $order['order_amount']*(1-$bili);
            $data_m = array(
            'yue'=>array('exp','yue+'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$order['pw_id'])->update($data_m);
        }
        Db::name('shensu')->where('id',$id)->update(['state'=>1]);
        

        $this->success("申诉已受理！");
    }

}