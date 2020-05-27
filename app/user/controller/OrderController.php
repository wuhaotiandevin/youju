<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace app\user\controller;

use cmf\controller\UserBaseController;
use think\Db;

class OrderController extends UserBaseController
{

    /**
     * 个人中心我的订单列表
     */
    public function index()
    {
        $a="order";
        $this->assign('a',$a);
        $data = $this->request->param();
        $userId        = cmf_get_current_user_id();
        $user = cmf_get_current_user();
        $this->assign($user);
        $where['a.user_id']=$userId;
        if (!empty($data['status'])){
            $where['a.status'] = $data['status'];
        }
        else
        {
            $data['status']=0;
        }
        $this->assign('status',$data['status']);
        if (!empty($data['keyword'])) {
            $keyword = $data['keyword'];
            $where['u.user_login'] = ['like', "%$keyword%"];
        }
        $join = [
            ['__USER__ u', 'u.id = a.pw_id'],
            ['__USER_JINENG__ j', 'j.id = a.jn_id'],
            ['__CATEGORY__ c', 'c.id = j.cat_id'],
        ];
        $field = 'a.*,c.cat_name,u.avatar,u.user_login,u.qq,IFNULL((SELECT "1" FROM `cmf_shensu` s WHERE s.order_id=a.id),"0") as shensu';
        $order     = Db::name("order")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(5);
        $data['page']  = $order->render();
        $data['lists'] = $order->items();
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        $order_count[0] = Db::name('order')->where(['user_id' => $userId])->count();
        $order_count[1] = Db::name('order')->where(['user_id' => $userId,'status'=>1])->count();
        $order_count[2] = Db::name('order')->where(['user_id' => $userId,'status'=>2])->count();
        $order_count[3] = Db::name('order')->where(['user_id' => $userId,'status'=>4])->count();
        $order_count[4] = Db::name('order')->where(['user_id' => $userId,'status'=>5])->count();
        $this->assign('order_count',$order_count);
        return $this->fetch();
    }

    public function jiedan()
    {
        $a="jiedan";
        $this->assign('a',$a);
         $data = $this->request->param();
        $userId        = cmf_get_current_user_id();
        $user = cmf_get_current_user();
        $this->assign($user);
        $where['a.pw_id']=$userId;
        if (!empty($data['status'])){
            $where['a.status'] = $data['status'];
        }
        else
        {
            $data['status']=0;
        }
        $this->assign('status',$data['status']);
        if (!empty($data['keyword'])) {
            $keyword = $data['keyword'];
            $where['u.user_login'] = ['like', "%$keyword%"];
        }
        $join = [
            ['__USER__ u', 'u.id = a.user_id'],
            ['__USER_JINENG__ j', 'j.id = a.jn_id'],
            ['__CATEGORY__ c', 'c.id = j.cat_id'],
        ];
        $field = 'a.*,c.cat_name,u.avatar,u.user_login,IFNULL((SELECT "1" FROM `cmf_shensu` s WHERE s.order_id=a.id),"0") as shensu,IFNULL((SELECT state FROM `cmf_shensu` ss WHERE ss.order_id=a.id),"0") as state';
        $order     = Db::name("order")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(5);
        $data['page']  = $order->render();
        $data['lists'] = $order->items();
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        $order_count[0] = count(Db::name('order')->where(['pw_id' => $userId])->select());
        $order_count[1] = count(Db::name('order')->where(['pw_id' => $userId,'status'=>1])->select());
        $order_count[2] = count(Db::name('order')->where(['pw_id' => $userId,'status'=>2])->select());
        $order_count[3] = count(Db::name('order')->where(['pw_id' => $userId,'status'=>3])->select());
        $order_count[4] = count(Db::name('order')->where(['pw_id' => $userId,'status'=>4])->select());
        $this->assign('order_count',$order_count);
        return $this->fetch();
    }


