<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:45:"themes/admin_simpleboot3/admin\chat\edit.html";i:1590571928;s:82:"D:\phpstudy_pro\WWW\youju\youju\public\themes\admin_simpleboot3\public\header.html";i:1590571928;}*/ ?>
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
            <li><a href="<?php echo url('chat/index'); ?>">所有聊天室</a></li>
            <li class="active"><a href="<?php echo url('chat/add'); ?>">添加聊天室</a></li>
        </ul>
        <form method="post" class="form-horizontal js-ajax-form margin-top-20" action="<?php echo url('chat/editPost'); ?>">
            <input type="hidden" name="id" value="<?php echo $chat['id']; ?>">
            <div class="form-group">
                <label for="input-name" class="col-sm-2 control-label">名称<span class="form-required">*</span></label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" id="input-name" value="<?php echo $chat['name']; ?>" name="name">
                </div>
            </div>
            <div class="form-group">
                <label for="input-name" class="col-sm-2 control-label">英文名<span class="form-required">*</span></label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" id="input-name" value="<?php echo $chat['ename']; ?>" name="ename">
                </div>
            </div>
            <div class="form-group">
                <label for="input-url" class="col-sm-2 control-label">主持<span class="form-required">*</span></label>
                <div class="col-md-6 col-sm-10">
                    <select name="user_id">
                        <option value="0">请选择主持人</option>
                        <?php if(is_array($users) || $users instanceof \think\Collection || $users instanceof \think\Paginator): $i = 0; $__LIST__ = $users;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;$selected=$vo['id']==$chat['user_id']?"selected":""; ?>
                            <option value="<?php echo $vo['id']; ?>" <?php echo $selected; ?>><?php echo $vo['user_login']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
    
            <div class="form-group">
                <label for="input-description" class="col-sm-2 control-label">公告</label>
                <div class="col-md-6 col-sm-10">
                    <textarea class="form-control" name="description"><?php echo $chat['description']; ?></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary js-ajax-submit"><?php echo lang('ADD'); ?></button>
                    <a class="btn btn-default" href="javascript:history.back(-1);"><?php echo lang('BACK'); ?></a>
                </div>
            </div>
        </form>
    </div>
    <script src="/static/js/admin.js"></script>
</body>
</html>