<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:50:"themes/admin_simpleboot3/admin\slide_item\add.html";i:1590636574;s:76:"D:\phpstudy_pro\WWW\youju\public\themes\admin_simpleboot3\public\header.html";i:1590571928;}*/ ?>
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
        <li><a href="<?php echo url('SlideItem/index',['slide_id'=>$slide_id]); ?>">轮播图页面列表</a></li>
        <li class="active"><a href="<?php echo url('SlideItem/add',['slide_id'=>$slide_id]); ?>">添加轮播图页面</a></li>
    </ul>
    <form action="<?php echo url('SlideItem/addPost'); ?>" method="post" class="form-horizontal js-ajax-form margin-top-20">
        <div class="row">
            <div class="col-md-9">
                <table class="table table-bordered">
                    <tr>
                        <th>标题<span class="form-required">*</span></th>
                        <td>
                            <input class="form-control" type="text" style="width:400px;" name="post[title]" id="title"
                                   required value="" placeholder="请输入标题"/>
                        </td>
                    </tr>
                   <tr>
                        <th>图片链接</th>
                        <td>
                            <input class="form-control" type="text" name="post[url]" id="keywords" value=""
                                   style="width: 400px" placeholder="请输入图片链接">
                        </td>
                    </tr>
					 <tr>
                        <th>跳转链接</th>
                        <td>
                            <input class="form-control" type="text" name="post[href]" id="keywords" value=""
                                   style="width: 400px" placeholder="请输入跳转链接">
                        </td>
                    </tr>
                     <!--<tr>
                        <th>描述</th>
                        <td><input class="form-control" type="text" name="post[description]" id="source" value=""
                                   style="width: 400px" placeholder="请输入描述"></td>
                    </tr>
                    <tr>
                        <th>轮播图内容</th>
                        <td>
                            <textarea class="form-control" name="post[content]" id="description"
                                      style="width: 47%; height: 100px;" placeholder="请填写轮播图内容"></textarea>
                        </td>
                    </tr>-->
                </table>
            </div>
            <div class="col-md-3">
                <table class="table table-bordered">
                    <tr>
                        <th><b>缩略图</b></th>
                    </tr>
                    <tr>
                        <td>
                            <div style="text-align: center;">
                                <input type="hidden" name="post[image]" id="thumb" value="">
                                <a href="javascript:uploadOneImage('图片上传','#thumb');">
                                    <img src="/themes/admin_simpleboot3/public/assets/images/default-thumbnail.png" id="thumb-preview"
                                         width="135" style="cursor: hand"/>
                                </a>
                                <input type="button" class="btn btn-sm"
                                       onclick="$('#thumb-preview').attr('src','/themes/admin_simpleboot3/public/assets/images/default-thumbnail.png');$('#thumb').val('');return false;"
                                       value="取消图片">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="hidden" name="post[slide_id]" value="<?php echo $slide_id; ?>">
                <button type="submit" class="btn btn-primary js-ajax-submit"><?php echo lang('ADD'); ?></button>
                <a class="btn btn-default" href="<?php echo url('SlideItem/index',['slide_id'=>$slide_id]); ?>"><?php echo lang('BACK'); ?></a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/static/js/admin.js"></script>
</body>
</html>