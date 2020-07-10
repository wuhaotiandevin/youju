<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:34:"themes/simpleboot3/wap\\index.html";i:1574678276;}*/ ?>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
<title><?php echo $site_info['site_name']; ?></title>
<link  href="/themes/simpleboot3/public/assets/wap_css/components.css" rel="stylesheet">
<link  href="/themes/simpleboot3/public/assets/wap_css/vendors.css" rel="stylesheet">
<link href="/themes/simpleboot3/public/assets/wap_css/ranks.css" rel="stylesheet">
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
<script src="/themes/simpleboot3/public/assets/wap_js/tab.js"></script>
<style type="text/css">
.addWrap{ position:relative; width:100%;background:#fff;margin:0; padding:0;}
.addWrap .swipe{overflow: hidden;visibility: hidden;position:relative;}
.addWrap .swipe-wrap{overflow:hidden;position:relative;}
.addWrap .swipe-wrap > div {float: left;width: 100%;position:relative;}
#position{ position:absolute; bottom:0; right:0; padding-right:8px; margin:0; background:#000; opacity: 0.4; width:100%; filter: alpha(opacity=50);text-align:right;}
#position li{width:10px;height:10px;margin:0 2px;display:inline-block;-webkit-border-radius:5px;border-radius:5px;background-color:#AFAFAF;}
#position li.cur{background-color:#FF0000;}
.img-responsive { display: block; width:100%;}
.ul1{list-style: none;margin: 0}
    li{padding: 5px;}
</style>
</head>
<body>
<div id="app">
  <div   class="app">
    <div   class="mui-container">
      <div  class="mui-content" >
        <div id="index"  class="index">
          <div style="padding: 10px;">
<div style="height:26px;line-height:26px;float: left;width:44px;color: #aaa;">公告:</div>
  <div style="position: relative;height: 26px;align-items: center;overflow: hidden;float: left;width: 85%;">
    <ul class="ul1">
      <?php if(is_array($gonggao) || $gonggao instanceof \think\Collection || $gonggao instanceof \think\Paginator): $i = 0; $__LIST__ = $gonggao;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
      <li><a href="<?php echo cmf_url('/wap/index/article',array('id'=>$vo['id'])); ?>"><?php echo $vo['post_title']; ?></a></li>
      <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
  </div>
</div>
<script type="text/javascript">
  $(function(){
    var num=$(".ul1").find("li").length;
    console.log("直接运行"+num);
    if (num>1) {
      setInterval(function(){ 
      $('.ul1').animate({
        marginTop:"-26px"
      },500,function(){
        $(this).css({marginTop : "0"}).find("li:first").appendTo(this);
      });
    }, 3000);
    }
         
  });
</script>
          <div class="addWrap">
  <div class="swipe" id="mySwipe">
    <div class="swipe-wrap">
      <?php if(is_array($slides) || $slides instanceof \think\Collection || $slides instanceof \think\Paginator): $i = 0; $__LIST__ = $slides;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
      <div><a href="javascript:;"><img class="img-responsive" src="<?php echo cmf_get_image_url($vo['image']); ?>" width="100%;" /></a></div>
      <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
  </div>
  
  <ul id="position">
    <?php if(is_array($slides) || $slides instanceof \think\Collection || $slides instanceof \think\Paginator): $i = 0; $__LIST__ = $slides;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if($i == '1'): ?>
    <li class="cur"></li>
    <?php else: ?>
    <li></li>
    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
  </ul>
</div>
          <div style="background-color: #fff;padding-top: 5px;padding-bottom: 5px;">
          <div class="search-bar"><input  placeholder="搜索大神昵称" type="text" class="search-bar-input"> 
            <div  class="btn-search"><i class="image-icon image-icon-search"></i></div></div>
          </div>
          <div  class="games">
            <?php if(is_array($leimu) || $leimu instanceof \think\Collection || $leimu instanceof \think\Paginator): $i = 0; $__LIST__ = $leimu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <a href="<?php echo cmf_url('/wap/search/index',array('catid'=>$vo['id'])); ?>"  class="" ><span><img src="<?php echo cmf_get_image_url($vo['img_f']); ?>" alt=""></span> <?php echo $vo['cat_name']; ?> </a> 
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <a href="<?php echo cmf_url('/wap/search/search'); ?>"  class="" ><span><i class="iconfont icon-gdfw"></i></span> 更多服务 </a></div>
            <div style="background-color: #fff;padding-top: 5px;padding-bottom: 5px;">
            <a href="/wap/index/ranks"><div class="search-bar" style="border-radius: 8px;"><b>排行榜</b><button  class="btn-phb">></button></div></a>
          </div>
          <div  class="platform">
            <h3 style="margin-left: 5px;">大神推荐<a href="/wap/search/search/tuijian/1"><button style="font-size: 18px;font-weight: 700;float: right;margin-right: 5px;">&gt;</button></a></h3>
            <div  class="accompany-list">
                <?php if(is_array($tuijian) || $tuijian instanceof \think\Collection || $tuijian instanceof \think\Paginator): $i = 0; $__LIST__ = $tuijian;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
              <div class="accompany" >
                <a href="<?php echo cmf_url('/wap/detail/index',array('id'=>$vo['id'])); ?>">
                <div class="user-pic"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" width="200px" height="200px"></div>
                <p><span class="user-name"><?php echo $vo['user_login']; ?></span> </p>
                <p><span><?php echo $vo['leimu']; ?></span><span class="user-price"><?php echo $vo['jiage']; ?>元/小时</span></p>
               </a>
              </div>
              <?php endforeach; endif; else: echo "" ;endif; ?>
              
            </div>
          </div>
          <div  class="platform">
            <h3 style="margin-left:5px;">最新入驻<a href="/wap/search/search"><button style="font-size: 18px;font-weight: 700;float: right;margin-right: 5px;">&gt;</button></a></h3>
            <div  class="accompany-list">
                <?php if(is_array($xinren) || $xinren instanceof \think\Collection || $xinren instanceof \think\Paginator): $i = 0; $__LIST__ = $xinren;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
              <div class="accompany" style="width: 30%;height: 150px;">
                <a href="<?php echo cmf_url('/wap/detail/index',array('id'=>$vo['id'])); ?>">
                <div class="user-pic" style="height: 110px;"><img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" style="width:100px;height:100px;border-radius: 100px;"></div>
                <p style="text-align: center;"><?php echo $vo['user_login']; ?> </p>
               </a>
              </div>
              <?php endforeach; endif; else: echo "" ;endif; ?>
              
            </div>
          </div>
          
                <div class="aui-tab" data-ydui-tab>
                    <ul class="tab-nav b-line">
                      <?php if(is_array($peiwanshi) || $peiwanshi instanceof \think\Collection || $peiwanshi instanceof \think\Paginator): $i = 0; $__LIST__ = $peiwanshi;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <li class="tab-nav-item <?php if($i == '1'): ?>tab-active<?php endif; ?>" style="width: 25%">
                            <a href="javascript:;">
                                <span><?php echo $vo['cat_name']; ?></span>
                            </a>
                        </li>
                      <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                    <div class="tab-panel">
                      <?php if(is_array($peiwanshi) || $peiwanshi instanceof \think\Collection || $peiwanshi instanceof \think\Paginator): $i = 0; $__LIST__ = $peiwanshi;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <div class="tab-panel-item <?php if($i == '1'): ?>tab-active<?php endif; ?>">
                          <div  class="platform">
            <div  class="accompany-list">
                <?php if(is_array($vo['peiwan']) || $vo['peiwan'] instanceof \think\Collection || $vo['peiwan'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['peiwan'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($i % 2 );++$i;?>
              <div class="accompany" >
                <a href="<?php echo cmf_url('/wap/detail/index',array('id'=>$vo1['id'],'catid'=>$vo['id'])); ?>">
                <div class="user-pic"><img src="<?php echo cmf_get_image_url($vo1['avatar']); ?>" width="200px" height="200px"></div>
                <p><span class="user-name"><?php echo $vo1['user_login']; ?></span> </p>
                <p><span class="user-price"><?php echo $vo1['jiage']; ?>元/小时</span> <span><?php echo $vo1['sheng']; ?></span></p>
               </a>
              </div>
              <?php endforeach; endif; else: echo "" ;endif; ?>
              
            </div>
          </div>
        </div>
      <?php endforeach; endif; else: echo "" ;endif; ?>
      </div>
</div>
                    
        </div>
      </div>
    </div>
    <footer ><a   href="<?php echo cmf_url('/wap/index/index'); ?>"  class="router-link-exact-active active"><i   class="iconfont icon-sy"></i> <i   class="iconfont icon-syxz"></i> 首页 </a> 
       <a   href="<?php echo cmf_url('/wap/index/chat'); ?>"  class=""><i   class="iconfont icon-dd"></i> <i   class="iconfont icon-ddxz"></i> 消息 </a> 
       <a   href="<?php echo cmf_url('/wap/user/index'); ?>"  class=""><i   class="iconfont icon-mine"></i> <i   class="iconfont icon-minexz"></i> 我的 </a>
    </footer>
  </div>
  <!---->
</div>
<script type="text/javascript">
  $('.btn-search').click(function(){
        var keyword = $(".search-bar-input").val();
        thisURL='/wap/search/search?keyword='+keyword;
        window.location.href=thisURL;
    })
</script>
<script type="text/javascript"  src="/themes/simpleboot3/public/assets/wap_js/common.js"></script>
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
</body>
</html>
