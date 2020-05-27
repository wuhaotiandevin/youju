<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use think\Image;
use think\Db;

class IndexController extends HomeBaseController
{
    public function index()
    {
        header("Location:admin");exit;
    }

    public function haoma()
    {
        $data      = $this->request->param();
        $user = cmf_get_current_user();
        $this->assign($user);
        $this->assign('a','');
        $keyword = empty($data['keyword']) ? '' : $data['keyword'];
        $this->assign("keyword", $keyword);
        $where = [];
        if (!empty($keyword)) {
            $where['haoma'] = ['like', "%$keyword%"];
        }

        $haoma  = DB::name("haoma")->where($where)->limit(100)->order('id desc')->select();
        
        $this->assign('haoma', $haoma);
        return $this->fetch(':haoma');
    }

    



    public function notify()
   {
     $data = $this->request->param();

     //$return = json_encode(['code' => 0, 'msg' => 'success']);

     echo 'success';
     //$data = json_decode($data, true);
     if ($data['trade_status'] == "TRADE_SUCCESS"){
     $qrid = $data['out_trade_no'];
     if(!empty($qrid))
     {
      $money = Db::name("user_moneyrecord")->where('order_id',$qrid)->find();
      $user = Db::name("user")->where('id',$money['user_id'])->find();
      if($money['status']==0)
        {
            $jine = $money['money'];
            $data_m = array(
            'yue'=>array('exp','yue+'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$money['user_id'])->update($data_m);
            Db::name("user_moneyrecord")->where('order_id',$qrid)->update(['status'=>1]);
        }
     }
     return 'success';
   }
   else
   {
    return 'false';
   }

  }


   

}
