<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:48:"themes/admin_simpleboot3/admin\setting\site.html";i:1590571928;s:82:"D:\phpstudy_pro\WWW\youju\youju\public\themes\admin_simpleboot3\public\header.html";i:1590571928;}*/ ?>
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
			<li class="active"><a href="#A" data-toggle="tab"><?php echo lang('WEB_SITE_INFOS'); ?></a></li>
			<!-- <li><a href="#B" data-toggle="tab">微信支付设置</a></li>
			<li><a href="#C" data-toggle="tab">支付宝支付设置</a></li> -->
			<li><a href="#F" data-toggle="tab">提现设置</a></li>
		</ul>
		<form class="form-horizontal  margin-top-20" role="form" action="<?php echo url('setting/sitePost'); ?>" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<div class="form-group">
								<label for="input-site-name" class="col-sm-2 control-label"><span class="form-required">*</span><?php echo lang('WEBSITE_NAME'); ?></label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-site-name" name="options[site_name]" value="<?php echo (isset($site_name) && ($site_name !== '')?$site_name:''); ?>">
								</div>
							</div>
							
							
							<div class="form-group">
								<label for="input-site_adress" class="col-sm-2 control-label">公司名称</label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-site_address" name="options[site_address]" value="<?php echo (isset($site_address) && ($site_address !== '')?$site_address:''); ?>">
								</div>
							</div>
							<div class="form-group">
								<label for="input-site_phone" class="col-sm-2 control-label">联系电话</label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-site_phone" name="options[site_phone]" value="<?php echo (isset($site_phone) && ($site_phone !== '')?$site_phone:''); ?>">
								</div>
							</div>
							<div class="form-group">
								<label for="input-site_icp" class="col-sm-2 control-label"><?php echo lang('WEBSITE_ICP'); ?></label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-site_icp" name="options[site_icp]" value="<?php echo (isset($site_icp) && ($site_icp !== '')?$site_icp:''); ?>">
								</div>
							</div>
							
						
						
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="1"><?php echo lang('SAVE'); ?></button>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="B">
							<div class="form-group">
								<label for="input-site_seo_title" class="col-sm-2 control-label"><?php echo lang('WEBSITE_SEO_TITLE'); ?></label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-site_seo_title" name="options[site_seo_title]" value="<?php echo (isset($site_seo_title) && ($site_seo_title !== '')?$site_seo_title:''); ?>">
								</div>
							</div>
							<div class="form-group">
								<label for="input-site_seo_keywords" class="col-sm-2 control-label"><?php echo lang('WEBSITE_SEO_KEYWORDS'); ?></label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-site_seo_keywords" name="options[site_seo_keywords]" value="<?php echo (isset($site_seo_keywords) && ($site_seo_keywords !== '')?$site_seo_keywords:''); ?>">
								</div>
							</div>
							<div class="form-group">
								<label for="input-site_seo_description" class="col-sm-2 control-label"><?php echo lang('WEBSITE_SEO_DESCRIPTION'); ?></label>
								<div class="col-md-6 col-sm-10">
									<textarea class="form-control" id="input-site_seo_description" name="options[site_seo_description]"><?php echo (isset($site_seo_description) && ($site_seo_description !== '')?$site_seo_description:''); ?></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0"><?php echo lang('SAVE'); ?></button>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="C">
							<div class="form-group">
								<label for="input-urlmode" class="col-sm-2 control-label"><?php echo lang('URL_MODE'); ?></label>
								<div class="col-md-6 col-sm-10">
									<?php $url_modes=array( "1"=>lang('URL_PATHINFO_MODE'), "2"=>lang('URL_REWRITE_MODE')); ?>
									<select class="form-control" name="options[urlmode]" id="input-urlmode">
										<?php if(is_array($url_modes) || $url_modes instanceof \think\Collection || $url_modes instanceof \think\Paginator): if( count($url_modes)==0 ) : echo "" ;else: foreach($url_modes as $key=>$vo): $url_mode_selected=isset($urlmode)&&$key==$urlmode?"selected":""; ?>
										<option value="<?php echo $key; ?>" <?php echo $url_mode_selected; ?>><?php echo $vo; ?></option>
										<?php endforeach; endif; else: echo "" ;endif; ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="input-html_suffix" class="col-sm-2 control-label"><?php echo lang('URL_REWRITE_SUFFIX'); ?></label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-html_suffix" name="options[html_suffix]" value="<?php echo (isset($html_suffix) && ($html_suffix !== '')?$html_suffix:''); ?>">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0"><?php echo lang('SAVE'); ?></button>
								</div>
							</div>
						</div>
						<!--
						<div class="tab-pane" id="E">
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo lang('COMMENT_CHECK'); ?></label>
								<div class="col-md-6 col-sm-10">
									<?php $comment_need_checked=empty($comment_need_check)?"":"checked"; ?>
									<div class="checkbox">
										<label><input type="checkbox" name="options[comment_need_check]" value="1" <?php echo $comment_need_checked; ?>></label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="input-comment_time_interval" class="col-sm-2 control-label"><?php echo lang('COMMENT_TIME_INTERVAL'); ?></label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-comment_time_interval" name="options[comment_time_interval]" value="<?php echo (isset($comment_time_interval) && ($comment_time_interval !== '')?$comment_time_interval:60); ?>">
									<p class="help-block">单位秒</p>
								</div>
							</div>
						</div>
						-->
						<div class="tab-pane" id="F">
							<div class="form-group">
								<label for="input-banned_usernames" class="col-sm-2 control-label">提现比例</label>
								<div class="col-md-6 col-sm-10">
									<input type="text" name="tx_settings[tx_bili]" value="<?php echo $tx_settings['tx_bili']; ?>">%(请输入100以内的数)
								</div>
							</div>
							<div class="form-group">
								<label for="input-banned_usernames" class="col-sm-2 control-label">最小提现金额</label>
								<div class="col-md-6 col-sm-10">
									<input type="text" name="tx_settings[min_money]" value="<?php echo $tx_settings['min_money']; ?>">元
								</div>
							</div>
							<div class="form-group">
								<label for="input-banned_usernames" class="col-sm-2 control-label">最大提现金额</label>
								<div class="col-md-6 col-sm-10">
									<input type="text" name="tx_settings[max_money]" value="<?php echo $tx_settings['max_money']; ?>">元
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0"><?php echo lang('SAVE'); ?></button>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="G">
							<div class="form-group">
								<label for="input-cdn_static_root" class="col-sm-2 control-label">静态资源cdn地址</label>
								<div class="col-md-6 col-sm-10">
									<input type="text" class="form-control" id="input-cdn_static_root" name="cdn_settings[cdn_static_root]" value="<?php echo (isset($cdn_settings['cdn_static_root']) && ($cdn_settings['cdn_static_root'] !== '')?$cdn_settings['cdn_static_root']:''); ?>">
									<p class="help-block">
										不能以/结尾；设置这个地址后，请将ThinkCMF下的静态资源文件放在其下面；<br>
										ThinkCMF下的静态资源文件大致包含以下(如果你自定义后，请自行增加)：<br>
										themes/admin_simplebootx/public/assets<br>
										static<br>
										themes/simplebootx/public/assets<br>
										例如未设置cdn前：jquery的访问地址是/static/js/jquery.js, <br>
										设置cdn是后它的访问地址就是：静态资源cdn地址/static/js/jquery.js
									</p>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary js-ajax-submit" data-refresh="0"><?php echo lang('SAVE'); ?></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</form>

	</div>
	<script type="text/javascript" src="/static/js/admin.js"></script>
</body>
</html>