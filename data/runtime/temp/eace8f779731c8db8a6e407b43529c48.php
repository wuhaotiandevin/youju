<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:37:"themes/simpleboot3/portal\detail.html";i:1574678274;s:64:"D:\phpstudy_pro\WWW\pw\public\themes\simpleboot3\public\nav.html";i:1574678276;s:65:"D:\phpstudy_pro\WWW\pw\public\themes\simpleboot3\public\chat.html";i:1574678276;s:67:"D:\phpstudy_pro\WWW\pw\public\themes\simpleboot3\public\footer.html";i:1574678276;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
    <title><?php echo $pw['user_login']; ?>详情-<?php echo $site_info['site_name']; ?></title>  
<link href="/themes/simpleboot3/public/assets/css/bootstrap.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/vendors.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/components.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/css/detail.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<style>
.audio.green-audio-player {
  width: 90px;
  min-width: 90px;
  height: 26px;
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, 0.07);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-left: 14px;
  padding-right: 14px;
  border-radius: 14px;
  user-select: none;
  -webkit-user-select: none;
  background-color: #13bfa6;
}
.audio.green-audio-player .play-pause-btn {
  display: none;
  cursor: pointer;
}
.audio.green-audio-player .spinner {
  width: 18px;
  height: 18px;
  background-image: url(/static/images/loading.png);
  background-size: cover;
  background-repeat: no-repeat;
  animation: spin 0.4s linear infinite;
}
.audio.green-audio-player .controls {
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  line-height: 18px;
  color: #55606E;
  display: flex;
  flex-grow: 1;
  justify-content: space-between;
  align-items: center;
  margin-left: 24px;
  margin-right: 24px;
}
.audio.green-audio-player .controls span {
  cursor: default;
}

.picshow {
  BORDER-BOTTOM: #d9e0ea 1px solid; BORDER-LEFT: #d9e0ea 1px solid; MARGIN: 0px auto; WIDTH: 350px; HEIGHT: 445px; BORDER-TOP: #d9e0ea 1px solid; BORDER-RIGHT: #d9e0ea 1px solid
}

#picarea {
  MARGIN: 0px auto; WIDTH: 350px; BACKGROUND: #fff; HEIGHT: 445px
}
#bigpicarea {
  POSITION: relative; MARGIN: 0px auto; WIDTH: 350px; HEIGHT: 350px; OVERFLOW: hidden
}
.image {
  TEXT-ALIGN: center
}
.image IMG {
  BORDER-BOTTOM: #ececec 1px solid; BORDER-LEFT: #ececec 1px solid; MARGIN: 0px auto; BORDER-TOP: #ececec 1px solid; BORDER-RIGHT: #ececec 1px solid
}
#bigpicarea .ui-els-hide {
  DISPLAY: none
}
#thumbs {
  LIST-STYLE-TYPE: none; MARGIN: 0px auto; WIDTH: 350px; HEIGHT: 110px
}
* HTML #thumbs {
  HEIGHT: 100%
}
#thumbs LI {
  MARGIN-left: 2px; WIDTH: 65px; DISPLAY: inline; FLOAT: left; HEIGHT: 60px
}
#thumbs UL {
  MARGIN-TOP: 3px
}
#thumbs LI.last_img {
  MARGIN-RIGHT: 4px
}
#thumbs LI.first {
  MARGIN: 25px 10px 0px 15px; WIDTH: 9px; HEIGHT: 16px; CURSOR: pointer
}
#thumbs LI.last {
  MARGIN: 25px 10px 0px 15px; WIDTH: 9px; HEIGHT: 16px; CURSOR: pointer
}
#thumbs LI A {
  BORDER-BOTTOM: #fff 2px solid; BORDER-LEFT: #fff 2px solid; WIDTH: 65px; DISPLAY: block; FONT-SIZE: 0px; BORDER-TOP: #fff 2px solid; BORDER-RIGHT: #fff 2px solid
}
#thumbs LI A:hover {
  BORDER-BOTTOM: #000 2px solid; BORDER-LEFT: #000 2px solid; BORDER-TOP: #000 2px solid; BORDER-RIGHT: #000 2px solid
}
#thumbs LI A.current {
  BORDER-BOTTOM: #f8ae0f 2px solid; BORDER-LEFT: #f8ae0f 2px solid; BORDER-TOP: #f8ae0f 2px solid; BORDER-RIGHT: #f8ae0f 2px solid
}
#thumbs LI.first IMG {
  
}
#thumbs LI.last IMG {
  
}
.bigbtnPrev {
  Z-INDEX: 100; POSITION: absolute; WIDTH: 35px; HEIGHT: 51px; TOP: 186px; CURSOR: pointer; LEFT: 30px
}
.bigbtnNext {
  Z-INDEX: 100; POSITION: absolute; WIDTH: 35px; HEIGHT: 51px; TOP: 186px; CURSOR: pointer; RIGHT: 30px
}

