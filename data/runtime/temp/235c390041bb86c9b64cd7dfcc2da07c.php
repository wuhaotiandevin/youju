<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:38:"themes/simpleboot3/user\\register.html";i:1574678276;s:68:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\nav.html";i:1574678276;s:71:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\footer.html";i:1574678276;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <title>游戏陪玩网-注册</title>
    <link href="/themes/simpleboot3/public/assets/css/bootstrap.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/iconfont.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/vendors.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/components.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/auth.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
</head>
<body>
<header class="m-header">
    <div class="top">
        <div class="limit-wrap">
        <a href="/"><i class="icon icon-logo"></i></a>
        <nav>
            <ul style="padding-left: 0;margin-left: 30px;">
                <li><a href="/">首页</a></li>
                <li><a href="/search">点单区</a></li>
                <li><a href="/search8">8元体验区</a></li>
                <!-- <li><a href="/portal/chat">语音大厅</a></li> -->
                <li><a href="/portal/index/haoma">靓号</a></li>
                <li class="mobile">
                    <a href="javascript:">移动端</a>
                    <img class="mobile-code" src="/themes/simpleboot3/public/assets/images/qrCode.png" alt="">
                </li>
            </ul>
        </nav>
        <form method="get" action="<?php echo url('/portal/search/search'); ?>" style="display:inline; ">
        <span class="search-bar">
            <input type="text" placeholder="陪玩师昵称或靓号" name="keyword">
            <i class="icon icon-search"></i>
        </span>
        </form>
        
            <a href="/user/apply" class="apply-enter">申请入驻</a>
            <?php $user=cmf_get_current_user();if($user){ ?>
            <div class="logged">
                <a href="/user/xiaoxi" class="tips-messages  new-messages"><i class="icon icon-bell"></i> 消息</a>
                <a href="/user/profile/center" class="userName"><span class="user-head"><?php if(empty($user['avatar'])): ?> 
                    <img src="/themes/simpleboot3/public/assets/images/headicon_128.png"/>
                    <?php else: ?>
                            <img src="<?php echo cmf_get_image_url($user['avatar']); ?>">
                      <?php endif; ?> </span>
                      <?php echo $user['user_login']; ?></a>
                <a  href="<?php echo cmf_url('user/Index/logout'); ?>">退出</a>
            </div>
            <?php }else{ ?>           
            <div class="login">    
                <a href="<?php echo cmf_url('/user/login'); ?>"  id="TopLogin">登录</a>
                <span>/</span>
                <a href="<?php echo cmf_url('/user/register'); ?>" id="TopRegister">注册</a>
            </div>
            <?php } ?>
        </div>
    </div>
    

</header>
<div class="m-header-p"></div>
<script type="text/javascript">
    $('.search-bar .icon-search').click(function(){
        var $form = $(this).closest('form');
        $form.submit();
    });
</script>

<div class="container" style="max-width: 850px;">
    <div class="node_1505866184">
        <div class="row">
            <div class="col-md-7">
                 <img class="node_pic"  src="/themes/simpleboot3/public/assets/images/59e6eab41fc98.png">
            </div>
            <div class="col-md-5">
        <form class="js-ajax-form" action="<?php echo url('user/Register/doRegister'); ?>" method="post">
               <div class="node_title">
                    <span>用户注册</span>
                    <em>已有账号？<a href="<?php echo url('/user/login'); ?>">立即登录</a></em>
                </div>
                <input type="hidden" name="user_type" value="1">
 <div class="form-group field-registerform-mobile required">
<div class="input-group"><div class="input-group-addon"><i class="iconfont icon-geren"></i></div><input type="text"  class="form-control" name="username"  placeholder="用户名"></div>
</div>  
                <div class="form-group field-registerform-mobile required">
<div class="input-group"><div class="input-group-addon"><i class="iconfont icon-shouji"></i></div><input type="text"  class="form-control" name="phone" id="js-mobile-input" placeholder="手机号"></div>
</div>   
<div class="form-group">
        <div style="position: relative;">
            <input type="text" name="verification_code" placeholder="手机验证码" style="width:140px;" class="form-control">
            <a class="btn btn-success js-get-mobile-code" style="width: 118px;line-height:26px;position: absolute;top:0;right: 0;" data-wait-msg="[second]秒后再次获取" data-mobile-input="#js-mobile-input" data-url="/user/verification_code/send" daty-type="register" data-init-second-left="60">获取验证码</a>
        </div>
        </div>

<div class="form-group field-registerform-password required">
<div class="input-group"><div class="input-group-addon"><i class="iconfont icon-mima"></i></div><input type="password"  class="form-control" name="password" placeholder="密码"></div>
</div>

<div class="form-group field-registerform-password required">
<div class="input-group"><div class="input-group-addon"><i class="iconfont icon-mima"></i></div><input type="password"  class="form-control" name="repassword" placeholder="再次输入密码"></div>
</div>
                
                <div class="form-group">
                    <div class="form-group field-registerform-accept">
 <input type="hidden" name="RegisterForm[accept]" value="0"><label><input type="checkbox" id="registerform-accept" name="RegisterForm[accept]" value="1" checked> 我已阅读并同意</label><a target="_blank" href="#">《游戏陪玩网用户协议》</a>
