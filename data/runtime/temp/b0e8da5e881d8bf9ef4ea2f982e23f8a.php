<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:36:"themes/simpleboot3/portal\order.html";i:1574238610;s:66:"D:\wwwroot\www.peiwan.pw\public\themes\simpleboot3\public\nav.html";i:1574238611;s:69:"D:\wwwroot\www.peiwan.pw\public\themes\simpleboot3\public\footer.html";i:1574238611;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="webkit" name="renderer" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
    <title>在线下单-<?php echo $site_info['site_name']; ?></title>
    <link href="/themes/simpleboot3/public/assets/css/vendors.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/components.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/general-order.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script></head>
<style type="text/css">
.chongzhi{
        float: right;
    margin-top: 30px;
    width: 60px;
    height: 26px;
    line-height: 26px;
    color: #fff;
    background-color: #ff6a45;
    border-radius: 13px;
    border: 0;
    text-align: center;
    cursor: pointer;
}
.add,.reduce {
    color: #737373;
    width: 26px;
    height: 26px;
    line-height: 24px;
    text-align: center;
    cursor: pointer;
    background-color: #f7f7f7;
    border: 1px solid #ccc;
    border-radius: 3px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    overflow: hidden;
}
    .sum{
            width: 40px;
    height: 26px;
    margin: 0 4px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 3px;
    }
    .fl{
        float: left;
    }
