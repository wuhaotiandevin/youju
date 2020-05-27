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

class MsgController extends UserBaseController
{

   public function index()
   {
   	require "./lobby/TLSSigAPI.php";
   	$user              = cmf_get_current_user();
   	$data = $this->request->param();
   	if(!empty($data['id']))
   	{
   		$field = 'a.*,u.avatar,u.user_login,c.cat_name';
   		$join = [
            ['__USER__ u', 'a.user_id = u.id'],
            ['__CATEGORY__ c', 'a.cat_id = c.id'],
        ];
        $fuwu = Db::name('user_jineng')->alias('a')->field($field)->join($join)->where('a.id',$data['id'])->find();
        $this->faxiaoxi($user['user_login'],$fuwu['user_login']);
   	}
   	$api = new \TLSSigAPI();
    $api->SetAppid(1400218214);//设置在腾讯云申请的appid
    $api->SetPrivateKey('-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg/QvO8pqwet0KefuV
TA4RMwL8O9zJisSCSw4HrjgH+9WhRANCAASLJTOjK/DkRHoiQLSDS9nbAb0+mYVA
3H7FiExkXizAoixqB0Yrqm43esCgAitL7IIpTHtmDvosYYa89hI5dmeN
-----END PRIVATE KEY-----
');//生成usersig需要先设置私钥
    $api->SetPublicKey('-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEiyUzoyvw5ER6IkC0g0vZ2wG9PpmF
QNx+xYhMZF4swKIsagdGK6puN3rAoAIrS+yCKUx7Zg76LGGGvPYSOXZnjQ==
-----END PUBLIC KEY-----
');//校验usersig需要先设置公钥
    $sig = $api->genSig($user['user_login']);
    $user['sig'] = $sig;
    $this->assign($user);
   	$this->assign('a','xiaoxi');
   	return $this->fetch('index');
   }

   public function faxiaoxi($from_user,$to_user)
       {
        $post_data = array();
        $post_data['sdkappid'] = '1400218214';
        $post_data['identifier'] = 'admin';
        $post_data['usersig'] = 'eJxlz8FOg0AQgOE7T0G4anR2YSsx8WKrQLQoQm30QrbsQocKXWGhEuO7G7GJJM71*yeT*TRM07SS*-iMZ9m*q3WqByUt89K0wDr9Q6VQpFyndiP*ofxQ2MiU51o2IxLGGAWYNihkrTHHY8FFhfWEW7FLxxu-*w4AJS4lzjTBYsTlzWoeRIuDD9eR-eTegZv4rytavuE6PynXqn-uPHabLMKgdFRVJEEUFJuhYpu5brelTeNdKLNwy7mI*dLz8*4R6PtL7D2QAc-77GpyUmMljw-NwKYMZhcT7WXT4r4eAwqEEWrDz1jGl-EN9KNdBQ__';
        $post_data['random'] = 99999999; 
        $post_data['contenttype'] = 'json'; 
        $o='';  
        foreach ($post_data as $k=>$v)
        {
           $o.="$k=".urlencode($v).'&';
        }
        $post_data=substr($o,0,-1);
        $url='https://console.tim.qq.com/v4/openim/sendmsg?'.$post_data;
$param = [
"SyncOtherMachine"=>1,
"From_Account"=>$from_user,
"To_Account"=>$to_user,
"MsgRandom"=>1287657,
"MsgTimeStamp"=>1557387418,
"MsgBody"=>[
[
"MsgType"=>"TIMTextElem",
"MsgContent"=>[
"Text"=> "你好",
],
],
],
];
$param = json_encode($param, true);
$ch = curl_init();
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, false );
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
'Content-Type: application/json; charset=utf-8',
'Content-Length: '.strlen($param))
);
curl_exec($ch);
curl_close($ch);
//return $response;
}


