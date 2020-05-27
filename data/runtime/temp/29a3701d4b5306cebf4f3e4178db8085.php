<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:48:"themes/admin_simpleboot3/admin\shensu\index.html";i:1574678274;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>
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
        <li class="active"><a href="<?php echo url('shensu/index'); ?>">所有撤单</a></li>
    </ul><br>
    同意撤单以后，订单金额将原路返回到订单用户钱包，此订单自动取消。拒绝撤单以后，订单将按验收处理。
    <br>
        <table class="table table-hover table-bordered table-list">
            <thead>
            <tr>
                <th width="50">ID</th>
                <th width="100">订单ID</th>
                <th width="100">用户</th>
                <th width="100">用户手机</th>
                <th width="100">用户QQ</th>
                <th width="100">陪玩</th>
                <th width="100">陪玩手机</th>
                <th width="100">陪玩QQ</th>
                <th width="150">订单金额</th>
                <th width="150">撤单原因</th>
                <th width="150">撤单说明</th>
                <th width="100">发起时间</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(is_array($shensu) || $shensu instanceof \think\Collection || $shensu instanceof \think\Paginator): $i = 0; $__LIST__ = $shensu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <tr>
                    <td><?php echo $vo['id']; ?></td>
                    <td><?php echo $vo['order_id']; ?></td>
                    <td><?php echo $vo['user_login']; ?></td>
                    <td><?php echo $vo['mobile']; ?></td>
                    <td><?php echo $vo['qq']; ?></td>
                    <td><?php echo $vo['user_login1']; ?></td>
                    <td><?php echo $vo['mobile1']; ?></td>
                    <td><?php echo $vo['qq1']; ?></td>
                    <td><?php echo $vo['order_amount']; ?></td>
                    <td><?php echo $vo['style']; ?></td>
                    <td><textarea style="border: 0;width: 100%;height: 100px;"><?php echo $vo['content']; ?></textarea></td>
                    <td><?php echo date('Y-m-d H:i',$vo['create_time']); ?></td>
                     <td>
                       <?php switch($vo['state']): case "0": ?>等待陪玩处理<?php break; case "1": ?>已处理完成<?php break; case "2": ?>
                        <a href="<?php echo url('shensu/up_shensu',array('id'=>$vo['id'],'state'=>1)); ?>" class="js-ajax-dialog-btn">同意撤单</a> 
                        <a href="<?php echo url('shensu/up_shensu',array('id'=>$vo['id'],'state'=>2)); ?>" class="js-ajax-dialog-btn">拒绝撤单</a>
                        <?php break; endswitch; ?>
                    </td>
                </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <div class="pagination"><?php echo $page; ?></div>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>