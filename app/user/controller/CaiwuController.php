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
namespace app\user\controller;

use cmf\controller\UserBaseController;
use think\Validate;
use think\Db;

class CaiwuController extends UserBaseController
{
    public function index()
    {
        $user              = cmf_get_current_user();
        $a="qianbao";
        $qianbao = Db::name("user_moneyinfo")->where('user_id', $user['id'])->find();
       if(empty($qianbao))
       {
       $uminfo = array('user_id' => $user['id'], );
       Db::name("user_moneyinfo")->insert($uminfo);
       $this->assign('qianbao',['yue'=>0.00]);
       }
       else
       {
        $this->assign('qianbao',$qianbao);
       }

        $data      = $this->request->param();
        $where="user_id=".$user['id'] ." and status=1";
        if(!empty($data['shijian1']))
        {
          $start_time = strtotime($data['shijian1']); 
          $where .= " and `pay_time`>='".$start_time."'";
        }
        if(!empty($data['shijian2']))
        {
          $end_time = strtotime($data['shijian2']); 
          $where .= " and `pay_time`<='".$end_time."'";
        }
        if(!empty($data['style']))
        {
           $where .= " and `style`='".$data['style']."'"; 
        }

           $data2    = Db::name("user_moneyrecord")->where($where)->order('id desc')->paginate(7);
           $zjjl = [];
           foreach ($data2 as $k=>$v)  {
            if($v['style']=="收入"||$v['style']=="充值")
            {
                $v['money'] = "+".$v['money'];
            }
            else
            {
                $v['money'] = "-".$v['money'];
            }
            if($v['style']=="充值")
            {
                $v['tu'] = "&#xe603;";
            }
            elseif ($v['style']=="支出") {
                $v['tu'] = "&#xe667;";
            }
            elseif ($v['style']=="收入")
            {
               $v['tu'] = "&#xe677;";
            }
            else
            {
               $v['tu'] = "&#xe68c;";
            }
            $zjjl[]=$v;
           }
           $page = $data2->render();
        $this->assign("page", $page);
        $this->assign("mrecord", $zjjl);
             
        $this->assign('a',$a);
        $this->assign($user);
        return $this->fetch();
        
    }
        


          public function tixian()
    {
        $a="qianbao";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $qianbao = Db::name("user_moneyinfo")->where('user_id', $user['id'])->find();
        $tx_settings = cmf_get_option('tx_settings');
        if($qianbao['shenhe']==0)
        {
          $this->error('请先进行身份认证','user/caiwu/renzheng');
        }
        $this->assign('qianbao',$qianbao);
        $this->assign($user);
        $this->assign('tx_settings',$tx_settings);
        return $this->fetch();
    }

    public function renzheng()
    {
        $a="qianbao";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $user = Db('user')->where('id',$user['id'])->find();
        $qianbao = Db::name("user_moneyinfo")->where('user_id', $user['id'])->find();

        $this->assign('qianbao',$qianbao);
        $this->assign($user);
     return $this->fetch();
    }