    public function zhifu()
    {
        $user = cmf_get_current_user();
        $data      = $this->request->param();
        $order = Db::name('order')->where('id',$data['id'])->find();
        $pw_user = Db::name('user')->where('id',$order['pw_id'])->find();
        $qianbao = Db::name("user_moneyinfo")->where('user_id', $user['id'])->find();
        if($order['status']>1)
        {
        $this->error("已经支付，请不要重复支付！");
        }
        elseif ($qianbao['yue']<$order['order_amount']) {
            $this->error("可用余额不足，请选充值",url('user/caiwu/chongzhi'));
             }
        else{
            Db::name("order")->where('id',$data['id'])->update(['status'  => 2,'pay_time'  => time()]);
            $data1 = array();
            $data1['user_id'] = $user['id'];
            $data1['money'] = $order['order_amount'];
            $data1['order_id'] = $order['id'];
            $data1['style'] = '支出';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            $data1['content'] = '支付订单';
            Db::name("user_moneyrecord")->insert($data1);
            $jine = $order['order_amount'];
            $data_m = array(
            'yue'=>array('exp','yue-'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$user['id'])->update($data_m);
            $this->send($pw_user['mobile'],'SMS_167370858');
            cmf_send_message($pw_user['id'],'有人下单了','您有新的订单待处理，当前状态：待接单，玩家QQ:'.$order['qq'].'，请及时联系玩家处理。');
            $this->success("支付成功，您可以联系陪玩师接单");
        }
    }

    public function kaishi()
    {
        $id = $this->request->param('id', 0, 'intval');
        $order = Db::name("order")->where('id',$id)->find();
        if($order['status']==2)
        {
           Db::name("order")->where('id',$id)->update(['status'=>3,'kaishi_time'=>time()]); 
           $this->success("接单成功，请联系玩家开始游戏");
        }
        else
        {
           $this->error("订单不符合接单条件！"); 
        }
    }

    public function jiesu()
    {
        $id = $this->request->param('id', 0, 'intval');
        $order = Db::name("order")->where('id',$id)->find();
        if($order['status']==3)
        {
           Db::name("order")->where('id',$id)->update(['status'=>4,'jiesu_time'=>time()]); 
           $this->success("结束成功，请联系玩家验收");
        }
        else
        {
           $this->error("订单不符合结束条件！"); 
        }
    }


    public function yanshou()
    {
        $id = $this->request->param('id', 0, 'intval');
        $order = Db::name("order")->where('id',$id)->find();
        if($order['status']==4)
        {
        $bili = Db('option')->where('option_name','fuwufei_kd')->value('option_value');
        Db::name("order")->where('id',$id)->update(['status'=>5]);
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
            $jn_num = $order['jn_num'];
            Db::name('user_jineng')->where('id',$order['jn_id'])->SetInc('shichang',$jn_num);
            Db::name('user')->where('id',$order['pw_id'])->SetInc('jiedan');
           $this->success("验收成功！请对订单进行评价。");
        }
        else
        {
        $this->error("订单不符合验收条件！");
        }
    }


    public function pingjia()
    {
        $user = cmf_get_current_user();
        $this->assign($user);
        $id = $this->request->param('id');
        $field ='a.*,u.avatar,u.user_login ';
        $join = [
         ['__USER__ u','u.id = a.pw_id']
        ];
        $order = Db::name('order')->alias('a')->field($field)->join($join)->where('a.id',$id)->find();
        $this->assign('order',$order);
        return $this->fetch();
    }
    public function pjpost()
    {
        $user = cmf_get_current_user();
        $data = $this->request->param();
        $result = Db::name('pingjia')->where('order_id',$data['order_id'])->find();
        if($result)
        {
        $this->error("已经评价过此订单，请不要重复评价！");
        }
        elseif(empty($data['rank']))
        {
        $this->error("请对订单评分！"); 
        }
        else
        {
            $data   = [
                'pw_id'         => $data['pw_id'],
                'order_id'      => $data['order_id'],
                'jn_id'      => $data['jn_id'],
                'user_id'       => $user['id'],
                'create_time'   => time(),
                'content'       => $data['content'],
                'rank'          => $data['rank'],
            ];
            $userId = Db::name("pingjia")->insert($data);
            Db::name("order")->where('id',$data['order_id'])->update(['status'=>6]);
            
            $this->success("评价成功！", url("order/index"));
        }
    }

    public function mypingjia()
    {
        $this->assign('a','pingjia');
        $data = $this->request->param();
        $user=cmf_get_current_user();
        $this->assign($user);
        if (!empty($data['keyword'])) {
            $keyword = $data['keyword'];
            $where['u.user_login'] = ['like', "%$keyword%"];
        }
        $where['a.user_id'] = $user['id'];
        $field = 'a.*,u.avatar,u.user_login,c.cat_name';
        $join = [
          ['__USER__ u','u.id=a.pw_id' ],
          ['__USER_JINENG__ j', 'j.id = a.jn_id'],
          ['__CATEGORY__ c', 'c.id = j.cat_id'],
             ];
        $mypingjia = Db('pingjia')->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(10);
        $page = $mypingjia->render();
        $this->assign('mypingjia',$mypingjia);
        $this->assign('page',$page);
        return $this->fetch();
    }

    public function jpingjia()
    {
        $this->assign('a','jpingjia');
        $user=cmf_get_current_user();
        $this->assign($user);
        $where['a.pw_id'] = $user['id'];
        $field = 'a.*,u.avatar,u.user_login,c.cat_name';
        $join = [
          ['__USER__ u','u.id=a.user_id' ],
          ['__USER_JINENG__ j', 'j.id = a.jn_id'],
          ['__CATEGORY__ c', 'c.id = j.cat_id'],
             ];
        $mypingjia = Db('pingjia')->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(10);
        $page = $mypingjia->render();
        $this->assign('mypingjia',$mypingjia);
        $this->assign('page',$page);
        return $this->fetch();
    }

    public function chedan()
    {
        $user = cmf_get_current_user();
        $this->assign($user);
        $id = $this->request->param('id');
        $field ='a.*,u.avatar,u.user_login ';
        $join = [
         ['__USER__ u','u.id = a.pw_id']
        ];
        $order = Db::name('order')->alias('a')->field($field)->join($join)->where('a.id',$id)->find();
        $this->assign('order',$order);
        $shensu = Db::name('shensu')->where('order_id',$order['id'])->find();
        if(empty($shensu))
        {
          $shensu=['xianshi'=>0,'style'=>'','content'=>''];
        }
        else
        {
            $shensu['xianshi'] = 1;
        }
        $this->assign('shensu',$shensu);

        return $this->fetch();
    }

    public function chuli()
    {
        $user = cmf_get_current_user();
        $this->assign($user);
        $id = $this->request->param('id');
        $field ='a.*,u.avatar,u.user_login ';
        $join = [
         ['__USER__ u','u.id = a.user_id']
        ];
        $order = Db::name('order')->alias('a')->field($field)->join($join)->where('a.id',$id)->find();
        $this->assign('order',$order);
        $shensu = Db::name('shensu')->where('order_id',$order['id'])->find();
        $this->assign('shensu',$shensu);

        return $this->fetch();
    }

    public function add_chedan()
    {
        $data      = $this->request->param();
        $user = cmf_get_current_user();
        $order = Db::name('order')->where('id',$data['order_id'])->find();
        $pw_user = Db::name('user')->where('id',$order['pw_id'])->find();
        if(empty($data['style']))
        {
             $this->error('请选择撤单原因');
        }
        $shensu =[
          'order_id' =>$data['order_id'],
          'user_id' =>$user['id'],
          'style'=>$data['style'],
          'content'=>$data['content'],
          'create_time'  => time(),
        ];
        $result  = Db::name('shensu')->insert($shensu);
        $this->send($pw_user['mobile'],'SMS_167395121');
        if ($result) {
            $this->success("申请成功！");
        } else {
            $this->error("申请失败！");
        }
    }

    public function chuli_chedan()
    {
        $data      = $this->request->param();
        $shensu = Db::name('shensu')->where('id',$data['id'])->find();
        $order = Db::name('order')->where('id',$shensu['order_id'])->find();
        if($data['state']==1)
        {
            $data1 = array();
            $data1['user_id'] = $order['user_id'];
            $data1['money'] = $order['order_amount'];
            $data1['order_id'] = $order['id'];
            $data1['style'] = '收入';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            $data1['content'] = '陪玩同意撤单,金额退回账户';
            Db::name("user_moneyrecord")->insert($data1);
            $jine = $order['order_amount'];
            $data_m = array(
            'yue'=>array('exp','yue+'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$order['user_id'])->update($data_m);  
            $result = Db::name('order')->where('id',$order['id'])->update(['status'=>0]);
        }
       
        $result  = Db::name('shensu')->where('id',$data['id'])->update(['state'=>$data['state']]);
        if ($result) {
            $this->success("处理成功！");
        } else {
            $this->error("处理失败！");
        }
    }

    
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
            $this->error("取消失败！请联系客服处理");
        }
    }

