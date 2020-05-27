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

class ZuhaoController extends UserBaseController
{

    function _initialize()
    {
        parent::_initialize();
        $a="";
    }

    public function index()
    {
        $a="zuhao";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);


        $zuhao = Db::name("zuhao")->where('user_id',$user['id'])->select();
        $this->assign("zuhao",$zuhao);
        return $this->fetch();
    }

    public function add()
    {
        $a="zuhao";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);
       
        return $this->fetch();
    }


    public function add_post()
    {
        if ($this->request->isPost()) {
        $validate = new Validate([
                'title' => 'require',
                'name'=>'require',
                'pic'=> 'require', 
                'jiage'=> 'require',  
                'mobile'=>'require',              
            ]);
            $validate->message([
                'title.require' => '请输入账号标题',
                'name.require' =>'请输入登录账号',
                'pic.require' => '请上传账号截图',
                'jiage.require' => '请输入出租价格',
                'mobile.require' => '请输入手机号码',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
        $user = cmf_get_current_user(); 
        $zuhao = Db('zuhao')->where(['user_id'=>$user['id'],'name'=>$data['name']])->find();
        if($zuhao)
        {
            $this->error('此账号已经添加过了');
        }        
        $data1   = [
            'user_id'         => $user['id'],
            'title'      =>     $data['title'],
            'name'      =>     $data['name'],
            'jiage'       => $data['jiage'],
            'pic'       => $data['pic'],
            'mobile'       => $data['mobile'],
            'content'       => $data['content'],
            'status'       => 2,
        ];
        Db::name("zuhao")->insert($data1);
        $this->success("添加账号成功！");
         } else {
            $this->error("请求错误");
        }
    }

    public function edit()
    {
        $a="zuhao";
        $this->assign('a',$a);
        $user = cmf_get_current_user();
        $this->assign($user);

       $id = $this->request->param('id', 0, 'intval');
       $zuhao = Db('zuhao')->where('id',$id)->find();
       $this->assign('zuhao',$zuhao);

        return $this->fetch();

    }



    public function edit_post()
    {
        if ($this->request->isPost()) {
        $validate = new Validate([
                'title' => 'require',
                'name'=>'require',
                'pic'=> 'require', 
                'jiage'=> 'require',  
                'mobile'=>'require',              
            ]);
            $validate->message([
                'title.require' => '请输入账号标题',
                'name.require' =>'请输入登录账号',
                'pic.require' => '请上传账号截图',
                'jiage.require' => '请输入出租价格',
                'mobile.require' => '请输入手机号码',
            ]);

            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->error($validate->getError());
            }
        $user = cmf_get_current_user();       
        $data1   = [
            'title'      =>     $data['title'],
            'name'      =>     $data['name'],
            'jiage'       => $data['jiage'],
            'pic'       => $data['pic'],
            'mobile'       => $data['mobile'],
            'content'       => $data['content'],
            'status'       => 2,
        ];
        Db::name("zuhao")->where('id',$data['id'])->update($data1);
        $this->success("修改账号成功！");
         } else {
            $this->error("请求错误");
        }
    }

    public function sj_zuhao()
    {
        $id = $this->request->param('id', 0, 'intval');
        $jineng = Db::name("zuhao")->where('id',$id)->find();
        if($jineng['status']==2)
        {
            $this->error('审核中的账号不能上架。');
        }
        Db::name("zuhao")->where('id',$id)->update(['status'=>1]);
        $this->success("上架账号成功！");
    }

    public function xj_zuhao()
    {
        $id = $this->request->param('id', 0, 'intval');
        $user = cmf_get_current_user();
 
        Db::name("zuhao")->where('id',$id)->update(['status'=>0]);
        $this->success("下架账号成功！");
    }
    
    
    
}