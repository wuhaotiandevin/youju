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
namespace app\user\model;

use think\Db;
use think\Model;

class UserFavoriteModel extends Model
{
    public function favorites()
    {
        $userId        = cmf_get_current_user_id();
        $userQuery     = Db::name("shoucang");
        $join = [
            ['__USER__ u', 'a.mgid = u.id'],
        ];
        $field = 'u.*,(SELECT GROUP_CONCAT(c.cat_name) FROM `cmf_category` c WHERE FIND_IN_SET(c.id,u.cat_id)) AS leimu';
        $favorites     = $userQuery->alias('a')->where(['user_id' => $userId])->order('id desc')->paginate(10);
        $data['page']  = $favorites->render();
        $data['lists'] = $favorites->items();
        return $data;
    }

    public function deleteFavorite($id)
    {
        $userId           = cmf_get_current_user_id();
        $userQuery        = Db::name("shoucang");
        $where['id']      = $id;
        $where['user_id'] = $userId;
        $data             = $userQuery->where($where)->delete();
        return $data;
    }

}