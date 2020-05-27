<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:35:"themes/simpleboot3/wap\article.html";i:1574678276;}*/ ?>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title><?php echo $site_info['site_name']; ?></title>
<link href="/themes/simpleboot3/public/assets/wap_css/components.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/wap_css/vendors.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
<style type="text/css">
  img{
    max-width: 100%;
  }
</style>
</head>
<body>
<div id="app">
  <div   class="mui-container customer-service fixed-container" style="background-color: #fff;">
    <div   class="mui-header personal-center-header"  style="flex: 0 0 50px;">
      <div   class="mui-title" >
        <div  class="mui-title-content">
          <div><?php echo $article['post_title']; ?></div>
        </div>
      </div>
      <div  class="mui-buttons start" >
        <button data-v-066c8378="" data-v-0e8cfb82="" class="mui-button mui-back-button" ><i data-v-0e8cfb82="" data-v-066c8378="" class="iconfont icon-fh"></i> </button>
      </div>
    </div>
    <div   class="mui-content" >
      <?php echo cmf_replace_content_file_url(htmlspecialchars_decode($article['post_content'])); ?>
    </div>
  </div>
  <!---->
</div>
<script type="text/javascript">
    //È«¾Ö±äÁ¿
    var GV = {
        ROOT: "/",
        WEB_ROOT: "/",
        JS_ROOT: "static/js/"
    };
    $(document).on('click', '.start', function() {
                  window.location.href='/wap';
      })
</script>

<script src="/static/js/wind.js"></script>
<script src="/static/js/frontend.js"></script>
<script type="text/javascript"  src="/themes/simpleboot3/public/assets/wap_js/common.js"></script>
<script type="text/javascript"  src="/themes/simpleboot3/public/assets/wap_js/index.js"></script>
</body>
</html>
