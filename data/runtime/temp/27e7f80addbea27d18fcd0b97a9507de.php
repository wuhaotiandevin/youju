<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:46:"themes/admin_simpleboot3/admin\main\index.html";i:1577418574;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>
<?php function _get_system_widget($name){ switch($name): endswitch; } ?>

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
<style>
    .home-info li em {
        float: left;
        width: 120px;
        font-style: normal;
        font-weight: bold;
    }

    .home-info ul {
        padding: 0;
        margin: 0;
    }

    .panel {
        margin-bottom: 0;
    }

    .grid-sizer {
        width: 10%;
    }

    .grid-item {
        margin-bottom: 5px;
        padding: 5px;
    }

    .col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
        padding-left: 5px;
        padding-right: 5px;
        float: none;
    }

</style>
<?php 
    \think\Hook::listen('admin_before_head_end',$temp5ece06e6ee631,null,false);
 ?>
</head>
<body>
<div class="wrap">
    <?php if(empty($has_smtp_setting) || (($has_smtp_setting instanceof \think\Collection || $has_smtp_setting instanceof \think\Paginator ) && $has_smtp_setting->isEmpty())): ?>
        <div class="grid-item col-md-12">
            <div class="alert alert-danger alert-dismissible fade in" role="alert" style="margin-bottom: 0;">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <strong>新源代提示!</strong> 邮箱配置未完成,无法进行邮件发送!
                <a href="#" data-dismiss="alert" aria-label="Close"
                   onclick="parent.openapp('<?php echo url('Mailer/index'); ?>','admin_mailer_index','邮箱配置');">现在设置</a>
            </div>
        </div>
    <?php endif; if(!extension_loaded('fileinfo')): ?>
        <div class="grid-item col-md-12">
            <div class="alert alert-danger alert-dismissible fade in" role="alert" style="margin-bottom: 0;">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <strong>提示!</strong> php_fileinfo扩展没有开启，无法正常上传文件！
            </div>
        </div>
    <?php endif; ?>

    <div class="grid-item col-md-12" id="thinkcmf-notices-grid">
        <div class="dashboard-box">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">网站会员情况</h3>
                </div>
                <div class="panel-body home-info">
                    <ul id="thinkcmf-notices" class="list-unstyled">
                        <li>
                            <span style="display: inline-block; vertical-align: middle;">截至目前共有会员：<?php echo $user[0]; ?>人，其中陪玩师： <?php echo $user[1]; ?>人，普通用户： <?php echo $user[2]; ?>人，昨日新注册会员： <?php echo $user[3]; ?>人。</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="grid-item col-md-12" id="thinkcmf-notices-grid">
        <div class="dashboard-box">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">网站收支情况</h3>
                </div>
                <div class="panel-body home-info">
                    <ul id="thinkcmf-notices" class="list-unstyled">
                        <li>
                            <span style="display: inline-block; vertical-align: middle;">截至目前共有充值收入：<?php echo $money[0]; ?>元，提现支出： <?php echo $money[1]; ?>元，平台担保资金： <?php echo $money[2]; ?>元，昨日充值： <?php echo $money[3]; ?>元。</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="home-grid">
        <!-- width of .grid-sizer used for columnWidth -->
        <div class="grid-sizer"></div>
        <?php if(is_array($dashboard_widgets) || $dashboard_widgets instanceof \think\Collection || $dashboard_widgets instanceof \think\Paginator): if( count($dashboard_widgets)==0 ) : echo "" ;else: foreach($dashboard_widgets as $key=>$vo): if($vo['is_system']): ?>
                <div class="grid-item col-md-12" data-system="1" data-widget="<?php echo $vo['name']; ?>">
                    <div class="dashboard-box"><?php echo _get_system_widget($vo['name']); ?></div>
                </div>
                <?php else: if(isset($dashboard_widget_plugins[$vo['name']])): ?>
                    <div class="grid-item col-md-<?php echo $dashboard_widget_plugins[$vo['name']]['width']; ?>" data-system="0"
                         data-widget="<?php echo $vo['name']; ?>">
                        <div class="dashboard-box"><?php echo $dashboard_widget_plugins[$vo['name']]['view']; ?></div>
                    </div>
                <?php endif; endif; endforeach; endif; else: echo "" ;endif; ?>
    </div>
</div>
<script src="/static/js/admin.js"></script>
<?php 
    $lang_set=defined('LANG_SET')?LANG_SET:'';
    $thinkcmf_version=defined('THINKCMF_VERSION')?THINKCMF_VERSION:'';
 
    \think\Hook::listen('admin_before_body_end',$temp5ece06e6ee638,null,false);
 ?>
</body>
</html>