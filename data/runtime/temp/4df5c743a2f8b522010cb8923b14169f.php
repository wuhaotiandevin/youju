<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:37:"themes/simpleboot3/portal\\index.html";i:1574678274;s:64:"D:\phpstudy_pro\WWW\pw\public\themes\simpleboot3\public\nav.html";i:1574678276;s:67:"D:\phpstudy_pro\WWW\pw\public\themes\simpleboot3\public\footer.html";i:1574678276;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="webkit" name="renderer" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
    <title><?php echo $site_info['site_name']; ?></title>    
<link href="/themes/simpleboot3/public/assets/css/vendors.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/components.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/index.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
<style type="text/css">
            .recommend_icon {
    width: 109px;
    height: 43px;
    position: absolute;
    top: 26px;
    left: -15px;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
    /* padding-left: 30px; */
    line-height: 27px;
    text-align: center;
    /* text-align: center; */
    color: #fff;
}

.listicon {
    background: url(/themes/simpleboot3/public/assets/images/icon.png) no-repeat;
    -webkit-transition: all .3s ease;
    transition: all .3s ease;
    height: 60px;
    font-style: normal;
   display: inline-block;
}
        </style>
        </head>
<script type="text/javascript">
var mobileAgent = new Array("iphone", "ipod", "ipad", "android", "mobile", "blackberry", "webos", "incognito", "webmate", "bada", "nokia", "lg", "ucweb", "skyfire");
var browser = navigator.userAgent.toLowerCase();
var isMobile = false;
for (var i=0; i<mobileAgent.length; i++){
    if (browser.indexOf(mobileAgent[i])!=-1){
        isMobile = true;
        //alert(mobileAgent[i]);
        location.href = '/wap';
        break;
    }
}
</script>
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
<main id="index">

    <header>
        <!-- Swiper -->
        <div id="full-screen-slider" style="text-align: center; text-align: -webkit-center;"">
    <ul id="slides">
        <?php if(is_array($slides) || $slides instanceof \think\Collection || $slides instanceof \think\Paginator): $i = 0; $__LIST__ = $slides;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <li style="background:url('<?php echo cmf_get_image_url($vo['image']); ?>') no-repeat center top"><a href="<?php echo $vo['url']; ?>" target="_blank"><?php echo $vo['title']; ?></a></li>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div>
        <div class="box-1">
            <div class="limit-wrap">
                <div class="ta-justify">
                    <!-- 热门服务 -->
                    <div class="hot-service">
                        <h3>热门服务<a href="/search" target="_blank" class="more">更多</a></h3>
                        <div class="games ta-justify">
                            <?php if(is_array($leimu) || $leimu instanceof \think\Collection || $leimu instanceof \think\Paginator): $i = 0; $__LIST__ = $leimu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <a href="<?php echo cmf_url('portal/search/index',array('catid'=>$vo['id'])); ?>" target="_blank">
                                <i class="icon icon-game-<?php echo $vo['cat_desc']; ?>"></i>
                                <span><?php echo $vo['cat_name']; ?></span>
                            </a>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            
                            
                        </div>
                    </div>

                    <!-- 平台公告 -->
                    <div class="platform-notice">
                        <h3>
                            <span>平台公告</span>
                        </h3>
                        <ul>
                            <?php if(is_array($gonggao) || $gonggao instanceof \think\Collection || $gonggao instanceof \think\Paginator): $i = 0; $__LIST__ = $gonggao;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li><a href="<?php echo cmf_url('portal/Article/index',array('id'=>$vo['id'],'cid'=>$vo['category_id'])); ?>" target="_blank"><span><?php echo $vo['post_title']; ?></span><span><?php echo date('Y/m/d',$vo['create_time']); ?></span></a></li>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            <li class="more"><a href="<?php echo cmf_url('portal/List/index',array('id'=>1)); ?>" target="_blank">更多</a></li>
                        </ul>
                    </div>

                    <div class="platform-notice">
                        <h3>
                            <span>资讯头条</span>
                        </h3>

                       <ul>
                            <?php if(is_array($toutiao) || $toutiao instanceof \think\Collection || $toutiao instanceof \think\Paginator): $i = 0; $__LIST__ = $toutiao;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <li><a href="<?php echo cmf_url('portal/Article/index',array('id'=>$vo['id'],'cid'=>$vo['category_id'])); ?>" target="_blank"><span><?php echo $vo['post_title']; ?></span><span><?php echo date('Y/m/d',$vo['create_time']); ?></span></a></li>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            <li class="more"><a href="<?php echo cmf_url('portal/List/index',array('id'=>2)); ?>" target="_blank">更多</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>


    <div class="main-box">
        <div class="limit-wrap clearfix">
            <div class="box-l">

                <!-- 平台热推 -->
                <div class="platform-hot-push">
                    <h3>
                        <i class="icon icon-hot"></i>
                        热门推荐<a href="<?php echo url('portal/search/search',array('tuijian'=>1)); ?>" class="refresh">查看更多>>></a>
                    </h3>
                    <!-- 热推陪玩 -->
                    <div class="ta-justify">
                        <?php if(is_array($peiwanshi) || $peiwanshi instanceof \think\Collection || $peiwanshi instanceof \think\Paginator): $i = 0; $__LIST__ = $peiwanshi;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <div class="accompany-play">
                        <a href="<?php echo cmf_url('portal/detail/index',array('id'=>$vo['id'])); ?>" class="user-pic"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" style="width: 184px;height: 184px;"> <?php if($vo['tags'] != ''): ?><i class="recommend_icon listicon"><?php echo $vo['tags']; ?></i><?php endif; ?></a> 
                        <div class="user-name clearfix"><span style="max-width: 160px;"><span style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; max-width: 120px;"><?php echo $vo['user_login']; ?></span> <i class="level icon icon-level-<?php echo $vo['level']; ?>" style="transform: scale(0.75); margin-top: -3px; vertical-align: middle;"></i></span> <span class="tag" style="color: rgb(1, 159, 182);overflow: hidden;"><?php echo $vo['gexing']; ?></span></div> <div class="user-price"><span><?php echo $vo['leimu']; ?></span>  <span><strong><?php echo $vo['jiage']; ?></strong>元/小时</span></div></div> 
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>

            </div>
            <div class="recommend_list">
            <div class="recommend_list_title" style="margin-left:20px;">新秀推荐</div>
            <div class="fl" id="recommend_list_content_box">
                <?php if(is_array($peiwanshi1) || $peiwanshi1 instanceof \think\Collection || $peiwanshi1 instanceof \think\Paginator): $i = 0; $__LIST__ = $peiwanshi1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <a href="<?php echo cmf_url('portal/detail/index',array('id'=>$vo['id'])); ?>"><div class="recommend_list_content_box" style="width:113px;"> <div class="recommend_list_avatar_big"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>"></div><div class="recommend_list_name"><?php echo $vo['user_login']; ?></div> <div class="fl recommend_list_location"><?php echo $vo['city']; ?></div>                               <div class="fl recommend_list_man ">♀&nbsp;<?php echo $vo['age']; ?></div><div class="clearfix"></div></div>
                </a>
            <?php endforeach; endif; else: echo "" ;endif; ?></div>
            <div class="clearfix"></div>
        </div>
        </div>
    </div>
        <!-- <div class="view-more">
            <a href="/search" target="_blank" class="view-more"><i class="icon"></i>查看更多</a>
         </div> -->
         
         <div class="guild">
            <div class="limit-wrap">
                <div class="tit"><i class="icon icon-guild"></i>公会推荐</div>
                <div class="list clearfix">
                <?php if(is_array($guild) || $guild instanceof \think\Collection || $guild instanceof \think\Paginator): $i = 0; $__LIST__ = $guild;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <a href="<?php echo cmf_url('/portal/guild/detail',array('id'=>$vo['id'])); ?>" class="single">
                        <img class="icon" src="<?php echo cmf_get_image_url($vo['image']); ?>" alt="">
                        <div class="slogan"><div class="txt"><?php echo $vo['name']; ?><br><?php echo $vo['slogan']; ?></div></div>
                    </a>
                  <?php endforeach; endif; else: echo "" ;endif; ?>  
                   
                </div>
            </div>
        </div>

        <!-- 排行榜 -->
        <div class="ranking-lists">
            <div class="limit-wrap ta-justify">
                <div class="list">
                    <header><i class="icon icon-list-1"></i>接单王</header>
                    <?php if(is_array($paihang['jiedan']) || $paihang['jiedan'] instanceof \think\Collection || $paihang['jiedan'] instanceof \think\Paginator): $i = 0; $__LIST__ = $paihang['jiedan'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                     <div class="ranking-user">
                        <a href="<?php echo cmf_url('portal/detail/index',array('id'=>$vo['id'])); ?>" class="user-pic">
                            <span class="ranking"><?php echo $i; ?></span>
                            <span class="user-head"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" style="width: 100px;"></span>
                            <span class="user-name"><?php echo $vo['user_login']; ?></span>
                            <span class="achievement">接单数：<em><?php echo $vo['jiedan']; ?></em></span>
                        </a>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?> 
                </div>
                <div class="list">
                    <header><i class="icon icon-list-2"></i>魅力榜</header>
                    <?php if(is_array($paihang['meili']) || $paihang['meili'] instanceof \think\Collection || $paihang['meili'] instanceof \think\Paginator): $i = 0; $__LIST__ = $paihang['meili'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <div class="ranking-user">
                        <a href="<?php echo cmf_url('portal/detail/index',array('id'=>$vo['id'])); ?>" class="user-pic">
                            <span class="ranking"><?php echo $i; ?></span>
                            <span class="user-head"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" style="width: 100px;"></span>
                            <span class="user-name"><?php echo $vo['user_login']; ?></span>
                            <span class="achievement">魅力值：<em><?php echo $vo['meili']; ?></em></span>
                        </a>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    
                    
                </div>
                <div class="list">
                    <header><i class="icon icon-list-3"></i>富豪榜</header>
                    <?php if(is_array($paihang['gongxian']) || $paihang['gongxian'] instanceof \think\Collection || $paihang['gongxian'] instanceof \think\Paginator): $i = 0; $__LIST__ = $paihang['gongxian'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <div class="ranking-user">
                        <span class="ranking"><?php echo $i; ?></span>
                        <span class="user-head"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" style="width: 100px;"></span>
                        
                        <span class="user-name"><?php echo $vo['user_login']; ?></span>
                        
                        <span class="achievement">贡献值：<em><?php echo $vo['gongxian']; ?></em></span>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    
                    
                </div>
            </div>
        </div>

        <div class="promise">
            <div class="limit-wrap ta-justify">
                <dl class="clearfix">
                    <dt><i class="icon icon-competition"></i></dt>
                    <dd><p>优质陪玩</p><p>随时待命</p></dd>
                </dl>
                <dl class="clearfix">
                    <dt><i class="icon icon-guarantee"></i></dt>
                    <dd><p>15分钟未接单</p><p>订单自动退款</p></dd>
                </dl>
                <dl class="clearfix">
                    <dt><i class="icon icon-track"></i></dt>
                    <dd><p>下单接单短信提醒</p><p>进度随时跟踪</p></dd>
                </dl>
                <dl class="clearfix">
                    <dt><i class="icon icon-customer-service"></i></dt>
                    <dd><p>专业客服团队</p><p>有问题随时咨询</p></dd>
                </dl>
            </div>
        </div>
        
    </div>

</main>
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


<script  src="/themes/simpleboot3/public/assets/js/index.js"></script>
</body>
</html>