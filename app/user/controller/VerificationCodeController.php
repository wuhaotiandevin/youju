<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace app\user\controller;

use cmf\controller\HomeBaseController;
use think\Validate;

class VerificationCodeController extends HomeBaseController
{
    public function send()
    {
	require_once "./dx/SignatureHelper.php";
	$data = $this->request->param();
        $validate = new Validate([
            'mobile' => 'require',
        ]);

        $validate->message([
            'mobile.require' => '请输入手机号!',
        ]);

        
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }


        if (preg_match('/(^(13\d|15[^4\D]|17[013678]|18\d|19\d)\d{8})$/', $data['mobile'])) {
		
            
			$params = array ();

    // *** 需用户填写部分 ***

    // fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
    $accessKeyId = "LTAIeB35TLJh82Vn";
    $accessKeySecret = "g3uFIsanaePjcVZsQEMZF4cpdzCGwn";
    $vacode=rand('1111','9999');
    // fixme 必填: 短信接收号码
    $params["PhoneNumbers"] = $data['mobile'];

    // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
    $params["SignName"] = "淘约玩";

    // fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
    $params["TemplateCode"] = "SMS_144365052";

    // fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
    $params['TemplateParam'] = Array (
        "code" => $vacode,
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
    if($content['Message']=="OK")
	{
	cmf_verification_code_log($data['mobile'], $vacode);
	$this->success("发送成功，请接收!");
	}
	else
	{
	$this->error("每分钟只能发送一条!");
	} 
			
			
        } else {
            $this->error("请输入正确的手机!");
        }
    }

}
