<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:47:"themes/admin_simpleboot3/admin\level\index.html";i:1574678274;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>
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
<div class="wrap js-check-wrap">
    <ul class="nav nav-tabs">
        <li class="active"><a href="<?php echo url('level/index'); ?>">所有等级</a></li>
    </ul>
    <form method="post" class="js-ajax-form margin-top-20" action="<?php echo url('level/listOrder'); ?>">
        <div class="table-actions">
            <button class="btn btn-primary btn-sm js-ajax-submit" type="submit">更新</button>
        </div>
        <?php $status=array("1"=>lang('DISPLAY'),"0"=>lang('HIDDEN')); ?>
        <table class="table table-hover table-bordered table-list">
            <thead>
            <tr>
                <th width="16"><label><input type="checkbox" class="js-check-all" data-direction="x"
                                             data-checklist="js-check-x"></label></th>
                <th>等级序号</th>
                <th>等级名称</th>
                <th>接单数</th>
            </tr>
            </thead>
            <tbody>
            <?php if(is_array($levels) || $levels instanceof \think\Collection || $levels instanceof \think\Paginator): if( count($levels)==0 ) : echo "" ;else: foreach($levels as $key=>$vo): ?>
                <tr>
                    <td><input type="checkbox" class="js-check" data-yid="js-check-y" data-xid="js-check-x" name="ids[]" value="<?php echo $vo['id']; ?>"></td>
                    <td><?php echo $vo['level_id']; ?></td>
                    <td><?php echo $vo['name']; ?></td>
                    <td><input name='list_orders[<?php echo $vo['id']; ?>]' class="input input-order mr5" type='text' size='3'
                               value='<?php echo $vo['jiedan']; ?>'></td>                
                </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
            <tfoot>
            <tr>
                <th width="16">
                    <label>
                        <input type="checkbox" class="js-check-all" data-direction="x" data-checklist="js-check-x">
                    </label>
                </th>
                <th>等级序号</th>
                <th>等级名称</th>
                <th>接单数</th>
            </tr>
            </tfoot>
        </table>
        <div class="table-actions">
            <button class="btn btn-primary btn-sm js-ajax-submit" type="submit">更新</button>
        </div>
    </form>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>