<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:51:"themes/admin_simpleboot3/user\admin_index\tags.html";i:1590571928;s:76:"D:\phpstudy_pro\WWW\youju\public\themes\admin_simpleboot3\public\header.html";i:1590571928;}*/ ?>

</head>
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
    <?php endif; ?><body>
<div class="wrap" style="padding: 20px 20px 20px;">  
<div class="">
               <h3><?php echo $user['user_login']; ?>当前标签:<?php echo $user['tags']; ?></h3>
                </div>
            </div>
            <form class="js-ajax-form well form-inline margin-top-20" method="post" action="<?php echo url('adminIndex/edit_tags'); ?>">
                <input type="hidden" name="id" value="<?php echo $user['id']; ?>">
        标签：
        <input type="text" class="form-control" name="biaoqian" style="width: 200px;" value="" placeholder="请输入标签，最多四个字">
        <input type="submit" class="btn btn-primary js-ajax-submit" value="确定">
    </form>          
        
</div>
</body>
</html>