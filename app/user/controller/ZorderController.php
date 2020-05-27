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

class ZorderController extends UserBaseController
{

    /**
     * 个人中心我的订单列表
     */
    public function index()
    {
        $a="zorder";
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
            $where['z.name'] = ['like', "%$keyword%"];
        }
        $join = [
            ['__USER__ u', 'u.id = a.pw_id'],
            ['__ZUHAO__ z', 'z.id = a.zh_id'],
        ];
        $field = 'a.*,z.name,z.pic,u.user_login,z.mobile';
        $order     = Db::name("zuhao_order")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(5);
        $data['page']  = $order->render();
        $data['lists'] = $order->items();
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        $order_count[0] = Db::name('zuhao_order')->where(['user_id' => $userId])->count();
        $order_count[1] = Db::name('zuhao_order')->where(['user_id' => $userId,'status'=>1])->count();
        $order_count[2] = Db::name('zuhao_order')->where(['user_id' => $userId,'status'=>2])->count();
        $order_count[3] = Db::name('zuhao_order')->where(['user_id' => $userId,'status'=>3])->count();
        $order_count[4] = Db::name('zuhao_order')->where(['user_id' => $userId,'status'=>4])->count();
        $this->assign('order_count',$order_count);
        return $this->fetch();
    }

    public function jiedan()
    {
        $a="zjiedan";
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
            $where['z.name'] = ['like', "%$keyword%"];
        }
        $join = [
            ['__USER__ u', 'u.id = a.user_id'],
            ['__ZUHAO__ z', 'z.id = a.zh_id'],
        ];
        $field = 'a.*,z.name,z.pic,u.user_login,z.mobile';
        $order     = Db::name("zuhao_order")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(5);
        $data['page']  = $order->render();
        $data['lists'] = $order->items();
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        $order_count[0] = count(Db::name('zuhao_order')->where(['pw_id' => $userId])->select());
        $order_count[1] = count(Db::name('zuhao_order')->where(['pw_id' => $userId,'status'=>1])->select());
        $order_count[2] = count(Db::name('zuhao_order')->where(['pw_id' => $userId,'status'=>2])->select());
        $order_count[3] = count(Db::name('zuhao_order')->where(['pw_id' => $userId,'status'=>3])->select());
        $order_count[4] = count(Db::name('zuhao_order')->where(['pw_id' => $userId,'status'=>4])->select());
        $this->assign('order_count',$order_count);
        return $this->fetch();
    }


    public function zhifu()
    {
        $user = cmf_get_current_user();
        $data      = $this->request->param();
        $order = Db::name('zuhao_order')->where('id',$data['id'])->find();
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
            Db::name("zuhao_order")->where('id',$data['id'])->update(['status'  => 2,'pay_time'  => time()]);
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
            $this->success("支付成功，您可以联系陪玩师接单");
        }
    }

    public function shanghao()
    {
        $id = $this->request->param('id', 0, 'intval');
        $order = Db::name("zuhao_order")->where('id',$id)->find();
        if($order['status']==2)
        {
           Db::name("zuhao_order")->where('id',$id)->update(['status'=>3,'kaishi_time'=>time()]); 
           $this->success("上号成功");
        }
        else
        {
           $this->error("订单不符合接单条件！"); 
        }
    }


    public function wancheng()
    {
        $id = $this->request->param('id', 0, 'intval');
        $order = Db::name("zuhao_order")->where('id',$id)->find();
        if($order['status']==3)
        {
        $bili = Db('option')->where('option_name','fuwufei_kd')->value('option_value');
        Db::name("zuhao_order")->where('id',$id)->update(['status'=>4]);
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
            $zh_num = $order['zh_num'];
            Db::name('zuhao')->where('id',$order['zh_id'])->SetInc('shichang',$zh_num);
           $this->success("完成成功！");
        }
        else
        {
        $this->error("订单不符合完成条件！");
        }
    }


    
    public function quxiao()
    {
        $id                = $this->request->param("id", 0, "intval");
        $order = Db::name('zuhao_order')->where('id',$id)->find();
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
        $result = Db::name('zuhao_order')->where('id',$id)->update(['status'=>0]);
        if ($result) {
            $this->success("取消成功！",url('zorder/index'));
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