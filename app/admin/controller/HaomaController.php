<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;
use think\Validate;

class HaomaController extends AdminBaseController
{


    public function index()
    {   
        $data      = $this->request->param();

        $keyword = empty($data['keyword']) ? '' : $data['keyword'];
        $this->assign("keyword", $keyword);
        $where = [];
        if (!empty($keyword)) {
            $where['haoma'] = ['like', "%$keyword%"];
        }

        $haoma  = DB::name("haoma")->where($where)->order('id desc')->paginate(100);
        
        $page = $haoma->render();
        $this->assign('haoma', $haoma);
        $this->assign("page", $page);
        return $this->fetch();
    }

   public function haoma_log()
   {

     return $this->fetch();
   }
   
   public function add()
    {
        $validate = new Validate(
        $rule = [
            'uid' => 'require|integer|min:5',
            'price'=>'require',
        ],
        $mes = [
            'uid.require'=>'靓号不能为空',
            'uid.integer' =>'靓号必须是数字',
            'uid.min' =>'靓号最少五位',
            'price.require'=>'请输入靓号价格'
        ]);
        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }
        $count1 =  Db('user')->where('uid',$data['uid'])->count();
        $count2 =  Db('haoma')->where('haoma',$data['uid'])->count();
        $count = $count1+$count2;
        if($count>0)
        {
            $this->error('此靓号已存在，请输入其他靓号');
        }
        else
        {
            Db('haoma')->insert(['haoma'=>$data['uid'],'price'=>$data['price']]);
            $this->success('发布靓号成功');
        }
    }

}