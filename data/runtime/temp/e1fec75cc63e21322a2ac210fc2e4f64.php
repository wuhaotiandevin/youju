<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:47:"themes/admin_simpleboot3/admin\haoma\index.html";i:1574678274;s:73:"D:\phpstudy_pro\WWW\pw\public\themes\admin_simpleboot3\public\header.html";i:1574678274;}*/ ?>

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
	<div class="wrap J_check_wrap">          
          <form class="well form-search" method="post" action="<?php echo url('Admin/haoma/add'); ?>">
            <div class="search_type cc mb10">
              <div class=""> 
                <span class="mr20">
                新增靓号：
                <input type="text" class="form-control" name="uid" style="width:200px;display: inherit;" value="">
                出售价格：
                <input type="text" name="price" class="form-control" style="width:200px;display: inherit;" value="" >元
                <input type="submit" class="btn" value="确定"/>
                </span>
              </div>
            </div>
          </form>
          <div class="table_lmb10ist">
 				<table width="100%" class="table table-hover">
                <thead>
                      <tr> 
                        <th colspan="6" > 
                        <form class="well form-search" method="post" action="<?php echo url('Admin/haoma/index'); ?>"><div class="search_type cc mb10"><span class="mr20">靓号列表:
                        <input type="text" class="form-control" name="keyword" style="width:200px;display: inherit;" value="<?php echo $keyword; ?>" placeholder="请输入靓号">
                        <input type="submit" class="btn" value="搜索"/></span></div>
                    </form>
                        </th>
                      </tr>
                </thead>    
                
                   <tr>             
                	<?php if(is_array($haoma) || $haoma instanceof \think\Collection || $haoma instanceof \think\Paginator): $k = 0; $__LIST__ = $haoma;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 5 );++$k;if($k > 5): if($mod == '0'): ?></tr><tr><?php endif; endif; ?>
                        <td>
                        	<strong class="rname"><?php echo $vo['haoma']; ?></strong>价格:<?php echo $vo['price']; ?>
                            <a href="<?php echo url('Admin/haoma/delete',array('id'=>$vo['id'])); ?>" class="J_ajax_del">删除</a>
                        </td>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </tr>
                </table>
                
                
            </div>
            <div class="pagination"><?php echo $page; ?></div>
    		
 
	</div>
	<script src="/statics/js/common.js"></script>
</body>
</html>