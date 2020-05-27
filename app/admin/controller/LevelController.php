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
use app\admin\model\LevelModel;

class LevelController extends AdminBaseController
{

    public function index()
    {
        $LevelModel = new LevelModel();
        $levels     = $LevelModel->select();
        $this->assign('levels', $levels);

        return $this->fetch();
    }

    
    public function listOrder()
    {
        $LevelModel = new  LevelModel();
        $this->listOrders($LevelModel);
        $this->success("更新成功！");
    }

    protected function listOrders($model)
    {
        if (!is_object($model)) {
            return false;
        }

        $pk  = $model->getPk(); //获取主键名称
        $ids = $this->request->post("list_orders/a");

        if (!empty($ids)) {
            foreach ($ids as $key => $r) {
                $data['jiedan'] = $r;
                $model->where([$pk => $key])->update($data);
            }

        }

        return true;
    }


}