<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:37:"themes/simpleboot3/portal\\haoma.html";i:1574678274;s:68:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\nav.html";i:1574678276;s:71:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\footer.html";i:1574678276;}*/ ?>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>购买靓号</title>
        <link href="/themes/simpleboot3/public/assets/css/vendors.css" rel="stylesheet">
        <link href="/themes/simpleboot3/public/assets/css/components.css" rel="stylesheet">
        <link href="/themes/simpleboot3/public/assets/css/index.css" rel="stylesheet">
        <script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
        <style type="text/css">
        .hm_mod_theme_box_hd .theme_title {
    position: relative;
    height: 50px;
}
          .hm_mod_theme_box_hd .change {
    position: absolute;
    bottom: 11px;
    right: 20px;
    display: block;
    padding: 0 20px;
    line-height: 28px;
    height: 28px;
    background: url(//imgcache.gtimg.cn/vipstyle/haoma/act/haoma_act_template_v1/img/icon.png) no-repeat 20px -65px #ff9304;
    color: #fff;
    text-align: center;
    text-indent: 20px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-transition: all .1s ease-in-out;
    -moz-transition: all .1s ease-in-out;
    transition: all .1s ease-in-out;
}
.hm_mod_numlist {
    height: 100%;
    overflow: hidden;
    margin: 0 -1px;
}
.hm_mod_numlist .hm_mod_numitem {
    position: relative;
    background-color: #fff;
    width: 181px;
    overflow: hidden;
}
.hm_mod_numlist li {
    float: left;
    border: 1px solid #e7e7e7;
}
.hm_mod_numlist .hm_mod_numitem .num {
    font-size: 28px;
    width: 180px;
    padding: 15px 0 5px 30px;
    display: block;
}
.hm_mod_numlist .hm_mod_numitem p {
    height: 20px;
    height: auto;
    font-size: 14px;
}
.hm_mod_numitem .num {
    line-height: 32px;
    color: #707070;
    font-family: Arial;
}
.hm_mod_numlist .hm_mod_numitem:hover{border:1px solid #FE9D1F;z-index:2}
.hm_mod_numlist .hm_mod_numitem:hover .hide_cont{bottom:0}
.hm_mod_numlist .hm_mod_numitem .num .icon_liang, .hm_mod_numlist .hm_mod_numitem .num .icon_pu {
    margin: 7px 5px 0 -23px;
    float: left;
    display: inline;
}
.hm_mod_numlist .hm_mod_numitem .hide_cont {
    position: absolute;
    bottom: -36px;
    left: 0;
    width: 100%;
    background-color: #FE9D1F;
    color: #fff;
    line-height: 35px;
    height: 35px;
    -webkit-transition: bottom ease-in-out .3s;
    -moz-transition: bottom ease-in-out .3s;
    transition: bottom ease-in-out .3s;
    font-size: 12px;
    text-align: center;
}
.icon_liang {
    width: 18px;
    height: 18px;
}
.hm_mod_icon {
    background: url(/themes/simpleboot3/public/assets/images/sprite_icons.png);
    zoom: 1;
}
.txt_01 {
    color: #cc3d3d;
}
        </style>
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

        
    <div class="hm_mod_theme_box_hd" style="width: 1240px;min-width: 1240px;margin: 0 auto;">
      <div class="banner_box">                              
      <img src="/themes/simpleboot3/public/assets/images/haoma.jpg" width="100%">                          
    </div>                         
    <div class="theme_title" style="width: 100%;">                           
      <img src="/themes/simpleboot3/public/assets/images/lianghao.png"> 
      <!-- <a href="javascript:void(0)" class="change" title="换一批" index="0">换一批</a> -->                          </div>                      </div>
      <div class="hm_mod_theme_box_bd" style="width: 1240px;min-width: 1240px;margin: 0 auto;"><ul class="hm_mod_numlist clearfix">
        <?php if(is_array($haoma) || $haoma instanceof \think\Collection || $haoma instanceof \think\Paginator): $i = 0; $__LIST__ = $haoma;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <li class="hm_mod_numitem">                                  
          <a href="<?php echo url('user/profile/buyhao',array('id'=>$vo['id'])); ?>" class="js-ajax-dialog-btn num" data-msg="确定购买吗？" " data-table="portal_post">                                      
            <span class="hm_mod_icon icon_liang"></span><?php echo $vo['haoma']; ?>
            <p>价格：<span class="txt_01"><?php echo $vo['price']; ?></span>元</p>
            <div class="hide_cont"><span>立即购买</span></div>                                
          </a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                                      </ul></div>
  

        
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