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

use cmf\lib\Storage;
use think\Validate;
use think\Image;
use cmf\controller\UserBaseController;
use app\admin\model\OrderInfoModel;
use app\user\model\UserModel;
use think\Db;

class ProfileController extends UserBaseController
{

    function _initialize()
    {
        parent::_initialize();
        $a="";
    }

    /**
     * 会员中心首页
     */
    public function center()
    {
        $a="center";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $user = Db('user')->where('id',$user['id'])->find();
        $this->assign($user);
        $userId = cmf_get_current_user_id();
        

        $count[0] = 0;
        $count[1] = Db::name("order")->where('pw_id',$userId)->where('status','>',3)->count();
        $count[2] = Db::name("order")->where('user_id',$userId)->count();
        $this->assign('count',$count);
        $qianbao = Db::name("user_moneyinfo")->where('user_id',$userId)->find();
       if(empty($qianbao))
       {
       $uminfo = array('user_id' => $user['id'], );
       Db::name("user_moneyinfo")->insert($uminfo);
       $this->assign('qianbao',['yue'=>0.00]);
       }
        
        $this->assign('qianbao',$qianbao);
        return $this->fetch();
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
        return $this->fetch();
    }

    public function buyhao()
    {
       $data      = $this->request->param(); 
       $haoma  = DB::name("haoma")->where('id',$data['id'])->find();
       $userId = cmf_get_current_user_id();
       $yue = Db('user_moneyinfo')->where('user_id',$userId)->value('yue');
       if($haoma['price']>$yue)
       {
        $this->error('余额不足，请充值');
       }
       else
       {
                $data2 = array();
                $data2['user_id'] = $userId;
                $data2['money'] = $haoma['price'];
                $data2['style'] = '支出';
                $data2['pay_time'] = time();
                $data2['status'] = 1;
                $data2['content'] = '购买靓号:'.$haoma['haoma'];
                Db::name("user_moneyrecord")->insert($data2);
                $data_m = array(
                'yue'=>array('exp','yue-'.$haoma['price']),
                 );
                Db::name('user_moneyinfo')->where('user_id',$userId)->update($data_m);
                Db::name('user')->where('id',$userId)->update(['uid'=>$haoma['haoma']]);
                Db::name("haoma")->where('id',$data['id'])->delete();
                $this->success('购买靓号成功','user/profile/center');
       }
    }

    public function editname()
    {
       $user = cmf_get_current_user();
       $this->assign($user);
       $gaiming  = DB::name("option")->where('option_name','gaiming')->value('option_value');
       $this->assign('gaiming',$gaiming);
       return $this->fetch('editname');
    }

    public function edit_name()
    {
        $data      = $this->request->param(); 
        $result = Db('user')->where('user_login',$data['name'])->find();
            if(empty($result))
            {
                Db('user')->where('id',$data['id'])->update(['user_login'=>$data['name']]);
                Db('user')->where('id',$data['id'])->setDec('gaimingka');
                $userInfo = Db('user')->where('id', $data['id'])->find();
                cmf_update_current_user($userInfo);
                $this->success('修改昵称成功');
            }
            else
            {
                $this->error('该昵称已被占用,请换个昵称');
            }
        
    }

    public function buygaiming()
    {
        
        $gaiming  = DB::name("option")->where('option_name','gaiming')->value('option_value');
       $userId = cmf_get_current_user_id();
       $yue = Db('user_moneyinfo')->where('user_id',$userId)->value('yue');
       if($gaiming>$yue)
       {
        $this->error('余额不足，请充值');
       }
       else
       {
                $data2 = array();
                $data2['user_id'] = $userId;
                $data2['money'] = $gaiming;
                $data2['style'] = '支出';
                $data2['pay_time'] = time();
                $data2['status'] = 1;
                $data2['content'] = '购买改名卡，价格:'.$gaiming;
                Db::name("user_moneyrecord")->insert($data2);
                $data_m = array(
                'yue'=>array('exp','yue-'.$gaiming),
                 );
                Db::name('user_moneyinfo')->where('user_id',$userId)->update($data_m);
                Db('user')->where('id',$userId)->setInc('gaimingka');
                $userInfo = Db('user')->where('id', $userId)->find();
                cmf_update_current_user($userInfo);
                $this->success('购买改名卡成功');
       }
    }