    public function rzPost()
    {
      $validate = new Validate([
                'realname' => 'require',
                'bank' => 'require',
                'bankcard' => 'require',
                'idnumber' => 'require',
                'idnum_z' => 'require',
                'idnum_f' => 'require',
            ]);
            $validate->message([
                'realname.require' => '真实姓名不能为空',
                'bank.require' => '请选择开户行',
                'bankcard.require'     => '请输入银行账号',
                'idnumber.require'     => '请输入身份证号码',
                'idnum_z.require'     => '请上传身份证正面',
                'idnum_f.require'     => '请上传身份证反面',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
          $user = cmf_get_current_user();
          $renzheng['realname'] = $data['realname'];
          $renzheng['bank'] = $data['bank'];
          $renzheng['bankcard'] = $data['bankcard'];
          $renzheng['idnumber'] = $data['idnumber'];
          $renzheng['idnum_z'] = $data['idnum_z'];
          $renzheng['idnum_f'] = $data['idnum_f'];
          $renzheng['shenhe'] = 2;
          Db('user_moneyinfo')->where('user_id',$user['id'])->update($renzheng);
          $this->success('申请认证成功，请等待管理员审核');
    }

    public function txpost()
    {
      $user = cmf_get_current_user();
      $data      = $this->request->param();
      $tx_settings = cmf_get_option('tx_settings');
      $moneyinfo = Db::name('user_moneyinfo')->where('user_id',$user['id'])->find();
      if ($moneyinfo['yue']<$data['jine']) {
        $this->error("提现金额大于账户余额");
             }
             elseif ($data['jine']<$tx_settings['min_money']) {
               $this->error("提现金额不能低于".$tx_settings['min_money']."元");
             }
          else
            {
            $data_n = array();
            $data_n['user_id'] = $user['id'];
            $data_n['jine'] = $data['jine']*(100-$tx_settings['tx_bili'])/100;
            $data_n['bank'] = $moneyinfo['bank'];
            $data_n['bankcard'] = $moneyinfo['bankcard'];
            $data_n['realname'] = $moneyinfo['realname'];
            $data_n['tixian_time'] = time();
            Db::name("tixian")->insert($data_n);
            $data1 = array();
            $data1['user_id'] = $user['id'];
            $data1['money'] = $data['jine'];
            $data1['style'] = '提现';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            Db::name("user_moneyrecord")->insert($data1);
            $jine = $data['jine'];
            $data_m = array(
            'yue'=>array('exp','yue-'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$user['id'])->update($data_m);
            }
         $this->success('提现成功');
    }
    public function chongzhi()
    {
        $a="qianbao";
        $this->assign('a',$a);
        $data      = $this->request->param();
        if(!empty($data['money']))
        {
        $this->assign('money',$data['money']);
        }
        else
        {
         $this->assign('money',''); 
        }
        $user = cmf_get_current_user();
        $qianbao = Db::name("user_moneyinfo")->where('user_id', $user['id'])->find();
        $order_sn = date("ymdHis",time()).rand(10,99);
        $this->assign('order_sn',$order_sn);
        $this->assign('qianbao',$qianbao);
        $this->assign($user);
        return $this->fetch();
    }



    public function erweima()
    {   
        require_once "./lib/WxPay.Api.php";
        require_once "./lib/WxPay.NativePay.php";
        $jine      = $this->request->param('jine');
        $order_sn = date("ymdHis",time()).rand(10,99);
        setcookie('order_sn',$order_sn);
        //微信支付
        $notify = new \NativePay();
        $input = new \WxPayUnifiedOrder();
        $input->SetBody("充值");
        $input->SetOut_trade_no($order_sn);
        $input->SetTotal_fee($jine*100);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetNotify_url("https://www.duchen.com/user/caiwu/notify");
        $input->SetTrade_type("NATIVE");
        $input->SetProduct_id(1);
        $result = $notify->GetPayUrl($input);
        $url = $result["code_url"];
        $user = cmf_get_current_user();
        $data1 = array();
            $data1['user_id'] = $user['id'];
            $data1['money'] = $jine;
            $data1['style'] = '充值';
            $data1['content'] = '微信充值收入';
            $data1['pay_time'] = time();
            $data1['order_id'] = $order_sn;
            Db::name("user_moneyrecord")->insert($data1);
        return $url;

    }


    public function notify()
   {
     require_once "./lib/WxPay.Api.php";
     $out_trade_no = cookie('order_sn');
   /****调用微信接口，返回支付后的参数*****/
   if(!empty($out_trade_no)){
      $input = new \WxPayOrderQuery();
      $input->SetOut_trade_no($out_trade_no);
      $result  = \WxPayApi::orderQuery($input);
      if ($result['trade_state'] == "SUCCESS"){
        $money = Db::name("user_moneyrecord")->where('order_id',$out_trade_no)->find();
        $user = cmf_get_current_user();
        Db::name('user_moneyrecord')->where('order_id',$out_trade_no)->update(['status'=>1]);
        $jine = $money['money'];
            $data_m = array(
            'yue'=>array('exp','yue+'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$money['user_id'])->update($data_m);
            setcookie('order_sn','');
      return 'SUCCESS';
   }
   else
   {
    return 'FALSE';
   }

     
   }
   else
   {
    return 'FALSE';
   }
   }

   public function zfb_pay()
   {
     require_once "./alipay/AopSdk.php";
     $this->config = cmf_get_plugin_config('Alipay');
     $jine      = $this->request->param('jine');
     $order_sn = date("ymdHis",time()).rand(10,99);
     $user = cmf_get_current_user();
            $data1 = array();
            $data1['user_id'] = $user['id'];
            $data1['money'] = $jine;
            $data1['style'] = '充值';
            $data1['content'] = '支付宝充值收入';
            $data1['pay_time'] = time();
            $data1['order_id'] = $order_sn;
            Db::name("user_moneyrecord")->insert($data1);
            $aop = new \AopClient();
            $aop->gatewayUrl = 'https://openapi.alipay.com/gateway.do';
            $aop->appId = $this->config['appid'];
            $aop->rsaPrivateKey=$this->config['rsaprivatekey'];
            $aop->alipayrsaPublicKey=$this->config['alipayrsapublickey'];
        $aop->apiVersion = '1.0';
        $aop->signType = 'RSA2';
        $aop->postCharset='utf-8';
        $aop->format='json';
        $request = new \AlipayTradePagePayRequest ();
        $request->setNotifyUrl("http://www.taoyuewan.com/portal/index/notify");
        $request->setReturnUrl("http://www.taoyuewan.com/user/caiwu/index");
        $request->setBizContent("{" .
        "    \"body\":\"充值。\"," .
        "    \"subject\":\"充值\"," .
        "    \"out_trade_no\":\"$order_sn\"," .
        "    \"total_amount\":$jine," .
        "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"" .
        "  }");
        $result = $aop->pageExecute($request); 
        echo $result;
   }

   function str_change($data) {
    //去除一个字符串反斜杠，
    $data=stripslashes($data);
    //去除一个字符串两端空格，
    $data=trim($data);
    //解码
    $data=json_decode($data,true);
    return $data;
}


}
