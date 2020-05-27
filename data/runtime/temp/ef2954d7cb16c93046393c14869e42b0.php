<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:47:"themes/admin_simpleboot3/admin\order\index.html";i:1574678274;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>
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
    <form class="well form-inline margin-top-20" method="post" action="<?php echo url('Order/index'); ?>">
        订单状态:
        <select class="form-control" name="status" id="status" style="width: 140px;">
            <option value='0' <?php if($status == '0'): ?>selected<?php endif; ?>>所有订单</option>
            <option value='1' <?php if($status == '1'): ?>selected<?php endif; ?>>待支付</option>
            <option value='2' <?php if($status == '2'): ?>selected<?php endif; ?>>待接单</option>
            <option value='3' <?php if($status == '3'): ?>selected<?php endif; ?>>陪玩中</option>
            <option value='4' <?php if($status == '4'): ?>selected<?php endif; ?>>待验收</option>
            <option value='5' <?php if($status == '5'): ?>selected<?php endif; ?>>待评价</option>
            <option value='6' <?php if($status == '6'): ?>selected<?php endif; ?>>已完成</option>
        </select>
         &nbsp; &nbsp;
        关键字:
        <input type="text" class="form-control" name="keyword" style="width: 200px;"
               value="<?php echo (isset($keyword) && ($keyword !== '')?$keyword:''); ?>" placeholder="请输入下单或陪玩师用户名">
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('Order/index'); ?>">清空</a>
    </form>
    
    <form method="post" class="js-ajax-form margin-top-20" action="<?php echo url('Order/listOrder'); ?>">
               <?php 
                 $status=array("0"=>"已取消","1"=>"待支付","2"=>"待接单","3"=>"陪玩中","4"=>"待验收","5"=>"待评价","6"=>"已完成");
                 ?>
        <table class="table table-hover table-bordered table-list">
            <thead>
            <tr>
                <th width="50">ID</th>
                <th>下单用户</th>
                <th>陪玩师</th>
                <th>订单状态</th>
                <th>下单技能</th>
                <th>下单时长</th>
                <th>下单手机</th>
                <th>下单QQ</th>
                <th>陪玩QQ</th>
                <th>下单金额</th>
                <th>下单时间</th>
                <th width="120"><?php echo lang('ACTIONS'); ?></th>
            </tr>
            </thead>
            <tbody>
            <?php if(is_array($orders) || $orders instanceof \think\Collection || $orders instanceof \think\Paginator): if( count($orders)==0 ) : echo "" ;else: foreach($orders as $key=>$vo): ?>
                <tr>
                    <td><?php echo $vo['id']; ?></td>
                    <td><?php echo $vo['user_login']; ?></td>
                    <td><?php echo $vo['pw_login']; ?></td>
                    <td><?php echo $status[$vo['status']]; ?></td>
                    <td><?php echo $vo['cat_name']; ?></td>
                    <td><?php echo $vo['jn_num']; ?>小时</td>
                    <td><?php echo $vo['mobile']; ?></td>
                    <td><?php echo $vo['qq']; ?></td>
                    <td><?php echo $vo['pw_qq']; ?></td>
                    <td><?php echo $vo['order_amount']; ?> 元</td>
                    <td><?php echo date('Y-m-d H:i',$vo['add_time']); ?></td>
                    
                    <td>               
                       <?php if(($vo['status'] > 0) and ($vo['status'] < 5)): ?> 
                        <a href="<?php echo url('order/quxiao',array('id'=>$vo['id'])); ?>" class="js-ajax-delete">
                            取消订单
                        </a>
                    <?php endif; ?>
                        
                    </td>
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