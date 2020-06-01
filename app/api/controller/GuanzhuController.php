<?php

namespace app\api\controller;
use think\Db;

class GuanzhuController
{
	/**
     * 我的关注接口
     * uid 用户id
     * page 分页数
	 * page_size 显示数量
     */
    public function index()
    {
		$uid = 1;//request()->post('uid');
		$page = request()->post('page');
		$page_size = request()->post('page_size');
        $uid = isset($uid)?$uid:0;
		$page = isset($page) ? $page : 1 ;
		$page_size = isset($page_size) ? $page_size : 10 ;
		$pagenum = ($page-1) * $page_size;
        if (empty($uid)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
        }
        $where['user_id'] = $uid;
        $gz = Db::name('guanzhu')
				->alias('a')
				->join('user b','a.user_id=b.id','LEFT')
				->where($where)
				->field('a.pw_id ,nickname,gexing,age,avatar')
				->order('gztime desc')
				->limit($pagenum,$page_size)
				->select();
        if($gz){
			foreach($gz as $k=>$v){
				$data[$k]['gzuid'] = $v['pw_id'];
				$data[$k]['nickname'] = $v['nickname'];
				$data[$k]['avatar'] = $v['avatar'];
				$data[$k]['age'] = $v['age'];
				$data[$k]['qianming'] = $v['gexing'];
			}
            return json( array('error' => 0,  'errorMsg' => '请求成功', 'data' => $data));

        }else{
            return json( array('error' => 1, 'errorMsg' => '请求成功'));
        }
    }
    /**
     * 点击关注接口
     * uid 登录用户的id
     * gzid 被关注用户的id
     */
    public function increase()
    {
		$uid = request()->post('uid');
		$gzuid = request()->post('gzuid');
		$uid = isset($uid)?$uid:0;
		$gzuid = isset($gzuid) ? $gzuid : 0 ;
        if (empty($uid) && empty($gzuid)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
			die();
        }
		if(Db::name('guanzhu')->where(array('user_id'=>$uid,'pw_id'=>$gzuid))->field('id')->find()){
			return json(array('error' => 1, 'errorMsg' => '已关注,无需重复关注'));
			die();
		}
		$row['user_id'] = $uid;
		$row['pw_id']   = $gzuid;
		$row['gztime']  = time();
		if(Db::name('guanzhu')->insert($row)){
			 return json( array('error' => 0,  'errorMsg' => '关注成功'));
			 die();
		}else{
			 return json( array('error' => 1,  'errorMsg' => '关注失败'));
			 die();
		}
		
    }
	
	 /**
     * 点击取消关注接口
     * uid 登录用户的id
     * gzid 被关注用户的id
     */
    public function cancel()
    {
        $uid = request()->post('uid');
		$gzuid = request()->post('gzuid');
		$uid = isset($uid)?$uid:0;
		$gzuid = isset($gzuid) ? $gzuid : 0 ;
        if (empty($uid) && empty($gzid)) {
            return json(array('error' => 1, 'errorMsg' => '请求失败'));
			die();
        }
		$where['user_id'] = $uid;
		$where['pw_id']   = $gzuid;
		if(!Db::name('guanzhu')->where($where)->field('id')->find()){
			return json(array('error' => 1, 'errorMsg' => '未关注,请先关注'));
			die();
		}
		if(Db::name('guanzhu')->where($where)->delete()){
			 return json( array('error' => 0,  'errorMsg' => '取消关注成功'));
			 die();
		}else{
			 return json( array('error' => 1,  'errorMsg' => '取消关注失败'));
			 die();
		}
		
    }
}