public function daorusuoyou()
       {
       	$user = Db('user')->select();
        $param['Accounts']=[];
       	foreach ($user as $key => $value) {
       		$param['Accounts'][] = $value['user_login'];
       	}
        $post_data = array();
        $post_data['sdkappid'] = '1400218214';
        $post_data['identifier'] = 'admin';
        $post_data['usersig'] = 'eJxlz8FOg0AQgOE7T0G4anR2YSsx8WKrQLQoQm30QrbsQocKXWGhEuO7G7GJJM71*yeT*TRM07SS*-iMZ9m*q3WqByUt89K0wDr9Q6VQpFyndiP*ofxQ2MiU51o2IxLGGAWYNihkrTHHY8FFhfWEW7FLxxu-*w4AJS4lzjTBYsTlzWoeRIuDD9eR-eTegZv4rytavuE6PynXqn-uPHabLMKgdFRVJEEUFJuhYpu5brelTeNdKLNwy7mI*dLz8*4R6PtL7D2QAc-77GpyUmMljw-NwKYMZhcT7WXT4r4eAwqEEWrDz1jGl-EN9KNdBQ__';
        $post_data['random'] = 99999999; 
        $post_data['contenttype'] = 'json'; 
        $o='';  
        foreach ($post_data as $k=>$v)
        {
           $o.="$k=".urlencode($v).'&';
        }
        $post_data=substr($o,0,-1);
        $url='https://console.tim.qq.com/v4/im_open_login_svc/multiaccount_import?'.$post_data;
$param = json_encode($param, true);
$ch = curl_init();
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, false );
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
'Content-Type: application/json; charset=utf-8',
'Content-Length: '.strlen($param))
);
$response = curl_exec($ch);
curl_close($ch);
return $response;
}

public function shezhitouxiang()
{
	$user = Db('user')->select();
       	foreach ($user as $key => $value) {
       	$param['From_Account']= $value['user_login'];
       	$param['ProfileItem'] = [
       		[
       			'Tag'=>'Tag_Profile_IM_Image',
       			'Value'=>'http://peiwan.wdzxiu.com/upload/'.$value['avatar']
       		]
       	];
       	$post_data = array();
        $post_data['sdkappid'] = '1400218214';
        $post_data['identifier'] = 'admin';
        $post_data['usersig'] = 'eJxlz8FOg0AQgOE7T0G4anR2YSsx8WKrQLQoQm30QrbsQocKXWGhEuO7G7GJJM71*yeT*TRM07SS*-iMZ9m*q3WqByUt89K0wDr9Q6VQpFyndiP*ofxQ2MiU51o2IxLGGAWYNihkrTHHY8FFhfWEW7FLxxu-*w4AJS4lzjTBYsTlzWoeRIuDD9eR-eTegZv4rytavuE6PynXqn-uPHabLMKgdFRVJEEUFJuhYpu5brelTeNdKLNwy7mI*dLz8*4R6PtL7D2QAc-77GpyUmMljw-NwKYMZhcT7WXT4r4eAwqEEWrDz1jGl-EN9KNdBQ__';
        $post_data['random'] = 99999999; 
        $post_data['contenttype'] = 'json'; 
        $o='';  
        foreach ($post_data as $k=>$v)
        {
           $o.="$k=".urlencode($v).'&';
        }
        $post_data=substr($o,0,-1);
        $url='https://console.tim.qq.com/v4/profile/portrait_set?'.$post_data;
		$param = json_encode($param, true);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
		curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, false );
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
		'Content-Type: application/json; charset=utf-8',
		'Content-Length: '.strlen($param))
		);
		$response = curl_exec($ch);
		curl_close($ch);
		return $response;
       		
       	}
        
}

public function huoqutouxiang()
{

       	$param['To_Account']=['ceshi1','root'];
       	$param['TagList'] = 
       		[
       			 'Tag_Profile_IM_Image'
       		];
       	$post_data = array();
        $post_data['sdkappid'] = '1400218214';
        $post_data['identifier'] = 'admin';
        $post_data['usersig'] = 'eJxlz8FOg0AQgOE7T0G4anR2YSsx8WKrQLQoQm30QrbsQocKXWGhEuO7G7GJJM71*yeT*TRM07SS*-iMZ9m*q3WqByUt89K0wDr9Q6VQpFyndiP*ofxQ2MiU51o2IxLGGAWYNihkrTHHY8FFhfWEW7FLxxu-*w4AJS4lzjTBYsTlzWoeRIuDD9eR-eTegZv4rytavuE6PynXqn-uPHabLMKgdFRVJEEUFJuhYpu5brelTeNdKLNwy7mI*dLz8*4R6PtL7D2QAc-77GpyUmMljw-NwKYMZhcT7WXT4r4eAwqEEWrDz1jGl-EN9KNdBQ__';
        $post_data['random'] = 99999999; 
        $post_data['contenttype'] = 'json'; 
        $o='';  
        foreach ($post_data as $k=>$v)
        {
           $o.="$k=".urlencode($v).'&';
        }
        $post_data=substr($o,0,-1);
        $url='https://console.tim.qq.com/v4/profile/portrait_get?'.$post_data;
		$param = json_encode($param, true);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
		curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, false );
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
		'Content-Type: application/json; charset=utf-8',
		'Content-Length: '.strlen($param))
		);
		$response = curl_exec($ch);
		curl_close($ch);
		return $response;
       		
       	
        
}

}