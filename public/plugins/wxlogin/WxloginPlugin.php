<?php
// +----------------------------------------------------------------------
// | QQLogin [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 Tangchao All rights reserved.
// +----------------------------------------------------------------------
// | Author: Tangchao <79300975@qq.com>
// +----------------------------------------------------------------------
namespace plugins\wxlogin;//qqlogin插件英文名，改成你的插件英文就行了
use cmf\lib\Plugin;

//qqlogin插件英文名，改成你的插件英文就行了
class WxloginPlugin extends Plugin
{

    public $info = array(
        'name'        => 'Wxlogin',//qqlogin插件英文名，改成你的插件英文就行了
        'title'       => '微信登录',
        'description' => '微信登录',
        'status'      => 1,
        'author'      => 'Tangchao',
        'version'     => '1.0'
    );

    public $hasAdmin = 0;//插件是否有后台管理界面

    // 插件安装
    public function install()
    {
        return true;//安装成功返回true，失败false
    }

    // 插件卸载
    public function uninstall()
    {
        return true;//卸载成功返回true，失败false
    }

    //实现的footer_start钩子方法
    public function footerStart($param)
    {
        return true;
    }

}