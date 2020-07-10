<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:39:"themes/simpleboot3/portal\playlist.html";i:1574678274;s:68:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\nav.html";i:1574678276;s:69:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\chat.html";i:1574678276;s:71:"D:\wwwroot\enboo.cn\public\themes\simpleboot3\public\footer.html";i:1574678276;}*/ ?>
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
<script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
<style type="text/css">
            .recommend_icon {
    width: 109px;
    height: 43px;
    position: absolute;
    top: 22px;
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
   font-size: 14px;
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

<main id="search" style="min-height: 67px;">
    <div class="limit-wrap">
        <!--筛选-->
        <div class="filter">
            <div class="items">
                <div class="type game-service">游戏服务</div>
                <div class="list">
                    <?php if(is_array($fuwu) || $fuwu instanceof \think\Collection || $fuwu instanceof \think\Paginator): $i = 0; $__LIST__ = $fuwu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;$isFocus=$catid==$vo['id']?"isFocus":""; ?>
                        <a href="<?php echo url('portal/search/index',array('gexing'=>0,'sex'=>0,'catid'=>$vo['id'],'level'=>0,'keyword'=>$keyword)); ?>" class="single <?php echo $isFocus; ?>">
                            <div class="img">
                                <img src="<?php echo cmf_get_image_url($vo['img_z']); ?>" alt="">
                                <img src="<?php echo cmf_get_image_url($vo['img_f']); ?>" alt="">
                            </div>
                            <div class="name"><?php echo $vo['cat_name']; ?></div>
                        </a>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            
            <div class="items" v-if="!collapse">
                <div class="type">等级服务</div>
                <div class="list">
                    <a href="<?php echo url('portal/search/index',array('gexing'=>$gexing,'sex'=>$sex,'catid'=>$catid,'level'=>0,'keyword'=>$keyword)); ?>" class="single <?php if($level == '0'): ?>isFocus<?php endif; ?>">全部</a>
                    <?php if(is_array($dengji) || $dengji instanceof \think\Collection || $dengji instanceof \think\Paginator): $i = 0; $__LIST__ = $dengji;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;$isFocus=$level==$vo['id']?"isFocus":""; ?>
                    <a href="<?php echo url('portal/search/index',array('gexing'=>$gexing,'sex'=>$sex,'catid'=>$catid,'level'=>$vo['id'],'keyword'=>$keyword)); ?>"  class="single <?php echo $isFocus; ?>"><?php echo $vo['cat_name']; ?></a>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            <div class="items" v-if="!collapse">
                <div class="type">玩家性别</div>
                <div class="list">
                    <?php $sexs=array("0"=>"全部","1"=>"男神","2"=>"女神"); if(is_array($sexs) || $sexs instanceof \think\Collection || $sexs instanceof \think\Paginator): if( count($sexs)==0 ) : echo "" ;else: foreach($sexs as $key=>$vo): $isFocus=$key==$sex?"isFocus":""; ?>
                      <a href="<?php echo url('portal/search/index',array('gexing'=>$gexing,'sex'=>$key,'catid'=>$catid,'level'=>$level,'keyword'=>$keyword)); ?>"  class="single <?php echo $isFocus; ?>"><?php echo $vo; ?></a>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            <div class="items" v-if="!collapse">
                <div class="type">个性筛选</div>
                <div class="list">
                        <a href="<?php echo url('portal/search/index',array('gexing'=>0,'sex'=>$sex,'catid'=>$catid,'level'=>$level,'keyword'=>$keyword)); ?>" class="single <?php if($gexing == '0'): ?>isFocus<?php endif; ?>">全部</a>
                        <?php if(is_array($liangdian) || $liangdian instanceof \think\Collection || $liangdian instanceof \think\Paginator): $i = 0; $__LIST__ = $liangdian;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;$isFocus=$vo['id']==$gexing?"isFocus":""; ?>
                        <a href="<?php echo url('portal/search/index',array('gexing'=>$vo['id'],'sex'=>$sex,'catid'=>$catid,'level'=>$level,'keyword'=>$keyword)); ?>" class="single <?php echo $isFocus; ?>"><?php echo $vo['cat_name']; ?></a>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
        <!--筛选 end-->
        <!-- 排序 -->
        <div class="sorting">
            <div class="items fl">
                <?php $paixu=array("0"=>"综合排序","1"=>"接单","2"=>"价格","3"=>"新人","4"=>"国外","5"=>"推荐"); if(is_array($paixu) || $paixu instanceof \think\Collection || $paixu instanceof \think\Paginator): if( count($paixu)==0 ) : echo "" ;else: foreach($paixu as $key=>$vo): $isFocus=$key==$order?"isFocus":""; ?>
                <a href="<?php echo url('portal/search/index',array('gexing'=>$gexing,'sex'=>$sex,'catid'=>$catid,'level'=>$level,'keyword'=>$keyword,'order'=>$key)); ?>" class="single dib <?php echo $isFocus; ?>"><?php echo $vo; ?></a>
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
                        <img src="<?php echo cmf_get_image_url($vo['avatar']); ?>" alt="" width="184px;" height="184px"> 
                    <?php if($vo['tags'] != ''): ?><i class="recommend_icon listicon"><?php echo $vo['tags']; ?></i><?php endif; if($vo['zhekou'] > '0'): ?><div class="discount_icon_box " style="width: 184px;margin:0 auto;">  低至<?php echo $vo['zhekou']; ?>折,下单就减 &gt;</div><?php endif; ?></a> 
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

<script  src="/themes/simpleboot3/public/assets/js/index.js"></script>
</body>
</html>