<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:48:"themes/admin_simpleboot3/admin\jineng\index.html";i:1590571928;s:82:"D:\phpstudy_pro\WWW\youju\youju\public\themes\admin_simpleboot3\public\header.html";i:1590571928;}*/ ?>
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
        <li class="active"><a href="<?php echo url('jineng/index'); ?>">技能列表</a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="post" action="<?php echo url('Jineng/index'); ?>">
        订单状态:
        <select class="form-control" name="status" id="status" style="width: 140px;">
            <option value='0' <?php if($status == '0'): ?>selected<?php endif; ?>>所有技能</option>
            <option value='2' <?php if($status == '2'): ?>selected<?php endif; ?>>待审核</option>
            <option value='1' <?php if($status == '1'): ?>selected<?php endif; ?>>已审核</option>
        </select>
         &nbsp; &nbsp;
        关键字:
        <input type="text" class="form-control" name="keyword" style="width: 200px;"
               value="<?php echo (isset($keyword) && ($keyword !== '')?$keyword:''); ?>" placeholder="请输入陪玩用户名">
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('Jineng/index'); ?>">清空</a>
    </form>
    
               <?php 
                $status=['0'=>'已审核','1'=>'已审核','2'=>'未审核'];
                 ?>
        <table class="table table-hover table-bordered table-list">
            <thead>
            <tr>
                <th width="50">ID</th>
                <th>陪玩师</th>
                <th>陪玩QQ</th>
                <th>等级图片</th>
                <th>技能名称</th>
                <th>技能等级</th>
                <th>接单时长</th>
                <th>服务价格</th>
                <th>审核状态</th>
                <th width="120"><?php echo lang('ACTIONS'); ?></th>
            </tr>
            </thead>
            <tbody>
            <?php if(is_array($jineng) || $jineng instanceof \think\Collection || $jineng instanceof \think\Paginator): if( count($jineng)==0 ) : echo "" ;else: foreach($jineng as $key=>$vo): ?>
                <tr>
                    <td><?php echo $vo['id']; ?></td>
                    <td><?php echo $vo['user_login']; ?></td>
                    <td><?php echo $vo['qq']; ?></td>
                    <td><a href="javascript:parent.imagePreviewDialog('<?php echo cmf_get_image_url($vo['pic']); ?>');">
                                <img src="<?php echo cmf_get_image_url($vo['pic']); ?>" height="40px" width="40px"/>
                            </a></td>
                    <td><?php echo $vo['jineng']; ?></td>
                    <td><?php echo $vo['dengji']; ?></td>
                    <td><?php echo $vo['shichang']; ?>小时</td>
                    <td><?php echo $vo['jiage']; ?>元/小时<br><a href="javascript:parent.openIframeLayer('<?php echo url('jineng/jiage',array('id'=>$vo['id'])); ?>','修改价格-<?php echo $vo['jineng']; ?>',{area: ['870px', '400px']});">修改价格</a></td>
                    <td><?php echo $status[$vo['status']]; ?></td>
                    <td>               
                       <?php if($vo['status'] == '2'): ?>
                        <a href="<?php echo url('jineng/shenhe',array('id'=>$vo['id'],'status'=>1)); ?>"  class="js-ajax-dialog-btn" data-msg="确定通过吗？">
                            通过
                        </a>
                        <a href="<?php echo url('jineng/shenhe',array('id'=>$vo['id'],'status'=>2)); ?>"  class="js-ajax-dialog-btn" data-msg="确定拒绝吗？" style="margin-left: 5px;">
                            拒绝
                        </a>
                    <?php endif; ?>
                        
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