</div>
                </div>
                <div class="form-group node_submit">
                    <button type="submit" class="js-ajax-submit btn btn-default">注册</button>                </div>
                </form>           
                 <div> 
              <a href="/plugin/qqlogin/index/index?mobile=0" class="thirdparty qq"><img src="/themes/simpleboot3/public/assets/images/share-qq.png" style="width: 36px;height: 36px;margin-right: 10px;">
              </a> 
              <a href="/user/login/wxlogin.html" class="thirdparty weixin"><img src="/themes/simpleboot3/public/assets/images/share-weixin.png" style="width: 36px;height: 36px;">
              </a> 
              </div></div>
        </div>
    </div>
</div>

<div  class="float-box">
        <div ><span ><i  class="icon icon-f-qq"></i></span>在线客服 
            <div  class="popup-wrap"><div >
                <a  href="tencent://message/?uin=<?php echo $site_info['site_admin_email']; ?>&amp;Site=&amp;Menu=yes" target="_blank">
                <dl  class="clearfix"><dt ><i  class="icon icon-s-qq"></i></dt> <dd >QQ：<?php echo $site_info['site_admin_email']; ?></dd></dl></a>
            <a  href="tencent://message/?uin=<?php echo $site_info['site_admin_email1']; ?>&amp;Site=&amp;Menu=yes" target="_blank">
                <dl  class="clearfix"><dt ><i  class="icon icon-s-qq"></i></dt> <dd >QQ：<?php echo $site_info['site_admin_email1']; ?></dd></dl></a></div>
            </div></div> <div ><span ><i  class="icon icon-f-mobile"></i></span>
            移动端
            <div  class="popup-wrap"><div  class="qr-code-mobile"><i  class="icon icon-qr-code-mobile"></i> 
                <p >扫一扫进入</p></div></div></div> <div ><a onclick="gotoTPoint('top',400)" ><span><i  class="icon icon-f-back-top"></i></span></a>
                </div></div>
 <div class="m-footer">
    <div class="limit-wrap">
        <div class="ta-justify">
            <div class="box">
                <h4>客服信息</h4>
                <a href="tencent://message/?uin=<?php echo $site_info['site_admin_email']; ?>&Site=&Menu=yes" target="_blank">
                    <i class="icon icon-s-qq"></i>
                    客服QQ: <?php echo $site_info['site_admin_email']; ?>
                </a>
                <a href="tencent://message/?uin=<?php echo $site_info['site_admin_email1']; ?>&Site=&Menu=yes" target="_blank">
                    <i class="icon icon-s-qq"></i>
                    客服QQ: <?php echo $site_info['site_admin_email1']; ?>
                </a>
            </div>
            <div class="box">
                <h4>政策条款</h4>
                <a href="/aboutus">关于我们</a>
                <a href="/guestbook">意见建议</a>
            </div>
            <div class="box">
                <h4>帮助中心</h4>
                
                <a href="/help/8">新手帮助</a>
                <a href="/help/16">陪玩师接单等级提升规则标准</a>            
            </div>
            <div class="box">
                <h4>友情链接</h4>
                 <?php
     $__LINKS__ = \app\admin\service\ApiService::links();
if(is_array($__LINKS__) || $__LINKS__ instanceof \think\Collection || $__LINKS__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LINKS__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>

                <a href="<?php echo (isset($vo['url']) && ($vo['url'] !== '')?$vo['url']:''); ?>"  target="_blank"><?php echo (isset($vo['name']) && ($vo['name'] !== '')?$vo['name']:''); ?></a>
                
<?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <div class="box">
                <h4>关注我们</h4>
                <a href="javascript:">
                    <i class="icon icon-f-sina"></i>
                    &nbsp;
                    <i class="icon icon-f-wechat"></i>
                </a>
            </div>
            <div class="box">
                <h4>全球支付</h4>
                <a href="javascript:">
                    <i class="icon icon-f-alipay"></i>
                </a>
                <a href="javascript:">
                    <i class="icon icon-f-wepay"></i>
                </a>
            </div>
        </div>

        <div class="f-copyright">
            Copyright&copy; 2018 <?php echo $site_info['site_address']; ?> All Rights Reserved
            <a href="http://www.miitbeian.gov.cn" target="_blank"><?php echo $site_info['site_icp']; ?></a>
            <p>温馨提示：抵制不良游戏 拒绝盗版游戏 注意自我保护 谨防受骗上当 适度游戏益 沉迷游戏伤身 合理安排时间 享受健康生活</p>
        </div>
    </div>
</div>
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
<script type="text/javascript">
    function gotoTPoint(obj, speed) {
    var objTop;
    var objId = '#' + obj;
    if (obj != 'top') {
        objTop = $(objId).offset().top-70;
    } else {
        objTop = 0;
    }
    $('html,body').animate({
        scrollTop: objTop
    }, speed);
}
</script>
</body>
</html>