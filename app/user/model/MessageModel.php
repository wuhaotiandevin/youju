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
namespace app\user\model;

use think\Db;
use think\Model;

class MessageModel extends Model
{
    public function message()
    {
        $userId        = cmf_get_current_user_id();
        $userQuery     = Db::name("message");
        $message     = $userQuery->where(['user_id' => $userId])->order('id desc')->paginate(10);
        $data['page']  = $message->render();
        $data['lists'] = $message->items();
        return $data;
    }

    public function deletemessage($id)
    {
        $userId           = cmf_get_current_user_id();
        $userQuery        = Db::name("message");
        $where['id']      = $id;
        $where['user_id'] = $userId;
        $data             = $userQuery->where($where)->delete();
        return $data;
    }

}