#smallpicarea {
  MARGIN: 0px auto; WIDTH: 350x; BORDER-TOP: #ececec 1px solid; PADDING-TOP: 5px
}

    .recommend_icon {
    width: 50px;
    height: 21px;
    position: absolute;
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
    background: url(/themes/simpleboot3/public/assets/images/sicon.png) no-repeat;
    -webkit-transition: all .3s ease;
    transition: all .3s ease;
    height: 21px;
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
<script type="text/javascript">
  

    var audio, isPlaying=false;
  // var audioClearInterval = 0;
  var totalPlayTime = 0;
  initAudio();

  function initAudio(){
    audio = new Audio();
    
    
    audio.addEventListener("pause",
        function() { //监听暂停
          isPlaying = false;
          // clearInterval(audioClearInterval)
          console.log('111');
          $("#spanTime").text(totalPlayTime);
          audio.pause();
        }, false);
    audio.addEventListener("play",
        function() { //监听暂停
          if(!isPlaying){
            // console.info("暂停了");
              // clearInterval(audioClearInterval)
              $("#spanTime").text(totalPlayTime)
              console.log('222');
              audio.pause();
            }
        }, false);
    audio.addEventListener("ended", function() {
      isPlaying = false;
      $("#spanTime").text(totalPlayTime)
      console.log('333');
    }, false);

  }
  function formatTime(mp3){
    if(mp3 < 10){
      mp3 = '00:0'+mp3; 
    }else if(mp3 > 9 && mp3 < 60){
      mp3 = '00:'+mp3;
    }
    return mp3;
  }

  function playAudio(that) {

  // console.info(audioClearInterval);
  if(isPlaying){
    // clearInterval(audioClearInterval);
    audio.pause();
    isPlaying = false;
  }
  else{
    // var audio = new Audio($(that).attr("data-music"));
    audio.src = $(that).attr("data-music");
    var durationSpan = $(that).find("span");
    
    if(isPlaying){
      isPlaying = false
    }
    else{
      isPlaying = true; 
    }
    
    audio.addEventListener('canplay',function(){
      var mp3 = Math.ceil(this.duration);
      durationSpan.text(mp3/*formatTime(mp3)*/);
      // audio.play();

      var duration = mp3;
      totalPlayTime = mp3;
      var audioClearInterval = setInterval(function(){
        if(!isPlaying){
          clearInterval(audioClearInterval);
          return;
        }
        duration = duration-1;
        if(duration<0){
          // clearInterval(audioClearInterval)
          return;
        }
        durationSpan.text(duration);
      },1000)
    });
    audio.play();
  }
  
}

</script></head>
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
<main id="employeeDetails" style="background: #f7f7f7 url(<?php echo cmf_get_image_url($pw['bgimg']); ?>) top/100% auto no-repeat;">
	<div class="limit-wrap">
		<!-- 头部 -->
		<div class="header fl">
			<div class="baseInfo fl">
				<div class="img fl" style="position: relative;"><img src="<?php echo cmf_get_image_url($pw['avatar']); ?>" width="80px">
          </div>
				<div class="txt fl">
					<div class="item">
						<div class="title">陪玩昵称：</div>
						<div class="val"><?php echo $pw['user_login']; if($pw['sex'] == '2'): ?>
							<i class="icon icon-female"></i>
							<?php else: ?>
              <i class="icon icon-male"></i>
              <?php endif; ?>
              <i class="level icon icon-level-<?php echo $pw['level']; ?>"></i>
              <?php if($pw['renzheng'] == '1'): ?><img src="/themes/simpleboot3/public/assets/images/immortal.png"><?php endif; ?>
							</div>
					</div>
					<div class="item">
						<div class="title">陪玩标签：</div>
						<div class="val">
							<span class="label">							
								<?php if(is_array($pw['gexing']) || $pw['gexing'] instanceof \think\Collection || $pw['gexing'] instanceof \think\Paginator): $i = 0; $__LIST__ = $pw['gexing'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><span class="single" style="color: #b762ff; border-color: #b762ff;"><?php echo $vo; ?></span><?php endforeach; endif; else: echo "" ;endif; ?>															
							</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="fasterBtn fr">
				<div class="top">
					<a href="<?php echo url('portal/detail/like'); ?>"
                           class="js-favorite-btn like"
                           data-table="portal_post"
                           data-id="<?php echo $pw['id']; ?>"><i class="icon icon-like2"></i>关注<span class="sum" v-text="follow_num"><?php echo $pw['guanzhu']; ?></span></a>
					
				</div>
				<div class="bottom">
					<a class="location"><i class="icon icon-location-2"></i><?php echo $pw['sheng']; ?>-<?php echo $pw['shi']; ?>-<?php echo $pw['qu']; ?></a>
				</div>
			</div>
		</div>
		<!-- 头部 end -->
		<div class="leftWrap fl">
			<!--照片预览-->
 			
			<div style="HEIGHT: 445px; PADDING-TOP: 0px" class="wrap picshow"><!--大图轮换区-->
<div id=picarea>
<div style="MARGIN: 0px auto; WIDTH: 350px; HEIGHT: 350px; OVERFLOW: hidden">
<div style="MARGIN: 0px auto; WIDTH: 350px; HEIGHT: 350px; OVERFLOW: hidden" id=bigpicarea >
<?php if(is_array($pw['imgs']) || $pw['imgs'] instanceof \think\Collection || $pw['imgs'] instanceof \think\Paginator): $i = 0; $__LIST__ = $pw['imgs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
<div id=image_xixi-0<?php echo $i; ?> class=image><a href="javascript:parent.imagePreviewDialog('<?php echo cmf_get_image_preview_url($vo); ?>');">
<img alt="" src="<?php echo cmf_get_image_url($vo); ?>" width=350 height=350></a>
<div class=word><h3></h3></div></div>
<?php endforeach; endif; else: echo "" ;endif; ?>
</div></div>
<div id=smallpicarea >
<div id=thumbs>
<ul>
  <?php if(is_array($pw['imgs']) || $pw['imgs'] instanceof \think\Collection || $pw['imgs'] instanceof \think\Paginator): $i = 0; $__LIST__ = $pw['imgs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
  <li class=slideshowItem><a id=thumb_xixi-0<?php echo $i; ?> href="#"><img src="<?php echo cmf_get_image_url($vo); ?>" width=60 height=60></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?>
</ul></div></div></div>
<SCRIPT>
var target = ["xixi-01","xixi-02","xixi-03","xixi-04","xixi-05","xixi-06","xixi-07"];
</SCRIPT>
</div>

			<!--照片预览 end-->
			<!--礼物2-->
			<div class="gift2">
        <div class="title"><i class="icon icon-gift2"></i>礼物</div> 
        <div class="list clearfix">
          <?php if(is_array($gift) || $gift instanceof \think\Collection || $gift instanceof \think\Paginator): $i = 0; $__LIST__ = $gift;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
          <div data_id="<?php echo $vo['id']; ?>" class="single fl"><i class="icon" style="background-image: url(<?php echo cmf_get_image_url($vo['image']);; ?>);height: 32px;width: 32px;"></i> 
            <div class="bubble clearfix"><div class="goods fl"><i class="icon" style="background-image: url(<?php echo cmf_get_image_url($vo['image']);; ?>);height: 32px;width: 32px;"></i> <div class="name"><?php echo $vo['name']; ?></div></div> <div class="introduce fr"><div class="price">￥<?php echo $vo['price']; ?></div> <div class="charm">获取魅力值：<?php echo $vo['charm']; ?></div></div></div></div>
          <?php endforeach; endif; else: echo "" ;endif; ?>
      </div> 
        <form class="js-ajax-form" action="/portal/detail/give" method="post">
          <input type="hidden" name="pw_id" value="<?php echo $pw['id']; ?>">
        <div class="give">
          <div class="goods"><input name="id" type="hidden" value="<?php echo $gift['0']['id']; ?>"><i class="icon" style="background-image: url(<?php echo cmf_get_image_url($gift['0']['image']);; ?>);height: 32px;width: 32px;"></i><span class="name"><?php echo $gift['0']['name']; ?></span></div> <div class="stepper clearfix"><div class="reduce fl">-</div> <input type="text" name="num" class="sum fl" value="1"> <div class="add fl">+</div></div> <button class="btn js-ajax-submit" type="submit">赠送</button></div></form></div>
			<!--礼物2 end-->
			<!-- 守护榜 -->
			<div class="watchList">
				<img class="title" src="/themes/simpleboot3/public/assets/images/watch-list-title.png" alt="">
				<div class="list">
						
                        <?php if(is_array($guards) || $guards instanceof \think\Collection || $guards instanceof \think\Paginator): $i = 0; $__LIST__ = $guards;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <div class="single clearfix">
                                <div class="number fl"><?php echo $i; ?></div>
                                <div class="userIcon fl">
                                    <div class="img">
                                        <img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" alt="">
                                    </div>
                                </div>
                                <div class="rightGroup fr">
									
									<div class="name"><?php echo $vo['user_login']; ?></div>
									
                                    <div class="contribution">贡献值：<span><?php echo $vo['guard']; ?></span></div>
                                </div>
                            </div>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
			</div>
			<!-- 守护榜 end -->
		</div>
		<div class="rightWrap fr">
			<div class="group">
				<!--礼物 -->
				<div class="gift"><dl class="clearfix"><dt><span><i class="icon icon-gift-b"></i>我的礼物</span></dt> 
          <dd>
            <?php if(is_array($mygift) || $mygift instanceof \think\Collection || $mygift instanceof \think\Paginator): $i = 0; $__LIST__ = $mygift;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
          <span><i class="icon" style="background-image: url(<?php echo cmf_get_image_url($vo['image']);; ?>);height: 32px;width: 32px;"></i><div class="sum"><?php echo $vo['num']; ?></div></span>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        </dd></dl></div>
				<!--礼物 end-->
			</div>
			<!--雇佣-->
			 <div class="hire">
   <div class="group1">
    <div class="games">
      <?php if(is_array($jineng) || $jineng instanceof \think\Collection || $jineng instanceof \think\Paginator): $i = 0; $__LIST__ = $jineng;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
     <a href="javascript:void(0)" class="single <?php if($catid == '0'): if($key == '0'): ?>active<?php endif; else: if($vo['cat_id'] == $catid): ?>active<?php endif; endif; ?>"><?php echo $vo['fuwu']; ?></a>
     <?php endforeach; endif; else: echo "" ;endif; ?>
    </div> 
    <div class="order">
     <?php if(is_array($jineng) || $jineng instanceof \think\Collection || $jineng instanceof \think\Paginator): $i = 0; $__LIST__ = $jineng;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
     <section style="display: <?php if($catid == '0'): if($key != '0'): ?>none<?php endif; else: if($vo['cat_id'] != $catid): ?>none<?php endif; endif; ?>;">
      <div class="leftWrap fl">
      <div class="img">
       <img src="<?php echo cmf_get_image_url($vo['pic']); ?>" width="95px" height="95px" />
      </div> 
     </div> 
     <div class="info fl" style="width:260px;overflow:visible;">
      <div class="duration">
       接单时长：
       <span class="val"><?php echo $vo['shichang']; ?></span> 
       <span>小时</span>
      </div> 
      <div class="price">
       ￥
       <span class="val"><?php echo $vo['jiage']; ?></span>/
       <span>小时</span>
      </div> 
      <div class="grading" style="float: left;">
       <?php echo $vo['level']; ?>
      </div>
      <?php if(($vo['dis9'] > 0) OR ($vo['dis8'] > 0) OR ($vo['dis7'] > 0)): ?>
      <div class="discount_show_tab discount_show_tab2" style="float: left; margin-top: 11px;  margin-left: 5px;">
  <div class="discount_show_tab_title">限时折扣 <span class="discount_show_tab_arrow">&gt;</span></div>
  <div class="discount_show_tab_content">
    <?php if($vo['dis9'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $vo['dis9']; ?></span>小时可享受 <span>9</span>折优惠</div><?php endif; if($vo['dis8'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $vo['dis8']; ?></span>小时可享受 <span>8</span>折优惠</div><?php endif; if($vo['dis7'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $vo['dis7']; ?></span>小时可享受 <span>7</span>折优惠</div><?php endif; ?>
    </div>
</div><?php endif; ?>
     </div> 
     <div class="btns fl" style="width: 310px;margin-left: 110px;">
      <?php $user = cmf_get_current_user();if($user){ ?>
     <a href="javascript:void(0)" onclick="test()" class="comm-btn primary J_order">聊一聊</a>
     <?php }else{ ?>
     <a href="/user/login" class="comm-btn primary J_order">聊一聊</a>
     <?php } ?>
     <script>
    function test(){
      layui.use('layim', function(layim){
      layim.chat({
      id: "<?php echo $pw['id']; ?>"
      ,name: '<?php echo $pw['user_login']; ?>'
      ,type: 'friend' //friend、group等字符，如果是group，则创建的是群聊
      ,avatar: '<?php echo cmf_get_image_url($pw['avatar']); ?>'
      });
      });
    }
    </script>

      <a href="<?php echo url('portal/order/index',array('id'=>$vo['id'])); ?>" class="comm-btn primary J_order">立即下单</a>
     </div> 
     </section>
   <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
   </div> 
   <div class="group2">
    <div class="skill">
     <div class="title">
      <i class="dot"></i>个人介绍
     </div> 
     <div class="article">
      <style type="text/css">
    .play_btn_box {
    background-color: #1dd3b8;
    color: #fff;
    width: 100px;
    height: 25px;
    border-radius: 25px;
    font-size: 12px;
    text-align: center;
    line-height: 25px;
    cursor: pointer;
}
.play_btn_box span {
    margin-left: 8px;
    margin-right: 18px;
}
.play_btn_box .play_btn {
    vertical-align: sub;
}
.content_center_right .play_btn_box span {
    margin-left: 8px;
    margin-right: 18px;
}</style>
      <div class="play_btn_box mt15" onclick="playAudio(this)" data-music="<?php echo cmf_get_image_url($pw['yuyin']); ?>"><img src="/themes/simpleboot3/public/assets/images/play_btn.png" class="play_btn"><span id="spanTime"><?php echo $pw['duration']; ?></span><img src="/themes/simpleboot3/public/assets/images/play_audio.png" style="vertical-align: sub;"></div>
      <!-- <div class="audio green-audio-player">
  <div class="loading">
    <div class="spinner"></div>
  </div>
  <div class="play-pause-btn">  
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 16 18">
      <path fill="#566574" fill-rule="evenodd" d="M16 10L0 18V0" class="play-pause-icon" id="playPause"/>
    </svg>
  </div>
  
  <div class="controls">
    <span class="current-time">0:00</span>
  </div>

  
  <audio crossorigin>
    <source src="<?php echo cmf_get_image_url($pw['yuyin']); ?>" type="audio/mpeg">
  </audio>
</div> -->
       <?php echo $pw['jieshao']; ?>
    </div> 
    <div class="appraisal">
     <div class="title">
      <div class="txt">
       <i class="dot"></i>用户评价
      </div>
     </div> 
     <div class="list">
      <?php if(is_array($pingjia) || $pingjia instanceof \think\Collection || $pingjia instanceof \think\Paginator): $i = 0; $__LIST__ = $pingjia;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
      <div class="single fl">
       <div class="img fl">
        <img src="<?php echo cmf_get_image_url($vo['avatar']); ?>"/>
       </div> 
       <div class="info fl">
        <div class="top">
         <div class="nickname dib">
          <?php echo mb_substr($vo['user_login'],0,1,'utf-8'); ?>*****
         </div> 
         <div class="time dib">
          <?php echo date('Y-m-d H:i:s',$vo['create_time']); ?>
         </div>
        </div> 
        <div class="label">
         <?php echo $vo['content']; ?>
        </div>
       </div> 
       <div class="star fr">
        <span data-v-1aa5814a="" class="stars">
          <?php 
          for($i=0;$i<$vo['rank'];$i++)
          {  
            echo '<i data-v-1aa5814a="" class="icon fa fa-star"></i>';
          } 
          for($i=0;$i<(5-$vo['rank']);$i++)
          {  
            echo '<i data-v-1aa5814a="" class="icon fa fa-star-o"></i>';
          } 
         ?>
</span>
       </div>
      </div>
      <?php endforeach; endif; else: echo "" ;endif; ?>
     </div> 
     <div class="load">
      <div class="pagination"><?php echo $page; ?></div>
     </div>
    </div>
   </div>
  </div>
			<!--雇佣 end-->
		</div>
	</div>

</div>
</main>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>LayIM 3.x PC版本地演示</title>

<link rel="stylesheet" href="/im/css/layui.css">
<style>
html{background-color: #333;}
</style>
</head>
<body>


<script src="/im/layui.js"></script>
<script>

if(!/^http(s*):\/\//.test(location.href)){
  alert('请部署到localhost上查看该演示');
}

layui.use('layim', function(layim){
  

  //基础配置
  layim.config({

  init: {
      //我的信息
      mine: {
        "username": "<?php echo \think\Session::get('user.user_login'); ?> " //我的昵称
        ,"id": '<?php echo \think\Session::get('user.id'); ?>' //我的ID
        ,"avatar": "/upload/<?php echo \think\Session::get('user.avatar'); ?>" //我的头像
        ,"remark": "<?php echo \think\Session::get('user.jieshao'); ?>"
    ,"status":"online"
      }
      //我的好友列表
      ,friend: <?php cmf_heimao(); ?>
    }
    

    
    //上传图片接口
    ,uploadImage: {
      url: '/wap/index/upimage.html' //（返回的数据格式见下文）
      ,type: '' //默认post
    } 
    
    //上传文件接口
    ,uploadFile: {
      url: '/upload/file' //（返回的数据格式见下文）
      ,type: '' //默认post
    }

    
    //扩展工具栏
    ,tool: []
    
    //brief: true //是否简约模式（若开启则不显示主面板）
    
    ,title: '最近联系人' //自定义主面板最小化时的标题
    //,right: '100px' //主面板相对浏览器右侧距离
    //,minRight: '90px' //聊天面板最小化时相对浏览器右侧距离
    ,initSkin: '6.jpg' //1-5 设置初始背景
    //,skin: ['aaa.jpg'] //新增皮肤
    //,isfriend: false //是否开启好友
    ,isgroup: false //是否开启群组
    ,min: true //是否始终最小化主面板，默认false
    ,notice: true //是否开启桌面消息提醒，默认false
    //,voice: false //声音提醒，默认开启，声音文件为：default.mp3
    ,isAudio:false
  ,isVideo:false
  ,copyright:false
    
  });


  //监听在线状态的切换事件
  layim.on('online', function(data){
    //console.log(data);
  });
  
  //监听签名修改
  layim.on('sign', function(value){
    //console.log(value);
  });

  //监听自定义工具栏点击，以添加代码为例
  layim.on('tool(code)', function(insert){
    layer.prompt({
      title: '插入代码'
      ,formType: 2
      ,shade: 0
    }, function(text, index){
      layer.close(index);
      insert('[pre class=layui-code]' + text + '[/pre]'); //将内容插入到编辑器
    });
  });
  
  //监听layim建立就绪
  layim.on('ready', function(res){

  });

var socket = new WebSocket('wss://peiwan.wdzxiu.com:8282');
  //连接成功时触发
  socket.onopen = function(){
    // 登录
    var id='<?php echo \think\Session::get('user.id'); ?>';
      var username='<?php echo \think\Session::get('user.user_login'); ?>';
      var avatar='/upload/<?php echo \think\Session::get('user.avatar'); ?>';
      var sign='<?php echo \think\Session::get('user.jieshao'); ?>';
      var lang='<?php echo \think\Session::get('user.lang'); ?>';
      var login_data = '{"type":"init","id":"'+id+'","username":"'+username+'","avatar":"'+avatar+'","sign":"'+sign+'","lang":"'+lang+'"}';
      socket.send( login_data );
      
      console.log("websocket握手成功!");
      
  };
  socket.onmessage = function(e){
    var data=eval("("+e.data+")");
    console.log(data);
      var type = data.type || '';
        switch(type){
            // 服务端ping客户端
            case 'ping':
              socket.send('{"type":"ping"}');
                break;
            // 登录 更新用户列表
            case 'init':
        if(data['id']=='' || data['id']==null){
          //console.log("");
        }else{
                  console.log(data['id']+"登录成功");
        }
                break;
            //添加 用户
            case 'addUser':
                //console.log(data.data);
                layim.addList(data.data);
                break;
            //删除 用户
            case 'delUser':
                layim.removeList({
                    type: 'friend'
                    ,id: data.data.id //好友或者群组ID
                });
                break;
      // 添加 分组信息
            case 'addGroup':
               // console.log(data.data);
                layim.addList(data.data);
                break;
            case 'delGroup':
                layim.removeList({
                    type: 'group'
                    ,id: data.data.id //好友或者群组ID
                });
                break;
            // 检测聊天数据
            case 'chatMessage':
              //console.log(data.data);
        var  data=data.data;
        var mine=data.mine;
        var to=data.to;
        var type=data.type;
        layim.getMessage(data); 
                break;
            // 离线消息推送
            case 'logMessage':
              
              setTimeout(function(){layim.getMessage(data.data)}, 1000);
                break;
             //用户接收好友请求信息
            case 'addfriend':
        //addFriend: function(data){
          var user = data;
          layim.setFriendGroup({
          type: user.type
          ,username: user.username
          ,avatar: user.avatar
          ,group: layim.cache().friend //获取好友列表数据
          ,submit: function(group, index){
            //一般在此执行Ajax和WS，以通知对方已经同意申请
            //……
            //同意后，将好友追加到主面板
            layim.addList({
            type: user.type
            ,username: user.username
            ,avatar: user.avatar
            ,groupid: group //所在的分组id
            ,id: user.id //好友ID
            ,sign: user.sign //好友签名
            });
            
            layer.close(index);
          }
          });
        //}
              break;
            //聊天还有不在线
            case 'ctUserOutline':
              //console.log('11111');
              //layer.msg(data.data.to_username+data.data.msg, {'time' : 1000});
        //layim.setChatStatus('<span style="color:#FF5722;">'+data.data.msg+'</span>');
              break;
        }
  };
  layim.on('sendMessage', function(res){
  console.log(res);
          var mine = res.mine;
          var to = res.to;
      if(to.type === 'friend'){
        //layim.setChatStatus('<span style="color:#FF5722;">对方正在输入。。。</span>');
      }
      socket.send(JSON.stringify({
        type: 'chatMessage' //随便定义，用于在服务端区分消息类型
        ,data: res
        }));
  
      });
  


});
</script>
</body>
</html>

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
  $(function(){
    index = {};
    $('.games a').on('click',function(){
        var pos = $(this).index();
        var display =$('section').eq(pos).css('display');
        if(display == 'none'){
            $('section').eq(pos).show().siblings('section').hide();
            $('.games a').eq(pos).addClass('active').siblings('a').removeClass('active');
        }
    });
});
  $('.gift2 .single').click(function(){
        $('.give').html("");
        var data_id=0;
        data_id=$(this).attr("data_id") ;
        $.ajax({
            type:"get",
            data:{id:data_id},
            url:"/portal/detail/liwu",
            success:function(e){
                console.log(e);
                $.each(e, function(no, items) {
                   $('.give').append('<div class="goods"><input name="id" type="hidden" value="'+ items.id +'"><i class="icon" style="background-image: url(/upload/'+ items.image +');height: 32px;width: 32px;"></i><span class="name">'+ items.name +'</span></div> <div class="stepper clearfix"><div class="reduce fl">-</div> <input type="text" name="num" class="sum fl" value="1"> <div class="add fl">+</div></div> <button class="btn js-ajax-submit" type="submit">赠送</button>');    
                });

            }
        });
    })
    $(".give").on("click",".reduce",function(){
       var $num=$(this).parent().find("input");
    var num=parseInt($num.val());
    var btype=$(this).attr("name");
        num--;
        if(num<1){
            num=1;
        }
        $num.val(num);
    })
    $(".give").on("click",".add",function(){
       var $num=$(this).parent().find("input");
    var num=parseInt($num.val());
    var btype=$(this).attr("name");
        num++;
        if(num>30){
            num=30
        }
        $num.val(num);
    })
</script>

<script type="text/javascript">
  var timer = null;
var offset = 5000;
var index = 0;

function slideImage(i){
    var id = 'image_'+ target[i];
    $('#'+ id)
        .animate({opacity: 1}, 800, function(){
            $(this).find('.word').animate({height: 'show'}, 'slow');
        }).show()
        .siblings(':visible')
        .find('.word').animate({height: 'hide'},'fast',function(){
            $(this).parent().animate({opacity: 0}, 800).hide();
        });
}
//bind thumb a
function hookThumb(){    
    $('#thumbs li a')
        .bind('click', function(){
            if (timer) {
                clearTimeout(timer);
            }                
            var id = this.id;            
            index = getIndex(id.substr(6));
            rechange(index);
            slideImage(index); 
            timer = window.setTimeout(auto, offset);  
            this.blur();            
            return false;
        });
}
//bind next/prev img
function hookBtn(){
    $('#thumbs li img').filter('#play_prev,#play_next')
        .bind('click', function(){
            if (timer){
                clearTimeout(timer);
            }
            var id = this.id;
            if (id == 'play_prev') {
                index--;
                if (index < 0) index = 2;
            }else{
                index++;
                if (index > 2) index = 0;
            }
            rechange(index);
            slideImage(index);
            timer = window.setTimeout(auto, offset);
        });
}



//get index
function getIndex(v){
    for(var i=0; i < target.length; i++){
        if (target[i] == v) return i;
    }
}
function rechange(loop){
    var id = 'thumb_'+ target[loop];
    $('#thumbs li a.current').removeClass('current');
    $('#'+ id).addClass('current');
}
function auto(){
    index++;
    if (index > 2){
        index = 0;
    }
    rechange(index);
    slideImage(index);
    timer = window.setTimeout(auto, offset);
}
$(function(){    
    //change opacity
    $('div.word').css({opacity: 0.85});
    auto();  
    hookThumb(); 
    hookBtn();
    
});
function imagePreviewDialog(img) {
    Wind.css('layer');

    Wind.use("layer", function () {
        layer.photos({
            photos: {
                "title": "", //鐩稿唽鏍囬
                "id": 'image_preview', //鐩稿唽id
                "start": 0, //鍒濆鏄剧ず鐨勫浘鐗囧簭鍙凤紝榛樿0
                "data": [   //鐩稿唽鍖呭惈鐨勫浘鐗囷紝鏁扮粍鏍煎紡
                    {
                        "alt": "",
                        "pid": 666, //鍥剧墖id
                        "src": img, //鍘熷浘鍦板潃
                        "thumb": img //缂╃暐鍥惧湴鍧€
                    }
                ]
            } //鏍煎紡瑙丄PI鏂囨。鎵嬪唽椤�
            , anim: 5, //0-6鐨勯€夋嫨锛屾寚瀹氬脊鍑哄浘鐗囧姩鐢荤被鍨嬶紝榛樿闅忔満
            shadeClose: true,
            // skin: 'layui-layer-nobg',
            shade: [0.5, '#000000'],
            shadeClose: true,
        })
    });
}</script>
</body>
</html>