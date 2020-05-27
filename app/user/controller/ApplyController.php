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
use app\user\model\UserModel;
use think\Db;
use think\Validate;
use think\Image;
use app\portal\service\UploadFileService;

class ApplyController extends UserBaseController
{

    /**
     * 个人中心我的收藏列表
     */
    public function index()
    {
        $user = cmf_get_current_user();
        $user=Db('user')->where('id',$user['id'])->find();
        $count = DB::name("user")->where('user_type',3)->count();
        $this->assign('count',$count);
        $this->assign($user);
        $fuwu  = Db("category")->where('parent_id',0)->select();
        $this->assign('fuwu',$fuwu);
        return $this->fetch();
    }

    public function editPost()
    {
            $data = $this->request->post();
            $user = cmf_get_current_user();
            if(empty($data['qq']))
            {
                $result = ['status'=>0,'info'=>'请输入QQ号码'];
                return json_encode($result);
            }
            if($data['province']<1||$data['city']<1||$data['district']<1)
            {
               $result = ['status'=>0,'info'=>'请选择所在地区'];
               return json_encode($result);
            }
            if(empty($data['birthday']))
            {
                $result = ['status'=>0,'info'=>'请选择出生日期'];
                return json_encode($result);
            }
            if(empty($data['gexing']))
            {
                $result = ['status'=>0,'info'=>'请选择个性标签'];
                return json_encode($result);
            }
            elseif(count(explode(",",$data['gexing']))>3)
            {  
                $result = ['status'=>0,'info'=>'最多只能选三种个性标签'];
                return json_encode($result);
            }
            if(empty($data['avatar3']))
            {
                $result = ['status'=>0,'info'=>'最少上传3张形象照'];
                return json_encode($result);
            }
            if(empty($data['yuyin']))
            {
                $result = ['status'=>0,'info'=>'请上传语音介绍'];
                return json_encode($result);
            }
            $editData = new UserModel();
            if ($editData->editData1($data)) {
                $result = ['status'=>1,'info'=>'填写基本信息成功'];
                return json_encode($result);
            } else {
                $result = ['status'=>1,'info'=>'没有新的修改信息'];
                return json_encode($result);
            }
            
    }


    
    public function addPost()
    {
        $data = $this->request->post();
        $user = cmf_get_current_user();
        Db::name("user_jineng")->where(['user_id'=>$user['id']])->delete();
                        
        if(empty($data['fuwu']))
        {
            $result = ['status'=>0,'info'=>'请至少选择一项服务'];
            return json_encode($result);
        }
        // if(empty($data['jiage']))
        // {
        //     $result = ['status'=>0,'info'=>'请填写服务价格'];
        //     return json_encode($result);
        // }
        $allAdded = true;
         
            $avatar = explode(",", $data['avatar']);
            $fuwu = explode(",", $data['fuwu']);
            $dengji = explode(",", $data['dengji']);
            //$jiage = explode(",", $data['jiage']);
                    $data_n = array();
                    foreach ($fuwu as $key => $value) {
                        if($value<1  || empty($avatar[$key]))
                        {
                          $allAdded = false;  
                        }
                        else
                        {
                            $jineng = Db::name("user_jineng")->where(['user_id'=>$user['id'],'cat_id'=>$value])->find();
                            if($jineng)
                            {
                                $result = ['status'=>0,'info'=>'同一种技能不允许重复添加'];
                                return json_encode($result);
                            }
                            $data_n['pic'] =  $avatar[$key];
                            $data_n['user_id'] = $user['id'];
                            $data_n['cat_id'] = $value;
                            $data_n['level'] = $dengji[$key];
                            $data_n['jiage'] = 0;//$jiage[$key];
                            $data_n['status']       = 2;
                            Db::name("user_jineng")->insert($data_n);
                       }
                    }
     
        if($allAdded){
            Db::name("user")->where('id',$user['id'])->update(['user_type'=>3]);
            $userInfo = Db::name("user")->where('id', $user['id'])->find();
            cmf_update_current_user($userInfo);
            $result = ['status'=>1,'info'=>'填写服务信息成功'];
            return json_encode($result);
        }else{
            $result = ['status'=>0,'info'=>'填写服务信息失败,请检查填写内容重新提交'];
            return json_encode($result);
        }
        
    }

    function ajax_return(){
        $parent_id = $this->request->param('pid', 0, 'intval');
        $where['parent_id']=$parent_id;
                $data = Db::name('category')->where($where)->select();
                $data = json_encode($data);
                echo $data;
    }
    function ajax_return1(){
        $where['parent_id']=0;
                $data = Db::name('category')->where($where)->where('id','<>',56)->select();
                $data = json_encode($data);
                echo $data;
    }

}