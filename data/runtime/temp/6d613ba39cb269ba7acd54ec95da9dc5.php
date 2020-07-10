<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:79:"D:\phpstudy_pro\WWW\youju\youju\public/plugins/tc_comment/view/admin_index.html";i:1590571928;s:79:"D:\phpstudy_pro\WWW\youju\youju\public\plugins\tc_comment\view\public\head.html";i:1590571928;}*/ ?>
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
		<table class="table table-hover table-bordered margin-top-20">
			<thead>
				<tr>
					<th width="50">ID</th>
					<th>上层ID</th>
					<th>名称</th>
                    <th>正文</th>
                    <th>文章</th>
                    <th>日期</th>
                    <td>状态</td>
					<th width="160"><?php echo lang('ACTIONS'); ?></th>
				</tr>
			</thead>
			<tbody>
				<?php 
                $user_status=array("0"=>"未审核","1"=>"已审核");
                 if(is_array($comments) || $comments instanceof \think\Collection || $comments instanceof \think\Paginator): if( count($comments)==0 ) : echo "" ;else: foreach($comments as $key=>$vo): ?>
				<tr>
					<td><?php echo $vo['id']; ?></td>
					<td><?php echo $vo['parent_id']; ?></td>
                    <td><?php echo $vo['full_name']; ?></td>
                    <td><?php echo $vo['content']; ?></td>
                    <td><a href="<?php echo $vo['url']; ?>" target="_blank"><?php echo $vo['object_id']; ?></a></td>
                    <td><?php echo date('Y-m-d H:i:s',$vo['create_time']); ?></td>
                    <td><?php echo $user_status[$vo['status']]; ?></td>
					<td>
                        <?php if(empty($vo['status']) || (($vo['status'] instanceof \think\Collection || $vo['status'] instanceof \think\Paginator ) && $vo['status']->isEmpty())): ?>
                            <a href="<?php echo cmf_plugin_url('TcComment://AdminIndex/cancelban',array('id'=>$vo['id'])); ?>"
                                   class="js-ajax-dialog-btn"
                                   data-msg="确定要审核这条信息吗？">审核</a>
                        <?php else: ?>
                            <a href="<?php echo cmf_plugin_url('TcComment://AdminIndex/ban',array('id'=>$vo['id'])); ?>" class="js-ajax-dialog-btn"
                                   data-msg="确定要加入未审核吗？">未审核</a>
                        <?php endif; ?>
                        <a class="js-ajax-dialog-btn" href="<?php echo cmf_plugin_url('TcComment://AdminIndex/delete',array('id'=>$vo['id'])); ?>" data-msg="您确定要删除评论吗？" data-ok="" data-cacel="取消">删除评论</a>
                    </td>
				</tr>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</tbody>
		</table>
        <ul class="pagination">
        <?php echo $page; ?>
        </ul>
	</div>
	<script src="/static/js/admin.js"></script>
</body>
</html>