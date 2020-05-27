<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Sally < 393707022@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\validate;

use think\Validate;

class OrderInfoValidate extends Validate
{
    protected $rule = [
        'user_id'        => 'require',
        'consignee'      => 'require',
        'address'        => 'require',
        'mobile'         => 'require|number',//|unique:order_info,mobile
        'email'          => 'require|email',//|unique:order_info,email
        'best_time'      => 'require',
        'order_amount'   => 'require',
    ];

    protected $message = [
        'user_id.require'        => '用户不能为空',
        'consignee.require'      => '收货人不能为空',
        'address.require'        => '地址不能为空',
        'mobile.require'         => '手机号不能为空',
        'mobile.number'          => '手机号只能为数字',
        //'mobile.unique'          => '手机号已存在',
        'email.require'          => '邮箱不能为空',
        'email.email'            => '邮箱不正确',
        //'email.unique'           => '邮箱已经存在',
        'best_time.require'      => '期望上门时间不能为空',
        'order_amount.require'   => '价格不能为空',
    ];

    protected $scene = [
        'add'  => ['user_id', 'consignee', 'address', 'mobile', 'email', 'best_time'],
        'edit' => ['consignee', 'address', 'mobile', 'email', 'best_time', 'order_amount'],
    ];

}