<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:60:"themes/admin_simpleboot3/user\admin_index\avatar_shenhe.html";i:1574678274;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->


    <link href="/themes/admin_simpleboot3/public/assets/themes/<?php echo cmf_get_admin_style(); ?>/bootstrap.min.css" rel="stylesheet">
    <link href="/themes/admin_simpleboot3/public/assets/simpleboot3/css/simplebootadmin.css" rel="stylesheet">
    <link href="/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <style>
        form .input-order {
            margin-bottom: 0px;
            padding: 0 2px;
            width: 42px;
            font-size: 12px;
        }

        form .input-order:focus {
            outline: none;
        }

        .table-actions {
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 0px;
        }

        .table-list {
            margin-bottom: 0px;
        }

        .form-required {
            color: red;
        }
    </style>
    <script type="text/javascript">
        //全局变量
        var GV = {
            ROOT: "/",
            WEB_ROOT: "/",
            JS_ROOT: "static/js/",
            APP: '<?php echo \think\Request::instance()->module(); ?>'/*当前应用名*/
        };
    </script>
    <script src="/themes/admin_simpleboot3/public/assets/js/jquery-1.10.2.min.js"></script>
    <script src="/static/js/wind.js"></script>
    <script src="/themes/admin_simpleboot3/public/assets/js/bootstrap.min.js"></script>
    <script>
        Wind.css('artDialog');
        Wind.css('layer');
        $(function () {
            $("[data-toggle='tooltip']").tooltip();
            $("li.dropdown").hover(function () {
                $(this).addClass("open");
            }, function () {
                $(this).removeClass("open");
            });
        });
    </script>
    <?php if(APP_DEBUG): ?>
        <style>
            #think_page_trace_open {
                z-index: 9999;
            }
        </style>
    <?php endif; ?>
</head>
<body>
<div class="wrap">
    <ul class="nav nav-tabs">
        <li><a href="<?php echo url('user/adminIndex/index'); ?>">陪玩师</a></li>
        <li><a href="<?php echo url('user/adminIndex/index_us'); ?>">普通用户</a></li>
        <li class="active"><a href="<?php echo url('user/adminIndex/avatar_shenhe'); ?>">头像待审核</a></li>
        </ul>
    <form class="well form-inline margin-top-20" method="post" action="<?php echo url('user/adminIndex/avatar_shenhe'); ?>">
        关键字：
        <input class="form-control" type="text" name="keyword" style="width: 200px;" value="<?php echo input('request.keyword'); ?>"
               placeholder="用户名">
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('user/adminIndex/avatar_shenhe'); ?>">清空</a>
    </form>
    <form method="post" class="js-ajax-form">
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th>靓号</th>
                <th><?php echo lang('USERNAME'); ?></th>
                <th><?php echo lang('AVATAR'); ?></th>
                <th>待审核头像</th>
                <th>QQ</th>
                <th>手机</th>
                <th>地区</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$vo): ?>
                <tr>
                    <td><?php echo (isset($vo['uid']) && ($vo['uid'] !== '')?$vo['uid']:"无"); ?></td>
                    <td><?php echo !empty($vo['user_login'])?$vo['user_login']:($vo['mobile']?$vo['mobile']:lang('THIRD_PARTY_USER')); ?>
                    </td>
                    <td><img width="55" height="55" src="<?php echo cmf_get_image_url($vo['avatar']); ?>"/></td>
                    <td><img width="55" height="55" src="<?php echo cmf_get_image_url($vo['avatar_shenhe']); ?>"/></td>
                    <td><?php echo $vo['qq']; ?></td>
                    <td><?php echo $vo['mobile']; ?></td>
                    <td><?php echo $vo['provinceName']; ?> <?php echo $vo['cityName']; ?> <br> <?php echo $vo['districtName']; ?></td>
			
                        <td>
                    <a href="<?php echo url('adminIndex/avatarshenhe',array('id'=>$vo['id'],'status'=>1)); ?>" class="js-ajax-dialog-btn">通过</a>
                    <a href="<?php echo url('adminIndex/avatarshenhe',array('id'=>$vo['id'],'status'=>0)); ?>" class="js-ajax-dialog-btn">拒绝</a>
                    </td>
                </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <div class="pagination"><?php echo $page; ?></div>
    </form>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>