<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:49:"themes/admin_simpleboot3/admin\category\edit.html";i:1590734940;s:76:"D:\phpstudy_pro\WWW\youju\public\themes\admin_simpleboot3\public\header.html";i:1590571928;}*/ ?>
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
        <li><a href="<?php echo url('category/index'); ?>">所有服务类目</a></li>
        <li><a href="<?php echo url('category/add'); ?>">添加服务类目</a></li>
        <li class="active"><a>编辑服务类目</a></li>
    </ul>
    <form method="post" class="form-horizontal js-ajax-form margin-top-20" action="<?php echo url('category/editPost'); ?>">
        <div class="form-group">
            <label for="input-cat_name" class="col-sm-2 control-label">名称<span class="form-required">*</span></label>
            <div class="col-md-6 col-sm-10">
                <input type="text" class="form-control" id="input-cat_name" name="cat_name" value="<?php echo $category['cat_name']; ?>">
            </div>
        </div>
		<div class="form-group">
			<label for="input-parent_id" class="col-sm-2 control-label">父级类目<span class="form-required">*</span></label>
			<div class="col-md-6 col-sm-10">
				<input type="hidden" class="form-control" id="input-parent_id" name="parent_id" value="<?php echo $category['parent_id']; ?>">
				<input type="text" class="form-control" id="input-parent_name" name="parent_name" value="<?php echo $parent_name; ?>" disabled>
			</div>
		</div>
		<!--<div class="form-group">
			<label for="input-list_order" class="col-sm-2 control-label">list_order<span class="form-required">*</span></label>
			<div class="col-md-6 col-sm-10">
				<input type="text" class="form-control" id="input-list_order" name="list_order" value="<?php echo $category['list_order']; ?>">
			</div>
		</div>-->
		<div class="form-group">
			<label for="input-cat_desc" class="col-sm-2 control-label">描述</label>
			<div class="col-md-6 col-sm-10">
				<input type="text" class="form-control" id="input-cat_desc" name="cat_desc" value="<?php echo $category['cat_desc']; ?>">
			</div>
		</div>
        <div class="form-group">
                <label for="input-image" class="col-sm-2 control-label">默认图标</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" id="input-image" name="img_z" value="<?php echo $category['img_z']; ?>"> 
                    <a href="javascript:uploadOneImage('图片上传','#input-image');">上传图片</a>
                </div>
            </div>
           <div class="form-group">
				<label class="col-sm-2 control-label">设置热门</label>
				<div class="col-md-6 col-sm-10">
					<label class="radio-inline"><input type="radio" name="is_hot" value="1" <?php if($category['is_hot'] == 1): ?> checked<?php endif; ?>> 是 </label>
					<label class="radio-inline"><input type="radio" name="is_hot" value="0" <?php if($category['is_hot'] == '0'): ?> checked<?php endif; ?>> 否</label>
				</div>
			</div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="hidden" name="id" value="<?php echo $category['id']; ?>">
                <button type="submit" class="btn btn-primary js-ajax-submit"><?php echo lang('SAVE'); ?></button>
                <a class="btn btn-default" href="<?php echo url('category/index'); ?>"><?php echo lang('BACK'); ?></a>
            </div>
        </div>
    </form>
</div>
<script src="/static/js/admin.js"></script>
</body>
</html>