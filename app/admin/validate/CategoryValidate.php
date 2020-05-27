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
namespace app\admin\validate;

use think\Validate;

class CategoryValidate extends Validate
{
    protected $rule = [
        'cat_name' => 'require',
        'parent_id'  => 'require',
    ];

    protected $message = [
        'cat_name.require' => '名称不能为空',
        'parent_id.require'  => '父级类目不能为空',
    ];

}