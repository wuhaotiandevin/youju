<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:34:"themes/simpleboot3/wap\detail.html";i:1574678276;}*/ ?>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
<title><?php echo $pw['user_login']; ?>详情-<?php echo $site_info['site_name']; ?></title>
<link  href="/themes/simpleboot3/public/assets/wap_css/components.css" rel="stylesheet">
<link  href="/themes/simpleboot3/public/assets/wap_css/vendors.css" rel="stylesheet">
<link  href="/themes/simpleboot3/public/assets/wap_css/detail.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
<style type="text/css">
.addWrap{ position:relative; width:100%;background:#fff;margin:0; padding:0;}
.addWrap .swipe{overflow: hidden;visibility: hidden;position:relative;}
.addWrap .swipe-wrap{overflow:hidden;position:relative;}
.addWrap .swipe-wrap > div {float: left;width: 100%;position:relative;}
#position{ position:absolute; bottom:0; right:0; padding-right:8px; margin:0; background:#000; opacity: 0.4; width:100%; filter: alpha(opacity=50);text-align:right;}
#position li{width:10px;height:10px;margin:0 2px;display:inline-block;-webkit-border-radius:5px;border-radius:5px;background-color:#AFAFAF;}
#position li.cur{background-color:#FF0000;}
.img-responsive { display: block; width:100%;height: 100%;}
</style>
</head>
<body>
<div id="app">
  <div  class="mui-container player-detail fixed-container">
  <div  class="mui-header" style="flex: 0 0 50px; z-index: 1;">
  <div class="mui-title" data-v-66ec1953="">
    <div  class="mui-title-content">
    <div >陪玩详情</div>
    </div>
  </div>
  <div class="mui-buttons start" data-v-66ec1953="">
    <span  class="mui-button mui-back-button" ><i class="iconfont icon-fh"></i> </span>
  </div>
  </div>
  <div class="mui-content player-content" data-v-6c09c5aa="">
  <div class="banner" style="overflow: hidden;">
    <div class="addWrap">
  <div class="swipe" id="mySwipe">
    <div class="swipe-wrap">
      <?php if(is_array($pw['imgs']) || $pw['imgs'] instanceof \think\Collection || $pw['imgs'] instanceof \think\Paginator): $i = 0; $__LIST__ = $pw['imgs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
      <div><a href="javascript:;"><img class="img-responsive" src="<?php echo cmf_get_image_url($vo); ?>"/></a></div>
      <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
  </div>
  
  <ul id="position">
    <?php if(is_array($pw['imgs']) || $pw['imgs'] instanceof \think\Collection || $pw['imgs'] instanceof \think\Paginator): $i = 0; $__LIST__ = $pw['imgs'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if($i == '1'): ?>
    <li class="cur"></li>
    <?php else: ?>
    <li></li>
    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
  </ul>
</div>
    </div>
  <div class="wrap">
    <div class="cell-wrap play-info">
    <div class="name fz16"><i class="iconfont icon-<?php if($pw['sex'] == '2'): ?>girl<?php else: ?>boy<?php endif; ?>"></i>
    <div style="height:32px;line-height: 32px;"><?php echo $pw['user_login']; ?></div>
    </div>
    <div class="playing-state fz14">
 
    </div>
    <a href="<?php echo url('wap/detail/like'); ?>"
                           class="js-favorite-btn like"
                           data-table="portal_post"
                           data-id="<?php echo $pw['id']; ?>"><div class="follow fz12"><i class="iconfont icon-heartwsz"></i> 关注<?php echo $pw['guanzhu']; ?> </div></a>
    </div>
    <div class="cell-wrap skills mt10">
    <div class="skill fz16 t-color-1">
    <div><?php echo $pw['cat_name']; if(($pw['dis9'] > 0) OR ($pw['dis8'] > 0) OR ($pw['dis7'] > 0)): ?>
      <div class="discount_show_tab discount_show_tab2" style="margin-left: 5px;">
  <div class="discount_show_tab_title">限时折扣 <span class="discount_show_tab_arrow">&gt;</span></div>
  <div class="discount_show_tab_content">
    <?php if($pw['dis9'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $pw['dis9']; ?></span>小时可享受 <span>9</span>折优惠</div><?php endif; if($pw['dis8'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $pw['dis8']; ?></span>小时可享受 <span>8</span>折优惠</div><?php endif; if($pw['dis7'] > '0'): ?><div class="discount_show_tab_content_item">订单满<span><?php echo $pw['dis7']; ?></span>小时可享受 <span>7</span>折优惠</div><?php endif; ?>
    </div>
</div><?php endif; ?></div>
    <div>
      等级：<?php echo $pw['level']; ?>  |价格：<span class="m-color"><?php echo $pw['jiage']; ?>元/小时</span>
    </div>
    </div>
    <div class="more-skills end">
    <button class="fz16 t-color-2" style="height:72px;line-height: 72px;"> 更多<i class="iconfont icon-fh fz18"></i></button>
    </div>
    </div>
    <div class="cell-wrap description mt10">
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
      <div class="play_btn_box mt15" style="line-height: 25px;" onclick="playAudio(this)" data-music="<?php echo cmf_get_image_url($pw['yuyin']); ?>"><img src="/themes/simpleboot3/public/assets/images/play_btn.png" class="play_btn"><span id="spanTime"><?php echo $pw['duration']; ?></span><img src="/themes/simpleboot3/public/assets/images/play_audio.png" style="vertical-align: sub;"></div>
    <br>
    <?php echo $pw['jieshao']; ?>
    </div>
    <div class="cell-wrap appraisal mt10">
    <header class="fz16">
    <div style="height: 50px;line-height: 50px;">评价 (<?php echo $pingjiacout; ?>)</div>
    </header>
    <?php if(is_array($pingjia) || $pingjia instanceof \think\Collection || $pingjia instanceof \think\Paginator): $i = 0; $__LIST__ = $pingjia;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
    <div class="comment fz16">
    <div class="user">
      <div class="user-pic"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" width="100px" height="100px"></div>
      <div class="user-name"><?php echo mb_substr($vo['user_login'],0,1,'utf-8'); ?>*****</div>
      <div  ></div>
    </div>
    <div class="date-time fz12 t-color-2"> <?php echo date('Y-m-d H:i:s',$vo['create_time']); ?> </div>
    <div class="content"><?php echo $vo['content']; ?></div>
    </div>
    <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
  </div>
  </div>
  <footer>
    <span class="gifts" style="width:100%;color: #fff;border-top: 1px solid #5aaefd;background-color: #5aaefd;text-align: center;line-height: 50px;">送礼物</span>
    <a href="<?php echo url('/wap/index/chat',array('id'=>$pw['id'])); ?>" style="width:100%;color: #000;border-top: 1px solid #fff;background-color: #fff;text-align: center;line-height: 50px;">聊一聊</a>
  <a href="<?php echo url('wap/order/index',array('id'=>$pw['jn_id'])); ?>" style="width:100%;color: #fff;border-top: 1px solid #ff6a45;background-color: #ff6a45;text-align: center;line-height: 50px;">下单</a>
  </footer>
  <div   class="mui-slide-panel" style="display: none;">
  <div  class="overlay" style="display: none;"></div>
  <div  class="mui-slide-content" style="display: none;">
    <div class="mui-content">
    <div class="filter-conditions">
    <h3>服务技能</h3>
    <div class="filter-conditions-wrap">
      <?php if(is_array($jineng) || $jineng instanceof \think\Collection || $jineng instanceof \think\Paginator): $i = 0; $__LIST__ = $jineng;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
      <label  class="mui-filter-button" >
      <input type="radio" value="<?php echo $vo['cat_id']; ?>" name="catid">
      <span><i class="iconfont icon-gx"></i> <?php echo $vo['cat_name']; ?> </span></label>
      <?php endforeach; endif; else: echo "" ;endif; ?>
      <div class="space-evenly-fix" style="width: 100px; margin: 5px;"></div>
      <div class="space-evenly-fix" style="width: 100px; margin: 5px;"></div>
    </div>
    </div>
    </div>
    <div  class="buttons fz17">
    <button id="button">确认</button>
    </div>
  </div>
  </div>

  <div class="gift-giving-slide" style="display: none;position: fixed;width: 100%;height: 100%;z-index: 1;margin-bottom: 0px;">
  <div  class="overlay1"></div>  
  <div class="gift-giving-slide__header">
    <h4 class="gift-giving-slide__title">赠送礼物</h4>
  </div>
  <div class="gift-giving-slide__content">
    <div class="cube-slide">
          <ul class="gift-chunk-list">
            <?php if(is_array($gift) || $gift instanceof \think\Collection || $gift instanceof \think\Paginator): $i = 0; $__LIST__ = $gift;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <li class="gift-chunk-list__item">
              <div class="gift-chunk-list__card" data_id="<?php echo $vo['id']; ?>"><img src="<?php echo cmf_get_image_url($vo['image']); ?>" alt="" class="gift-img">
                <p class="gift-title"><?php echo $vo['name']; ?></p>
                <p class="gift-price">￥<?php echo $vo['price']; ?></p>
              </div>
            </li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </ul>
      
    </div>
  </div>
  <form class="js-ajax-form" action="/wap/detail/give" method="post">
  <div class="gift-giving-slide__footer">
      <input type="hidden" name="pw_id" value="<?php echo $pw['id']; ?>">
      <input type="hidden" name="gift_id" value="0">
    <button class="btn-give js-ajax-submit" type="submit">赠送</button>
  </div>
</form>
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
<script type="text/javascript"  src="/themes/simpleboot3/public/assets/wap_js/common.js"></script>
<script type="text/javascript"  src="/themes/simpleboot3/public/assets/wap_js/index.js"></script>
<script src="/themes/simpleboot3/public/assets/wap_js/hhSwipe.js"></script>
<script type="text/javascript">
var bullets = document.getElementById('position').getElementsByTagName('li');

var banner = Swipe(document.getElementById('mySwipe'), {
  auto: 4000,
  continuous: true,
  disableScroll:false,
  callback: function(pos) {
    var i = bullets.length;
    while (i--) {
      bullets[i].className = ' ';
    }
    bullets[pos].className = 'cur';
  }
})
</script>
<script type="text/javascript">
      $(document).on('click', '.end', function() {
                    $(".mui-slide-panel").css("display", "")
                    $(".overlay").css("display", "")
                    $(".mui-slide-content").css("display", "")
      })
      $(document).on('click', '.overlay', function() {
                    $(".mui-slide-panel").css("display", "none")
                    $(".overlay").css("display", "none")
                    $(".mui-slide-content").css("display", "none")
      })
      $('#button').click(function(){
        var id=<?php echo $pw['id']; ?>;
        var catid = $("input[name='catid']:checked").attr('value');
        thisURL='/wap/detail/index?id='+ id +'&catid='+ catid;
        window.location.href=thisURL;
      })
      $(document).on('click', '.gifts', function() {
                    $(".gift-giving-slide").css("display", "")
      })
      $(document).on('click', '.overlay1', function() {
                    $(".gift-giving-slide").css("display", "none")
      })
      $(document).on('click', '.gift-chunk-list li .gift-chunk-list__card', function() {
                  data_id=$(this).attr("data_id") ;
                  $("input[name='gift_id']").val(data_id)
                  $(".gift-chunk-list li .gift-chunk-list__card").removeClass("active");
                  $(this).addClass("active");

                })
</script>
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

</script>
</body>
</html>