    public function buytuijian()
    {
       $data      = $this->request->param(); 
       $tuijianjia  = DB::name("option")->where('option_name','tuijian')->value('option_value');
       $userId = cmf_get_current_user_id();
       $yue = Db('user_moneyinfo')->where('user_id',$userId)->value('yue');
       if($tuijianjia>$yue)
       {
        $this->error('余额不足，请充值');
       }
       else
       {
                $data2 = array();
                $data2['user_id'] = $userId;
                $data2['money'] = $tuijianjia;
                $data2['style'] = '支出';
                $data2['pay_time'] = time();
                $data2['status'] = 1;
                $data2['content'] = '购买推荐位，价格:'.$tuijianjia;
                Db::name("user_moneyrecord")->insert($data2);
                $data_m = array(
                'yue'=>array('exp','yue-'.$tuijianjia),
                 );
                Db::name('user_moneyinfo')->where('user_id',$userId)->update($data_m);
                Db::name('user')->where('id',$userId)->update(['tuijian'=>1]);
                $this->success('购买推荐位成功');
       }
    }


    /**
     * 编辑用户资料
     */
    public function edit()
    {
        $a="ziliao";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);
        return $this->fetch('edit');
    }


    /**
     * 编辑用户资料提交
     */
    public function editPost()
    {
        if ($this->request->isPost()) {
           $validate = new Validate([
                //'mobile'=> 'require',
                'qq' => 'require',
            ]);
            $validate->message([
                //'mobile.require' =>'手机号码不能为空',
                'qq.require' => 'QQ号码不能为空',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
            $user = cmf_get_current_user();
            if($user['user_type']==2)
            {
                $data1['qq'] = $data['qq'];
                //$data1['mobile'] = $data['mobile'];
                $data1['weixin'] = $data['weixin'];
                $userQuery        = Db::name("user");
              if ($userQuery->where('id', $user['id'])->update($data1)) 
              {
               $userInfo = $userQuery->where('id', $user['id'])->find();
               cmf_update_current_user($userInfo);
               $this->success("填写基本信息成功");
             }
             else
             {
                $this->error("没有新的修改信息！");
             }
            }
        else
        {
            if($data['province']<1||$data['city']<1||$data['district']<1)
            {
                $this->error('请选择所在地区');
            }
            if(empty($data['gexing']))
            {
                $this->error('请选择个性标签');
            }
            if(count($data['gexing'])>3)
            {
                $this->error('最多只能选三种个性标签');
            }
            $data['gexing']=implode(",",$data['gexing']);
            $editData = new UserModel();
            if ($editData->editData($data)) {
                $this->success("填写基本信息成功");
            } else {
                $this->error("没有新的修改信息！");
            }
        }
        } else {
            $this->error("请求错误");
        }
    }

    public function jineng()
    {
        $a="jineng";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);

        $field = 'a.*,c1.cat_name as jineng,c2.cat_name as dengji';
        $join =[
            ['__CATEGORY__ c1','c1.id=a.cat_id'],
            ['__CATEGORY__ c2','c2.id=a.level'],
        ];
        $jineng = Db::name("user_jineng")->alias('a')->field($field)->join($join)->where('a.user_id',$user['id'])->select();
        $this->assign("jineng",$jineng);
        return $this->fetch('jineng');
    }

    public function addjineng()
    {
        $a="jineng";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);
        $cat = Db('category')->where('parent_id',0)->where('id!=56')->select();
        $this->assign("cat",$cat);
        $level = Db('category')->where('parent_id',1)->select();
        $this->assign("level",$level);
        return $this->fetch('addjineng');
    }


    public function add_jineng()
    {
        if ($this->request->isPost()) {
        $validate = new Validate([
                'cat_id' => 'require',
                'level'=>'require',
                'pic'=> 'require', 
                //'jiage'=> 'require',                
            ]);
            $validate->message([
                'cat_id.require' => '请选择技能名称',
                'level.require' =>'请选择技能等级',
                'pic.require' => '请上传等级图片',
                //'jiage.require' => '请输入服务价格',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
        $user = cmf_get_current_user(); 
        $jineng = Db('user_jineng')->where(['user_id'=>$user['id'],'cat_id'=>$data['cat_id']])->find();
        if($jineng)
        {
            $this->error('此技能已经添加过了');
        }        
        $data1   = [
            'user_id'         => $user['id'],
            'cat_id'      =>     $data['cat_id'],
            'level'      =>     $data['level'],
            'jiage'       => 0,
            'pic'       => $data['pic'],
            'status'       => 2,
        ];
        Db::name("user_jineng")->insert($data1);
        $this->success("添加技能成功！");
         } else {
            $this->error("请求错误");
        }
    }

    public function editjineng()
    {
        $a="jineng";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);

       $id = $this->request->param('id', 0, 'intval');
       $jineng = Db('user_jineng')->where('id',$id)->find();
       $this->assign('jineng',$jineng);

        $cat = Db('category')->where('parent_id',0)->where('id!=56')->select();
        $this->assign("cat",$cat);
        $level = Db('category')->where('parent_id',1)->select();
        $this->assign("level",$level);
        return $this->fetch('editjineng');

    }



    public function edit_jineng()
    {
        if ($this->request->isPost()) {
        $validate = new Validate([
                'cat_id' => 'require',
                'level'=>'require',
                'pic'=> 'require', 
                //'jiage'=> 'require',                
            ]);
            $validate->message([
                'cat_id.require' => '请选择技能名称',
                'level.require' =>'请选择技能等级',
                'pic.require' => '请上传等级图片',
                //'jiage.require' => '请输入服务价格',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
        $user = cmf_get_current_user();       
        $data1   = [
            'cat_id'      =>     $data['cat_id'],
            'level'      =>     $data['level'],
            //'jiage'       => $data['jiage'],
            'pic'       => $data['pic'],
            'status'       => 2,
        ];
        Db::name("user_jineng")->where('id',$data['id'])->update($data1);
        $this->success("修改技能成功！");
         } else {
            $this->error("请求错误");
        }
    }
    
    public function sj_jineng()
    {
        $id = $this->request->param('id', 0, 'intval');
        $jineng = Db::name("user_jineng")->where('id',$id)->find();
        if($jineng['status']==2)
        {
            $this->error('审核中的技能不能上架。');
        }
        Db::name("user_jineng")->where('id',$id)->update(['status'=>1]);
        $this->success("上架技能成功！");
    }

    public function xj_jineng()
    {
        $id = $this->request->param('id', 0, 'intval');
        $user = cmf_get_current_user();
        $count =  Db::name("user_jineng")->where(['user_id'=>$user['id'],'status'=>1])->count();
       if($count<=1)
       {
        $this->error('不允许下架所有技能');
       }
        Db::name("user_jineng")->where('id',$id)->update(['status'=>0]);
        $this->success("下架技能成功！");
    }

    public function zhekou()
    {
        $a="zhekou";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);

        $field = 'a.*,c1.cat_name as jineng,c2.cat_name as dengji';
        $join =[
            ['__CATEGORY__ c1','c1.id=a.cat_id'],
            ['__CATEGORY__ c2','c2.id=a.level'],
        ];
        $jineng = Db::name("user_jineng")->alias('a')->field($field)->join($join)->where(['a.user_id'=>$user['id'],'a.status'=>1])->select();
        $this->assign("jineng",$jineng);
        return $this->fetch('zhekou');
    }

    public function editDis()
    {
        if ($this->request->isPost()) {
        $validate = new Validate([
                'dis9' => 'number|between:0,24', 
                'dis8'=>'number|between:0,24', 
                'dis7'=> 'number|between:0,24', 
            ]);
            $validate->message([
                'dis9.number' => '时长必须是数字',
                'dis8.number' =>'时长必须是数字',
                'dis7.number' => '时长必须是数字',
                'dis9.between' => '时长只能在只能在0-24之间',
                'dis8.between' =>'时长只能在只能在0-24之间',
                'dis7.between' => '时长只能在只能在0-24之间',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
            if(($data['dis9']==1) || ($data['dis8']==1) || ($data['dis7']==1))
            {
                $this->error('时长必须大于1小时');
            }
        $data1   = [
            'dis9'      =>     $data['dis9'],
            'dis8'      =>     $data['dis8'],
            'dis7'       => $data['dis7'],
        ];
        Db::name("user_jineng")->where('id',$data['id'])->update($data1);
        $this->success("设置成功！");
         } else {
            $this->error("请求错误");
        }
    }
    /**
     * 个人中心修改密码
     */
    public function password()
    {
         $a="mima";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);
        return $this->fetch();
    }



    /**
     * 个人中心修改密码提交
     */
    public function passwordPost()
    {
        if ($this->request->isPost()) {
            $validate = new Validate([
                'old_password' => 'require|min:6|max:32',
                'password'     => 'require|min:6|max:32',
                'repassword'   => 'require|min:6|max:32',
            ]);
            $validate->message([
                'old_password.require' => '旧密码不能为空',
                'old_password.max'     => '旧密码不能超过32个字符',
                'old_password.min'     => '旧密码不能小于6个字符',
                'password.require'     => '新密码不能为空',
                'password.max'         => '新密码不能超过32个字符',
                'password.min'         => '新密码不能小于6个字符',
                'repassword.require'   => '重复密码不能为空',
                'repassword.max'       => '重复密码不能超过32个字符',
                'repassword.min'       => '重复密码不能小于6个字符',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }

            $login = new UserModel();
            $log   = $login->editPassword($data);
            switch ($log) {
                case 0:
                    $this->success('修改成功');
                    break;
                case 1:
                    $this->error('密码输入不一致');
                    break;
                case 2:
                    $this->error('原始密码不正确');
                    break;
                default :
                    $this->error('未受理的请求');
            }
        } else {
            $this->error("请求错误");
        }

    }

    // 用户头像编辑
    public function avatar()
    {
        $a="touxiang";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $user = Db('user')->where('id',$user['id'])->find();
        $this->assign($user);
        return $this->fetch();
    }

    public function bgimg()
    {
        $a="beijing";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $user = Db('user')->where('id',$user['id'])->find();
        $this->assign($user);
        return $this->fetch();
    }

    public function bgimgUpdate()
    {
        $bgimg = $this->request->param('bgimg');
        if (!empty($bgimg)) {

                $user = cmf_get_current_user();
                
                Db::name("user")->where(["id" => $user['id']])->update(["bgimg" => $bgimg]);
                session('user.bgimg', $bgimg);
                $this->success("背景修改成功！"); 
                
                
            } else {
                $this->error("背景修改失败！");
            }
    }

    // 用户头像上传
    public function avatarUpload()
    {
        $file   = $this->request->file('file');
        $result = $file->validate([
            'ext'  => 'jpg,jpeg,png,gif',
            'size' => 1024 * 1024
        ])->move('.' . DS . 'upload' . DS . 'avatar' . DS);

        if ($result) {
            $avatarSaveName = str_replace('//', '/', str_replace('\\', '/', $result->getSaveName()));
            $avatar         = 'avatar/' . $avatarSaveName;
            session('avatar', $avatar);

            return json_encode([
                'code' => 1,
                "msg"  => "上传成功",
                "data" => ['file' => $avatar],
                "url"  => ''
            ]);
        } else {
            return json_encode([
                'code' => 0,
                "msg"  => $file->getError(),
                "data" => "",
                "url"  => ''
            ]);
        }
    }

    // 用户头像裁剪
    public function avatarUpdate()
    {
        $avatar = session('avatar');
        if (!empty($avatar)) {
            // $w = $this->request->param('w', 0, 'intval');
            // $h = $this->request->param('h', 0, 'intval');
            // $x = $this->request->param('x', 0, 'intval');
            // $y = $this->request->param('y', 0, 'intval');

            $avatarPath = "./upload/" . $avatar;

            // $avatarImg = Image::open($avatarPath);
            // $avatarImg->crop($w, $h, $x, $y)->save($avatarPath);

            $result = true;
            if ($result === true) {
                $storage = new Storage();
                $result  = $storage->upload($avatar, $avatarPath, 'image');

                $user = cmf_get_current_user();
                if($user['user_type']==3)
                {
                Db::name("user")->where(["id" => $user['id']])->update(["avatar_shenhe" => $avatar]);
                session('user.avatar_shenhe', $avatar);
                $this->success("头像上传成功，将在审核后显示！");
                }
                else
                {
                Db::name("user")->where(["id" => $user['id']])->update(["avatar" => $avatar]);
                session('user.avatar', $avatar);
                $this->success("头像上传成功！"); 
                }
                
            } else {
                $this->error("头像保存失败！");
            }

        }
    }

    public function guild()
    {
      $this->assign('a','guild');
      $userId = cmf_get_current_user_id(); 
      $user = Db('user')->where('id',$userId)->find(); 
      $this->assign($user);
      $join = 0;
      $guilds = Db('guild')->select();
      if(!empty($user['guild']))
      {
        $guilds = Db('guild')->where('id',$user['guild'])->select();
        $join = 1;
      }
      $this->assign('join',$join);
      $this->assign('guilds',$guilds);
      return $this->fetch(); 
    }

    public function join_guild()
    {
        $data = $this->request->param();
        $userId = cmf_get_current_user_id(); 
        $result = Db('user')->where('id',$userId)->update(['guild'=>$data['guild'],'guild_reason'=>$data['guild_reason']]);
        if($result)
        {
            $this->success('申请成功，请等待管理员审核');
        }
        else
        {
            $this->success('申请失败');
        }
    }
	

    function ajax_return(){
        $parent_id = $this->request->param('pid', 0, 'intval');
    //  echo $parent_id;
        $where['parent_id']=$parent_id;
                $data = Db::name('region')->where($where)->select();
                $data = json_encode($data);
                echo $data;
    }
    
}