.discount_show_tab{
    color:#ff9b00;
    font-size: 12px;
    display: inline-block;
    position: relative;
  }
  .discount_show_tab_content_item span{
    font-weight: bold;
    margin:0 5px;
  }
  .discount_show_tab_title{
    border: 1px solid #ff9b00;
    width: 90px;
    cursor: pointer;
    display: inline-block;
    height: 30px;
    line-height: 30px;
    padding:0  13px ;
    position: relative;
    top:1px;
    z-index: 3;
  }
  .discount_show_tab_content{
    position: absolute;
    display: none;
    padding: 15px 10px;
    border: 1px solid #ff9b00;
    max-width: 230px;
    right: 0;
    margin-top: -6px;
  }

  .discount_show_tab:hover .discount_show_tab_title {
    border-bottom-color:#fff;
  }
  .discount_show_tab:hover .discount_show_tab_content{
    background: #fff;
    display: block;
  }
  .discount_show_tab_content_item{
    border-radius: 4px;
    border: 1px dashed #ffdfaf;
    background-color: #fff9ed;
    text-align: center;
    padding: 10px 0;
    margin-bottom: 5px;
    color:#ff5a00;
  }

  .discount_show_tab_arrow{
    display: inline-block;
    transform: scaleX(1.5) rotate(90deg);

  }

  .discount_show_tab:hover .discount_show_tab_arrow{
    transform: scaleX(1.5) rotate(-90deg);
  }

  .discount_show_tab2:hover .discount_show_tab_title {
    border-bottom-color:#ff9b00;
  } 
  .discount_show_tab2 .discount_show_tab_title{
    border-radius: 4px;
    height: 30px;
    line-height: 30px;
  }
  .discount_show_tab2  .discount_show_tab_content{
    margin-top: 5px;
    width: 249px;
    background: #fff;
    left: -68px;
    top: 30px;
    border:0;
    border-top: 2px solid #ff5400;
    box-shadow: 0 3px 3px rgba(0,0,0,.3);
    border-radius: 0 0 8px 8px;
    padding-bottom: 10px;
  }
  .discount_show_tab2  .discount_show_tab_content::before{
    content: "";
    position: absolute;
    display: block;
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-bottom: 7px solid #ff5400;
    top: -7px;
    left: 50%;
    margin-left: -5px;
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

    
    
<main id="general-order">
  <div class="limit-wrap">
    <div class="general-order">
<form class="form-horizontal js-ajax-form" action="<?php echo url('portal/order/addPost',array('id'=>$fuwu['id'])); ?>" method="post">
      <h3>我的订单</h3>

      <table class="user-list">
        <caption>订单信息</caption>
        <thead>
          <tr>
            <th>陪玩</th>
            <th>昵称</th>
            <th>服务技能</th>
            <th>单位(元/每小时)</th>
            <th style="text-align: left;">购物数量</th>
            <th>总价</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><img src="<?php echo cmf_get_image_url($fuwu['avatar']); ?>" alt=""></td>
            <td><?php echo $fuwu['user_login']; ?></td>
            <td><?php echo $fuwu['cat_name']; ?></td>
            <td><span class="c1 danjia"><?php echo $fuwu['jiage']; ?></span><?php if(($fuwu['dis9'] > 0) OR ($fuwu['dis8'] > 0) OR ($fuwu['dis7'] > 0)): ?>
      <div class="discount_show_tab discount_show_tab2" style="margin-top: 11px;  margin-left: 5px;">
  <div class="discount_show_tab_title">限时折扣 <span class="discount_show_tab_arrow">&gt;</span></div>
  <div class="discount_show_tab_content">
    <?php if($fuwu['dis9'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $fuwu['dis9']; ?></span>小时可享受 <span>9</span>折优惠</div><?php endif; if($fuwu['dis8'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $fuwu['dis8']; ?></span>小时可享受 <span>8</span>折优惠</div><?php endif; if($fuwu['dis7'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $fuwu['dis7']; ?></span>小时可享受 <span>7</span>折优惠</div><?php endif; ?>
    </div>
</div><?php endif; ?></td>
            <td class="shuliang"><div class="reduce fl">-</div><input readonly="readonly" type="text" name="num" class="sum fl" value="1"><div class="add fl">+</div></td>
            <td><span class="c1 zongjia"><?php echo $fuwu['jiage']; ?></span></td>
          </tr>
          <tr>
            <td colspan="6">
              <textarea name="content" cols="30" rows="3" class="comm-textarea-pure" maxlength="200" placeholder="请填写备注信息"></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="6">
              <label>
                <strong>*</strong>联系手机：<input type="text" class="comm-input" name="mobile"  value="<?php echo $mobile; ?>" placeholder="请填写联系手机">
              </label>
              <label>
                <strong>*</strong>QQ：<input type="text" class="comm-input"  name="qq" value="<?php echo $qq; ?>" placeholder="请填写QQ号">
              </label>
              <label>
                微信：<input type="text" class="comm-input" name="weixin" maxlength="20" placeholder="请填写微信号码">
                <div class="error"></div>
              </label>
            </td>
          </tr>
        </tbody>
      </table>
        
      <h3 style="margin-top: 40px;">支付方式</h3>
      <div class="pay-methods">
        <label class="comm-radio">
          <input type="radio" name="pay" checked value="1" v-model="order.pay_type">
          <span></span>
          <i class="icon icon-pay-balance-2"></i>
          余额方式 <span class="c1" style="white-space: nowrap;">( ￥<?php echo $yue; ?> )</span>
        </label>

        <a href="/user/caiwu/chongzhi" class="chongzhi">去充值</a>
        
      </div>
      
      

      <div class="total">
        <p><span class="zhekou"></span>实付金额：<strong class="c1 shijia"><?php echo $fuwu['jiage']; ?></strong>元</p>
        <input type="hidden" name="order_amount" id="order_amount" value="<?php echo $fuwu['jiage']; ?>">
      </div>

      <div class="buttons">
        <span class="c2">温馨提示：订单提交后，请第一时间联系陪玩专员。以便及时为您服务。</span>
        <button class="js-ajax-submit comm-btn primary">提交订单</button>
      </div>
</form>
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
<script type="text/javascript">
     $(".shuliang").on("click",".reduce",function(){
       var $num=$(this).parent().find("input");
    var num=parseInt($num.val());
    var btype=$(this).attr("name");
        num--;
        if(num<1){
            num=1;
        }
        $num.val(num);
        partCount($(this));
    })
    $(".shuliang").on("click",".add",function(){
       var $num=$(this).parent().find("input");
    var num=parseInt($num.val());
    var btype=$(this).attr("name");
        num++;
        if(num>30){
            num=30
        }
        $num.val(num);
        partCount($(this));
    })
    function partCount(obj){
    var price=$('.danjia').html(); 
    var num=parseInt(obj.parents('.shuliang').find('input').val());
    if(!num){
        num=0;
    }
    if(price=="-"){
        $('.zongjia').html("-");
        $('.shijia').html("-");
    }else{
        $('.zongjia').html(parseInt(price)*num);
        var shijia = parseInt(price)*num;
        if(num>=<?php echo $fuwu['dis7']; ?> && <?php echo $fuwu['dis7']; ?>>0)
        {
          $('.zhekou').html('可享受折扣:<strong class="c1">'+parseInt(price)*num*3/10+'</strong>元,');
          shijia = shijia*7/10;
          $('.shijia').html(shijia);
          $('#order_amount').val(shijia);
        }
        else if(num>=<?php echo $fuwu['dis8']; ?> && <?php echo $fuwu['dis8']; ?>>0)
        {
          $('.zhekou').html('可享受折扣:<strong class="c1">'+parseInt(price)*num*2/10+'</strong>元,');
          shijia = shijia*8/10;
          $('.shijia').html(shijia);
          $('#order_amount').val(shijia);
        }
        else if(num>=<?php echo $fuwu['dis9']; ?> && <?php echo $fuwu['dis9']; ?>>0)
        {
          $('.zhekou').html('可享受折扣:<strong class="c1">'+parseInt(price)*num*1/10+'</strong>元,');
          shijia = shijia*9/10;
          $('.shijia').html(shijia);
          $('#order_amount').val(shijia);
        }
        else
        {
          $('.shijia').html(shijia);
          $('#order_amount').val(shijia);
        }
        
    }
}
</script></body>
</html>