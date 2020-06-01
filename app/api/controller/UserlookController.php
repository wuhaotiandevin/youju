<?php

namespace app\api\controller;

use app\admin\model\UserModel;
use think\Db;

class UserlookController
{
    /**
     * 我的模块添加谁看过我接口
     * user_id 用户id
     * user_id_look 谁看过我用户id
     */
    public function add()
    {
        $user_id = request()->post('user_id');
        $user_id_look = request()->post('user_id_look');
        $look_page = request()->post('look_page');
        $user_id = isset($user_id) ? $user_id : '';
        $user_id_look = isset($user_id_look) ? $user_id_look : '';
        $look_page = isset($look_page) ? $look_page : 1;
        if (empty($user_id || $user_id_look) || $user_id==0 || $user_id_look==0) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }
        $data['user_id'] = $user_id;
        $data['user_id_look'] = $user_id_look;
        $data['look_page'] = $look_page;
        $data['look_time'] = time();

        $res = Db::name('user_look')
            ->where('user_id',$user_id)
            ->where('user_id_look',$user_id_look)
            ->where('look_page',$look_page)
            ->find();
        if($res){
            $data['id'] = $res['id'];
            $up_res = Db::name('user_look')->update($data);
            if ($up_res) {
                return json(array('error' => 0, 'errorMsg' => '请求成功', 'data' => $data));
            } else {
                return json(array('error' => 1, 'errorMsg' => '请求失败'));
            }
        }else{
            $in_res = Db::name('user_look')->insert($data);
            if ($in_res) {
                return json(array('error' => 0, 'errorMsg' => '请求成功', 'data' => $data));
            } else {
                return json(array('error' => 1, 'errorMsg' => '请求失败'));
            }
        }
    }

    /**
     * 我的模块谁看过我列表接口
     * user_id 用户自增id
     */
    public function list()
    {
        $request = request();
        $page = $request->post('page');
        $page_num = 10;
        $user_id = $request->post('user_id');
        $user_id = isset($user_id) ? $user_id : '';
        if (empty($user_id) || $user_id==0) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }
        $time = strtotime("-30 day");
        $look_users = Db::name('user_look')
            ->alias('a')
            ->join('user b','a.user_id_look=b.id','LEFT')
            ->where('a.user_id', $user_id)
            ->where('a.look_time','>',$time)
            ->field('a.look_time,a.look_page,b.id,b.nickname,b.avatar,b.sex')
            ->order('a.look_time desc')
            ->page($page,$page_num)
            ->select();
        $data = [];
        foreach($look_users as $k=>$v){
            $data[$k]['avatar'] = cmf_get_image_preview_url($v['avatar']);
            $data[$k]['user_id'] = $v['id'];
            $data[$k]['look_page'] = get_look_page($v['look_page']);
            $data[$k]['nickname'] = $v['nickname'];
            $data[$k]['sex'] = $v['sex'];
            $data[$k]['look_time'] = get_time($v['look_time']);
        }
        if ($data) {
            return json(array('error' => 0, 'errorMsg' => '请求成功', 'data' => $data));
        } else {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }
    }
}