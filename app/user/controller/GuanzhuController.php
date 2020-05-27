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

class GuanzhuController extends UserBaseController
{

    /**
     * 个人中心我的关注列表
     */
    public function index()
    {
        $user              = cmf_get_current_user();
        $this->assign($user);
        $this->assign("a", "guanzhu");
        $data = $this->request->param();
        $where['a.user_id'] = $user['id'];
        if (!empty($data['keyword'])) {
            $keyword = $data['keyword'];
            $where['u.user_login'] = ['like',"%$keyword%"];
        }
        $join = [
            ['__USER__ u', 'a.pw_id = u.id'],
        ];
        $field = 'a.id,a.pw_id,u.avatar,u.user_login,u.meili';
        $guanzhu = Db::name("guanzhu")->alias('a')->field($field)->join($join)->where($where)->order('a.id desc')->paginate(9);
        $page  = $guanzhu->render();
        $this->assign("page", $page);
        $this->assign("guanzhu", $guanzhu);
        return $this->fetch();
    }

    /**
     * 用户取消关注
     */
    public function delete()
    {
        $id                = $this->request->param("id", 0, "intval");
        $data              = Db::name("guanzhu")->where('id',$id)->delete();
        if ($data) {
            $this->success("取消关注成功！");
        } else {
            $this->error("取消关注失败！");
        }
    }

    
}