    public function send($mobile,$TemplateCode)
    {
    require_once "./dx/SignatureHelper.php";  
        
    $params = array ();
    // *** 需用户填写部分 ***
    // fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
    $accessKeyId = "LTAIeB35TLJh82Vn";
    $accessKeySecret = "g3uFIsanaePjcVZsQEMZF4cpdzCGwn";
    // fixme 必填: 短信接收号码
    $params["PhoneNumbers"] = $mobile;

    // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
    $params["SignName"] = "淘约玩";

    // fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
    $params["TemplateCode"] = $TemplateCode;

    // fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
    $params['TemplateParam'] = Array (
        "product" => "1"
    );

    // fixme 可选: 设置发送短信流水号
    $params['OutId'] = "";

    // fixme 可选: 上行短信扩展码, 扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段
    $params['SmsUpExtendCode'] = "";


    // *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
    if(!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
        $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
    }

    // 初始化SignatureHelper实例用于设置参数，签名以及发送请求
    $helper = new \SignatureHelper();

    // 此处可能会抛出异常，注意catch
    $content = $helper->request(
        $accessKeyId,
        $accessKeySecret,
        "dysmsapi.aliyuncs.com",
        array_merge($params, array(
            "RegionId" => "cn-hangzhou",
            "Action" => "SendSms",
            "Version" => "2017-05-25",
        ))
        // fixme 选填: 启用https
        // ,true
    );
    $content= json_decode(json_encode($content),true);   
    }
}