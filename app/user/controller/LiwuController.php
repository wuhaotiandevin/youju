<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace app\user\controller;

use cmf\controller\UserBaseController;
use think\Db;

class LiwuController extends UserBaseController
{

    /**
     * 个人中心我的关注列表
     */
    public function index()
    {
        $user              = cmf_get_current_user();
        $this->assign($user);
        $this->assign("a", "liwu");
        $data = $this->request->param();
        $where['a.user_id'] = $user['id'];
        if (!empty($data['keyword'])) {
            $keyword = $data['keyword'];
            $where['u.user_login'] = ['like',"%$keyword%"];
        }
        $join = [
            ['__USER__ u', 'u.id = a.pw_id'],
            ['__GIFT__ g', 'g.id = a.gift_id'],
        ];
        $field = 'a.count,a.give_time,a.pw_id,u.avatar,u.user_login,u.meili,g.name,g.image,g.price';
        $liwu = Db::name("gift_give")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(10);
        $page  = $liwu->render();
        $this->assign("page", $page);
        $this->assign("liwu", $liwu);
        return $this->fetch();
    }

    public function jindex()
    {
        $user              = cmf_get_current_user();
        $this->assign($user);
        $this->assign("a", "liwu");
        $data = $this->request->param();
        $where['a.pw_id'] = $user['id'];
        if (!empty($data['keyword'])) {
            $keyword = $data['keyword'];
            $where['u.user_login'] = ['like',"%$keyword%"];
        }
        $join = [
            ['__USER__ u', 'u.id = a.user_id'],
            ['__GIFT__ g', 'g.id = a.gift_id'],
        ];
        $field = 'a.count,a.give_time,a.pw_id,u.avatar,u.user_login,u.meili,g.name,g.image,g.price';
        $liwu = Db::name("gift_give")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(10);
        $page  = $liwu->render();
        $this->assign("page", $page);
        $this->assign("liwu", $liwu);
        return $this->fetch();
    }

    
}