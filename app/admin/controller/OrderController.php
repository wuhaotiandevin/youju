<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Sally < 393707022@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use app\admin\model\OrderInfoModel;
use app\admin\model\OrderBgModel;
use app\admin\model\OrderGoodsModel;
use app\portal\service\UploadFileService;

use think\Db;
use tree\Tree;

class OrderController extends AdminBaseController
{
    
    /**
     * 订单管理
     */
    public function index()
    {
        $data      = $this->request->param();
        $where = [];
        
        
        if (!empty($data['status'])){
        		$where['a.status'] = $data['status'];	
        }

        $keyword = empty($data['keyword']) ? '' : $data['keyword'];
        $keywordComplex = [];
        if (!empty($keyword)) {
        	$keywordComplex['u1.user_login|u2.user_login']    = ['like', "%$keyword%"];
        }

        $join = [
            ['__USER__ u1', 'a.user_id = u1.id'],
            ['__USER__ u2', 'a.pw_id = u2.id'],
            ['__USER_JINENG__ j', 'j.id = a.jn_id'],
            ['__CATEGORY__ c', 'c.id = j.cat_id'],
        ];
        $field = 'a.*,u1.user_login,u2.user_login as pw_login,u2.qq as pw_qq,c.cat_name';
        
        $orders     = Db('order')->alias('a')->field($field)->join($join)->whereOr($keywordComplex)->where($where)->order('a.id desc')->paginate(10);
        // 获取分页显示
        $page = $orders->render();
        $orders->appends($data);       
        $this->assign('keyword', isset($data['keyword']) ? $data['keyword'] : '');
        $this->assign('status', isset($data['status']) ? $data['status'] : 0);
        $this->assign('orders', $orders);
        $this->assign("page", $page);

        return $this->fetch();
    }

    

    
    /**
     * 删除订单
     */
    public function quxiao()
    {
        $id                = $this->request->param("id", 0, "intval");
        $order = Db::name('order')->where('id',$id)->find();
        if($order['status']>1)
        {
           $data1 = array();
            $data1['user_id'] = $order['user_id'];
            $data1['money'] = $order['order_amount'];
            $data1['order_id'] = $order['id'];
            $data1['style'] = '收入';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            $data1['content'] = '取消订单,金额退回账户';
            Db::name("user_moneyrecord")->insert($data1);
            $jine = $order['order_amount'];
            $data_m = array(
            'yue'=>array('exp','yue+'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$order['user_id'])->update($data_m);  
        }
        $result = Db::name('order')->where('id',$id)->update(['status'=>0]);
        if ($result) {
            $this->success("取消成功！",url('order/index'));
        } else {
            $this->error("取消失败！");
        }
    }
    

    


   

 

}