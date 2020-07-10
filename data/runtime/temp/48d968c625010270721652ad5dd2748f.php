<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:33:"themes/simpleboot3/wap\login.html";i:1574678276;}*/ ?>
<html lang="en"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
    <title>在线登录-<?php echo $site_info['site_name']; ?></title>
    <link href="/themes/simpleboot3/public/assets/wap_css/components.css" rel="stylesheet">
    <link href="/themes/simpleboot3/public/assets/wap_css/vendors.css" rel="stylesheet">
    <script src="/themes/simpleboot3/public/assets/js/jquery.js"></script></head>
<body>

    
    <div id="app"><div  class="app"><div   class="mui-container login">
        <div class="mui-header personal-center-header"  style="flex: 0 0 50px;">
            <div class="mui-title" >
        <div  class="mui-title-content"><div>登录会员中心</div></div></div></div> 
        <div class="mui-content">
            <form class="js-ajax-form" action="<?php echo url('wap/login/doLogin'); ?>" method="post">
            <ul>
            <li><input type="text" placeholder="用户名/手机号" name="username"></li> 
            <li><input type="password" placeholder="密码" name="password"></li>
        </ul> 
        <div class="button-panel"><button class="comm-btn full-line js-ajax-submit">立即登录</button></div> 
         </form>
            <div class="other-panel"><div><a href="<?php echo cmf_url('wap/login/findPassword'); ?>" class="t-color-3">忘记密码</a></div> <div><a href="<?php echo cmf_url('wap/register/index'); ?>" class="m-color" >注册用户</a></div>

        </div>
        <div  style="width: 100%;height: 14%;text-align: center;font-size: 0;position: absolute;bottom: 3.7rem;left: 50%;margin-left: -50%;"> 
              <a href="/plugin/qqlogin/index/index?mobile=1" class="thirdparty qq"><img src="/themes/simpleboot3/public/assets/images/share-qq.png" style="width: 3rem;">
              </a>
              <a href="/user/login/wxlogin.html" class="thirdparty weixin"><img src="/themes/simpleboot3/public/assets/images/share-weixin.png" style="width: 3rem;margin-left: .4rem;">
              </a>
              </div>
        </div>

        </div> 
            <footer><a  href="<?php echo cmf_url('wap/index/index'); ?>" class=""><i class="iconfont icon-sy"></i> <i class="iconfont icon-syxz"></i>
            首页
        </a> <a  href="<?php echo cmf_url('wap/user/order'); ?>" class=""><i class="iconfont icon-dd"></i> <i class="iconfont icon-ddxz"></i>
            订单
        </a> <a href="<?php echo cmf_url('wap/user/index'); ?>" class="router-link-exact-active active"><i class="iconfont icon-mine"></i> <i class="iconfont icon-minexz"></i>
            未登录
        </a></footer></div> </div>

<script type="text/javascript">
    //全局变量
    var GV = {
        ROOT: "/",
        WEB_ROOT: "/",
        JS_ROOT: "static/js/"
    };
</script>
<script src="/static/js/wind.js"></script>
<script src="/static/js/frontend.js"></script>
<script type="text/javascript"  src="/themes/simpleboot3/public/assets/wap_js/common.js"></script>
<script type="text/javascript"  src="/themes/simpleboot3/public/assets/wap_js/index.js"></script>
</body></html>