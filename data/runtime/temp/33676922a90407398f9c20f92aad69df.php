<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:38:"themes/simpleboot3/portal\search8.html";i:1574678274;s:68:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\nav.html";i:1574678276;s:71:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\footer.html";i:1574678276;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="webkit" name="renderer" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
    <title><?php echo $site_info['site_name']; ?></title>
<link href="/themes/simpleboot3/public/assets/css/bootstrap.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/vendors.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/components.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/search.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script></head>
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

<main id="search" style="min-height: 67px;">
    <div class="limit-wrap">
        <!--筛选-->
        <div class="filter">
            <div class="items">
                <div class="type game-service">游戏服务</div>
                <div class="list">
                    <?php if(is_array($fuwu) || $fuwu instanceof \think\Collection || $fuwu instanceof \think\Paginator): $i = 0; $__LIST__ = $fuwu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;$isFocus=$catid==$vo['id']?"isFocus":""; ?>
                        <a href="<?php echo url('portal/search/index8',array('catid'=>$vo['id'])); ?>" class="single <?php echo $isFocus; ?>">
                            <div class="img">
                                <img src="/themes/simpleboot3/public/assets/images/<?php echo $vo['cat_desc']; ?>.png" alt="">
                                <img src="/themes/simpleboot3/public/assets/images/<?php echo $vo['cat_desc']; ?>1.png" alt="">
                            </div>
                            <div class="name"><?php echo $vo['cat_name']; ?></div>
                        </a>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
        <!--筛选 end-->
        <!-- 排序 -->
        <div class="sorting">
            <div class="items fl">
                <?php $paixu=array("0"=>"综合排序"); if(is_array($paixu) || $paixu instanceof \think\Collection || $paixu instanceof \think\Paginator): if( count($paixu)==0 ) : echo "" ;else: foreach($paixu as $key=>$vo): $isFocus=$key==$order?"isFocus":""; ?>
                <a href="<?php echo url('portal/search/index8',array('catid'=>$catid)); ?>" class="single dib <?php echo $isFocus; ?>"><?php echo $vo; ?></a>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <!-- 排序 end -->
        <!--筛选结果-->
        <div class="results clearfix">
            <div class="left fl">
                <div class="list clearfix">
                    <?php if(is_array($peiwanshi) || $peiwanshi instanceof \think\Collection || $peiwanshi instanceof \think\Paginator): $i = 0; $__LIST__ = $peiwanshi;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <div class="single"><a href="<?php echo cmf_url('portal/detail/index',array('id'=>$vo['id'],'catid'=>$catid)); ?>" target="_blank" class="img">
                        <img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" alt="" width="184px;"> </a> 
                        <div class="detail"><div class="top clearfix"><div class="name fl" style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; max-width: 100px;"><?php echo $vo['user_login']; ?></div> 
                        <div class="state fl" style="margin-left: 0px;"><i class="icon icon-level-<?php echo $vo['pw_level']; ?>" style="transform: scale(0.75); margin-top: -10px; vertical-align: middle;"></i></div>
                        <div class="fr level"><?php echo $vo['level']; ?></div></div> <div class="bottom clearfix"><div class="location fl" style="width: 70px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><i class="icon icon-location"></i><?php echo $vo['province']; ?></div> <div class="price fr"><strong><?php echo $vo['jiage']; ?></strong>元/小时</div></div></div></div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <div style="text-align: center;">
                <ul class="pagination"><?php echo $page; ?></ul>
                </div>
            </div>

        </div>
        <!--筛选结果 end-->

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