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

use cmf\controller\AdminBaseController;
use think\Db;
use think\Validate;


class AdminIndexController extends AdminBaseController
{

    /**
     * 后台本站用户列表
     * @adminMenu(
     *     'name'   => '本站用户',
     *     'parent' => 'default1',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户',
     *     'param'  => ''
     * )
     */
    public function index($user_type=3)
    {
        $where   = [];
        $request = $this->request->param();//input('request.');
        if($user_type){
        	$where['u.user_type'] = $user_type;
        }
        $keywordComplex = [];
        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $keywordComplex['user_login']    = ['like', "%$keyword%"];
        }
        $usersQuery = Db::name('user');
        $field = 'u.*,';
        $field .= '(SELECT r1.region_name FROM `cmf_region` r1 WHERE r1.region_id=u.province) AS provinceName, ';
        $field .= '(SELECT r2.region_name FROM `cmf_region` r2 WHERE r2.region_id=u.city) AS cityName, ';
        $field .= '(SELECT r3.region_name FROM `cmf_region` r3 WHERE r3.region_id=u.district) AS districtName';

        $list = $usersQuery->alias('u')->field($field)->whereOr($keywordComplex)->where($where)->order("create_time DESC")->paginate(20);
        // 获取分页显示
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }

    
    public function index_us()
    {
        return $this->index(2);
    }

    public function avatar_shenhe()
    {
        $where   = [];
        $request = $this->request->param();//input('request.');
        $where['u.user_type'] = 3;
        $where['u.avatar_shenhe'] = ['neq','']; 
        $keywordComplex = [];
        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $keywordComplex['user_login']    = ['like', "%$keyword%"];
        }
        $usersQuery = Db::name('user');
        $field = 'u.*,';
        $field .= '(SELECT r1.region_name FROM `cmf_region` r1 WHERE r1.region_id=u.province) AS provinceName, ';
        $field .= '(SELECT r2.region_name FROM `cmf_region` r2 WHERE r2.region_id=u.city) AS cityName, ';
        $field .= '(SELECT r3.region_name FROM `cmf_region` r3 WHERE r3.region_id=u.district) AS districtName';

        $list = $usersQuery->alias('u')->field($field)->whereOr($keywordComplex)->where($where)->order("create_time DESC")->paginate(20);
        // 获取分页显示
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();   
    }

    public function avatarshenhe()
    {
       $request = $this->request->param();
       $user_id = $request['id'];
       if($request['status']==1)
       {
        $avatar_shenhe = Db('user')->where('id',$user_id)->value('avatar_shenhe');
        Db('user')->where('id',$user_id)->update(['avatar'=>$avatar_shenhe,'avatar_shenhe'=>'']);
        $this->success('审核通过');
       }
       else
       {
        Db('user')->where('id',$user_id)->update(['avatar_shenhe'=>'']);
        $this->success('审核拒绝');
       }
    }

    
   public function renzheng_shenhe()
    {
        $where   = [];
        $request = $this->request->param();//input('request.');
        $where['a.shenhe'] = 2; 
        $keywordComplex = [];
        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $keywordComplex['u.user_login']    = ['like', "%$keyword%"];
        }
        $usersQuery = Db::name('user_moneyinfo');
        $field = 'a.*,u.user_login';
        $join = [
            ['__USER__ u','u.id=a.user_id']
        ];

        $list = $usersQuery->alias('a')->field($field)->join($join)->whereOr($keywordComplex)->where($where)->order("a.id DESC")->paginate(20);
        // 获取分页显示
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();   
    }

    public function rzshenhe()
    {
       $request = $this->request->param();
       $id = $request['id'];
       if($request['status']==1)
       {
        Db('user_moneyinfo')->where('id',$id)->update(['shenhe'=>1]);
        $this->success('审核已通过');
       }
       else
       {
        Db('user_moneyinfo')->where('id',$id)->update(['shenhe'=>0]);
        $this->success('审核已拒绝');
       }
    }
    

    
    public function ban()
    {
        $id = input('param.id', 0, 'intval');
        
        $where['a.id'] = $id;
        
        $field = 'a.*,(SELECT r1.region_name FROM `cmf_region` r1 WHERE r1.region_id=a.province) as sheng,(SELECT r2.region_name FROM `cmf_region` r2 WHERE r2.region_id=a.city) as shi,(SELECT r3.region_name FROM `cmf_region` r3 WHERE r3.region_id=a.district) AS qu,(SELECT GROUP_CONCAT(c.cat_name) FROM `cmf_category` c WHERE FIND_IN_SET(c.id,a.gexing)) AS gexing,(SELECT count(*) FROM `cmf_guanzhu` g WHERE g.pw_id=a.id) AS guanzhu';
        $user = Db::name('user')->alias('a')->field($field)->where($where)->find();
        $this->assign('user',$user);
        
        $where1['a.user_id'] = $id;
        $jineng = Db::name("user_jineng")->alias('a')->field('a.*,(SELECT c1.cat_name FROM `cmf_category` c1 WHERE c1.id=a.cat_id) as fuwu,(SELECT c2.cat_name FROM `cmf_category` c2 WHERE c2.id=a.level) as level')->where($where1)->order('a.id desc')->select();
            $this->assign("jineng", $jineng);

        return $this->fetch();
    }

    public function edit()
    {
        $id = input('param.id', 0, 'intval');
        
        $where['a.id'] = $id;
        
        $field = 'a.*,(SELECT r1.region_name FROM `cmf_region` r1 WHERE r1.region_id=a.province) as sheng,(SELECT r2.region_name FROM `cmf_region` r2 WHERE r2.region_id=a.city) as shi,(SELECT r3.region_name FROM `cmf_region` r3 WHERE r3.region_id=a.district) AS qu,(SELECT GROUP_CONCAT(c.cat_name) FROM `cmf_category` c WHERE FIND_IN_SET(c.id,a.gexing)) AS gexing,(SELECT count(*) FROM `cmf_guanzhu` g WHERE g.pw_id=a.id) AS guanzhu';
        $user = Db::name('user')->alias('a')->field($field)->where($where)->find();
        $this->assign('user',$user);

        return $this->fetch();
    }

    public function yue()
    {
        $id = input('param.id', 0, 'intval');
        
        $where['id'] = $id;
        
        
        $user = Db::name('user')->where($where)->find();
        $user['yue'] = Db('user_moneyinfo')->where('user_id',$id)->value('yue');
        $this->assign('user',$user);

        return $this->fetch();
    }

    public function edit_yue()
    {
        $validate = new Validate(
        $rule = [
            'money' => 'require|number',
        ],
        $mes = [
            'money.require'=>'金额不能为空',
            'money.number' =>'金额必须是数字',
        ]);
        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }
        if($data['status']==0)
        {
            $data1 = array();
            $data1['user_id'] = $data['id'];
            $data1['money'] = $data['money'];
            $data1['style'] = '收入';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            $data1['content'] = '管理员后台增加金额';
            Db::name("user_moneyrecord")->insert($data1);
            $jine = $data['money'];
            $data_m = array(
            'yue'=>array('exp','yue+'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$data['id'])->update($data_m);
            $this->success('给用户增加余额成功');
        }
        else
        {
           if($data['money']>$data['yue'])
           {
            $this->error('减少金额不能大于用户余额');
           }
           else
           {
            $data1 = array();
            $data1['user_id'] = $data['id'];
            $data1['money'] = $data['money'];
            $data1['style'] = '支出';
            $data1['pay_time'] = time();
            $data1['status'] = 1;
            $data1['content'] = '管理员后台减少金额';
            Db::name("user_moneyrecord")->insert($data1);
            $jine = $data['money'];
            $data_m = array(
            'yue'=>array('exp','yue-'.$jine),
             );
            Db::name('user_moneyinfo')->where('user_id',$data['id'])->update($data_m);
            $this->success('给用户减少余额成功');
           }
        }
    }

    public function edit_uid()
    {
       $validate = new Validate(
        $rule = [
            'uid' => 'require|integer|min:5',
        ],
        $mes = [
            'uid.require'=>'靓号不能为空',
            'uid.integer' =>'靓号必须是数字',
            'uid.min' =>'靓号最少五位'
        ]);
        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }
        $count =  Db('user')->where('id','<>',$data['id'])->where('uid',$data['uid'])->count();
        if($count>0)
        {
            $this->error('此靓号已经被其他用户占用，请输入其他靓号');
        }
        else
        {
            Db('haoma')->where('haoma',$data['uid'])->delete();
            Db('user')->where('id',$data['id'])->update(['uid'=>$data['uid']]);
            $this->success('修改靓号成功');
        }
    }
   

     public function shenhe()
    {
        $id = input('param.id', 0, 'intval');
		$shenhe = input('param.shenhe', 0, 'intval');
        $user = Db::name("user")->where(['id'=>$id])->find();
        if ($id) {
            if($shenhe==2)
            {
             Db::name("user_jineng")->where(['user_id'=>$id])->delete();
             Db::name("user")->where(["id" => $id])->update(['shenhe'=>0,'user_type'=>2]);
             $this->send($user['mobile'],'SMS_167395061');
            }
            else
            {
              Db::name("user")->where(["id" => $id])->update(['shenhe'=>1]);
              $this->send($user['mobile'],'SMS_167370832');
            }
            $this->success("审核成功！", url('adminIndex/index'));
        } else {
            $this->error('审核失败！');
        }
    }

    public function send($mobile,$TemplateCode)
    {
    require_once "./dx/SignatureHelper.php";  
        
    $params = array ();
    // *** 需用户填写部分 ***
    // fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
    $accessKeyId = "LTAI4Fus64fRVDj3De69Dv5x";
    $accessKeySecret = "CFkaG1RqkJcGJ1GeRDdZlWZAsrQBvx";
    // fixme 必填: 短信接收号码
    $params["PhoneNumbers"] = $mobile;

    // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
    $params["SignName"] = "新源代源码";

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
   

    /**
     * 本站用户启用
     * @adminMenu(
     *     'name'   => '本站用户启用',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户启用',
     *     'param'  => ''
     * )
     */
    public function jinyong()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            Db::name("user")->where(["id" => $id])->update(['user_status'=>0,'shenhe'=>0]);
            $this->success("会员禁用成功！", '');
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function qiyong()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            Db::name("user")->where(["id" => $id])->update(['user_status'=>1,'shenhe'=>1]);
            $this->success("会员启用成功！", '');
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function tuijian()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            Db::name("user")->where(["id" => $id])->update(['tuijian'=>1]);
            $this->success("推荐成功！");
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function qxtuijian()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            Db::name("user")->where(["id" => $id])->update(['tuijian'=>0]);
            $this->success("推荐成功！");
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function renzheng()
    {
        $id = input('param.id', 0, 'intval');
        $status = input('param.status', 1, 'intval');
        if ($id) {
            Db::name("user")->where(["id" => $id])->update(['renzheng'=>$status]);
            if($status==1)
            {
            $this->success("真人认证成功！", '');
            }
            else
            {
              $this->success("取消真人认证成功！", ''); 
            }
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function tags()
    {
       $id = input('param.id', 0, 'intval');
        
        $where['id'] = $id;
        
        $user = Db::name('user')->where($where)->find();
        $this->assign('user',$user);

        return $this->fetch();
        
    }

    public function edit_tags()
    {
        $id = input('param.id', 0, 'intval');
        $biaoqian = input('param.biaoqian');
        if ($id) {
            Db::name("user")->where(["id" => $id])->update(['tags'=>$biaoqian]);
            $this->success("设置标签成功！");
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function xiaoxi()
    {
        $id = input('param.id', 0, 'intval');
        if($id==0)
        {
          $user =['id'=>0,'user_login'=>'所有人'];
        }
        else
        {
        $where['id'] = $id;
        
        $user = Db::name('user')->where($where)->find();
        }
        $this->assign('user',$user);

        return $this->fetch();
    }


   public function add_message()
    {
        $id = input('param.id', 0, 'intval');
        $title = input('param.title');
        $content = input('param.content');
        //if ($id) {
            Db::name("message")->insert(['add_time'=>time(),'title'=>$title,'content'=>$content,'user_id'=>$id]);
            $this->success("发送消息成功！");
        //} else {
          //  $this->error('数据传入失败！');
       // }
    }
    
}
