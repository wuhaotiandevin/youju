<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:47:"themes/admin_simpleboot3/admin\money\index.html";i:1574678274;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>
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
        <li class="active"><a href="<?php echo url('order/index'); ?>">订单列表</a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="post" action="<?php echo url('money/index'); ?>">
        资金类型:
        <select class="form-control" name="style" id="style" style="width: 140px;">
            <option value='' <?php if($style == ''): ?>selected<?php endif; ?>>全部</option>
            <option value='充值' <?php if($style == '充值'): ?>selected<?php endif; ?>>充值</option>
            <option value='支出' <?php if($style == '支出'): ?>selected<?php endif; ?>>支出</option>
            <option value='收入' <?php if($style == '收入'): ?>selected<?php endif; ?>>收入</option>
            <option value='提现' <?php if($style == '提现'): ?>selected<?php endif; ?>>提现</option>
        </select>
         &nbsp; &nbsp;
        用户名:
        <input type="text" class="form-control" name="keyword" style="width: 200px;"
               value="<?php echo (isset($keyword) && ($keyword !== '')?$keyword:''); ?>" placeholder="请输入用户名">
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('Order/index'); ?>">清空</a>
    </form>
    
    <form method="post" class="js-ajax-form margin-top-20" action="<?php echo url('Order/listOrder'); ?>">
        <table class="table table-hover table-bordered table-list">
            <thead>
            <tr>
                <th width="50">ID</th>
                <th>用户名</th>
                <th>交易额</th>
                <th>资金类型</th>
                <th>交易说明</th>
                <th>交易时间</th>
            </tr>
            </thead>
            <tbody>
            <?php if(is_array($mrecord) || $mrecord instanceof \think\Collection || $mrecord instanceof \think\Paginator): if( count($mrecord)==0 ) : echo "" ;else: foreach($mrecord as $key=>$vo): ?>
                <tr>
                    <td><?php echo $vo['id']; ?></td>
                    <td><?php echo $vo['user_login']; ?></td>
                    <td><?php echo $vo['money']; ?></td>
                    <td><?php echo $vo['style']; ?></td>
                    <td><?php echo $vo['content']; ?></td>
                    <td><?php echo date('Y-m-d H:i',$vo['pay_time']); ?></td>
                </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </form>
	<div class="pagination"><?php echo $page; ?></div>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>