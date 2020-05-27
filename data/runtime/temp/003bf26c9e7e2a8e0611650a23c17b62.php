<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:48:"themes/admin_simpleboot3/admin\tixian\index.html";i:1574678274;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>
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
        <li class="active"><a href="<?php echo url('tixian/index'); ?>">用户提现申请</a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="post" action="<?php echo url('admin/tixian/index'); ?>">
        提现状态:
        <select class="form-control" name="status" id="status" style="width: 140px;">
            <option value='' <?php if($status == '0'): ?>selected<?php endif; ?>>全部</option>
            <option value='0' <?php if($status == '0'): ?>selected<?php endif; ?>>未打款</option>
            <option value='1' <?php if($status == '1'): ?>selected<?php endif; ?>>已打款</option>
        </select>
         &nbsp; &nbsp;关键字：
        <input class="form-control" type="text" name="keyword" style="width: 200px;" value="<?php echo input('request.keyword'); ?>"
               placeholder="用户名/支付宝账号">
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('admin/tixian/index'); ?>">清空</a>
    </form>
        <table class="table table-hover table-bordered table-list">
            <thead>
            <tr>
                <th width="50">ID</th>
                <th width="100">用户名</th>
                <th width="150">提现金额</th>
                <th width="150">真实姓名</th>
                <th width="150">开户银行</th>
                <th width="150">银行账号</th>
                <th width="200">申请时间</th>
                <th >操作</th>
            </tr>
            </thead>
            <tbody>
                <?php $bank=array('0'=>'请选择开户行','3'=>'中国银行','5'=>'交通银行','6'=>'华夏银行','7'=>'光大银行','8'=>'招商银行','9'=>'中信银行','10'=>'兴业银行','11'=>'民生银行','1'=>'中国工商银行','2'=>'中国农业银行','4'=>'中国建设银行'); if(is_array($Tixians) || $Tixians instanceof \think\Collection || $Tixians instanceof \think\Paginator): $i = 0; $__LIST__ = $Tixians;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <tr>
                    <td><?php echo $vo['id']; ?></td>
                    <td><?php echo $vo['user_login']; ?></td>
                    <td><?php echo $vo['jine']; ?></td>
                    <td><?php echo $vo['realname']; ?></td>
                    <td><?php echo $bank[$vo['bank']]; ?></td>
                    <td><?php echo $vo['bankcard']; ?></td>
                    <td><?php echo date('Y-m-d H:i',$vo['tixian_time']); ?></td>
                     <td>
                     <?php if($vo['txstatus'] == '0'): ?>
                        <a href="<?php echo url('tixian/shenhe',array('id'=>$vo['id'])); ?>">
                            打款成功
                        </a>
                        <?php else: ?>
                        已打款
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>