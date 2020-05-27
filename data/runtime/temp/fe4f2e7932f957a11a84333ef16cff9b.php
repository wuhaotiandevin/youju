<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:40:"themes/simpleboot3/user\apply\index.html";i:1574238611;s:66:"D:\wwwroot\www.peiwan.pw\public\themes\simpleboot3\public\nav.html";i:1574238611;s:69:"D:\wwwroot\www.peiwan.pw\public\themes\simpleboot3\public\footer.html";i:1574238611;}*/ ?>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>申请入驻-<?php echo $site_info['site_name']; ?></title>
        <link href="/themes/simpleboot3/public/assets/simpleboot3/themes/simpleboot3/bootstrap.min.css" rel="stylesheet">
        <link href="/themes/admin_simpleboot3/public/assets/themes/flatadmin/bootstrap.min.css" rel="stylesheet">
        <link href="/themes/simpleboot3/public/assets/css/vendors.css" rel="stylesheet">
        <link href="/themes/simpleboot3/public/assets/css/components.css" rel="stylesheet">
        <link href="/themes/simpleboot3/public/assets/css/apply.css" rel="stylesheet">
        <script src="/themes/simpleboot3/public/assets/js/jquery.js"></script>
        <script src="/themes/simpleboot3/public/assets/js/recorder.mp3.min.js"></script>
    </head>
<?php 
    $province=empty($province)? 0 :$province;
    $city = empty($city)? 0 :$city;
    $district = empty($district)? 0 :$district;
     ?>
<script>
window.onload=function(){
                loadArea(<?php echo $province; ?>,'city');
                loadArea(<?php echo $city; ?>,'district');
                loadArea(<?php echo $district; ?>,'null');
                $("#province").val(<?php echo $province; ?>);
}
function loadArea(areaId,areaType) {
            var ajaxurl = "<?php echo url('user/profile/ajax_return'); ?>";
              $.get(ajaxurl,{'pid':areaId},function(data){
                  if(areaType=='city'){
                     $('#'+areaType).html('<option value="-1">市/县</option>');
                     $('#district').html('<option value="-1">镇/区</option>');
                  }else if(areaType=='district'){
                     $('#'+areaType).html('<option value="-1">镇/区</option>');
                  }
                  if(areaType!='null'){
                      $.each(JSON.parse(data),function(no,items){
                          $select = '';
                          if(areaType=='city'){
                              $select = (<?php echo $city; ?>==items.region_id) ? " selected " : "";
                          }else if(areaType=='district'){
                              $select = (<?php echo $district; ?>==items.region_id) ? " selected " : "";
                          }
                          $('#'+areaType).append('<option value="'+items.region_id+'"'+$select+'>'+items.region_name+'</option>');
                      });
                  }
              });
          }
          function loadLevel(Id,i) {
            var ajaxurl = "<?php echo url('user/apply/ajax_return'); ?>";
              $.get(ajaxurl,{'pid':Id},function(data){
                $('#dengji'+i).html('');
                      $.each(JSON.parse(data),function(no,items){
                          $('#dengji'+i).append('<option value="'+items.id+'">'+items.cat_name+'</option>');
                      });
              });
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
<style>
    .picker__select--month, .picker__select--year {
    border: 1px solid #b7b7b7;
    height: 2em;
    padding: 0px;
    margin-left: .25em;
    margin-right: .25em;
}
</style>
<main id="apply-player">
    <div class="banner">
        <img src="/themes/simpleboot3/public/assets/images/banner.jpg" alt="">
        <div>已有<strong><?php echo $count; ?></strong>人成为电竞陪玩师，新的篇章从这里启航</div>
    </div>
    
    <div class="information">
        <div class="limit-wrap">

            <div class="progress-rate">
                <div class="progress-bar" style="float: inherit; width: 100%;">
                    <div class="progress" style="width:25%"></div>
                </div>
                <div class="step-info active">
                    <div><i class="icon icon-ap-step"></i></div>
                    <div>第一步：基本信息</div>
                </div>
                <div class="step-info">
                    <div><i class="icon icon-ap-step"></i></div>
                    <div>第二步：服务信息</div>
                </div>
                <div class="step-info">
                    <div><i class="icon icon-ap-step"></i></div>
                    <div>第三步：申请成功</div>
                </div>
            </div>

            <div class="step-1" v-show="step === 1">
                <?php 
                  $sexs=array("2"=>"女","1"=>"男");
                  $province=Db('region')->where(array('parent_id'=>1))->select(); /*获取省级地区*/
                  $leimu=Db('category')->where(array('parent_id'=>56))->select(); 
                 ?>
                <table class="base-info">
                    <caption>温馨提示：<span>每项都为必填项，请准确填写，谢谢合作。</span></caption>
                    <tbody>
                        <tr>
                        	<td><strong>*</strong>QQ:</td>
                            <td><input type="text" class="comm-input full-line" name="qq" id="qq" value="<?php echo $qq; ?>"></td>
                            <td><strong>*</strong>所在城市:</td>
                            <td style="white-space: nowrap;">
                                <select class="comm-select area-select" name="province" id="province"  onchange="loadArea(this.value,'city')">
		                            <option value="0">请选择</option>
                                    <?php if(is_array($province) || $province instanceof \think\Collection || $province instanceof \think\Paginator): $i = 0; $__LIST__ = $province;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                    <option value="<?php echo $vo['region_id']; ?>"><?php echo $vo['region_name']; ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
		                        </select>
		                        <select class="comm-select area-select" name="city" id="city"  onchange="loadArea(this.value,'district')">
		                            <option value="0">市</option>
		                        </select>
		                        <select class="comm-select area-select" name="district" id="district">
		                            <option value="0">区</option>
		                        </select>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>*</strong>出生日期:</td>
                            <td>
                                <span class="comm-date-picker full-line">
                                    <input type="text" class="comm-input form-control js-bootstrap-date" value="<?php echo date('Y-m-d',$birthday); ?>" name="birthday" id="birthday"/>
                                    <i class="icon icon-date-picker"></i>
                                </span>
                            </td>
                            <td><strong>*</strong>性别:</td>
                            <td>
                                <select class="comm-select full-line" id="sex" name="sex">
                                    <?php if(is_array($sexs) || $sexs instanceof \think\Collection || $sexs instanceof \think\Paginator): if( count($sexs)==0 ) : echo "" ;else: foreach($sexs as $key=>$vo): ?>
                                          <option value="<?php echo $key; ?>"><?php echo $vo; ?></option>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="va-t"><strong>*</strong>个性标签:</td>
                            <td colspan="3" class="personality-labels">
                                <div class="pure-g">
                                    <?php if(is_array($leimu) || $leimu instanceof \think\Collection || $leimu instanceof \think\Paginator): $i = 0; $__LIST__ = $leimu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo1): $mod = ($i % 2 );++$i;$checked=strstr($gexing,(string)$vo1['id'])?"checked":""; ?>
                                    <div class="pure-u-1-5" style="margin-bottom: 10px;">
                                        <label class="comm-checkbox">
                                            <input type="checkbox" value="<?php echo $vo1['id']; ?>" name="gexing" <?php echo $checked; ?> id="gexing">
                                            <span></span>
                                            <?php echo $vo1['cat_name']; ?>
                                        </label>
                                    </div>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>  
                                </div>
                                <span style="color: red;">个性标签最多选择三项。</span>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>*</strong>形象照:</td>
                            <td colspan="3">
                                <div class="upload-images">
                                    <span class="remove-upload">
                                        <input type="hidden" name="avatar1" id="avatar1" value="<?php if($avatar != ''): ?><?php echo $avatar1; endif; ?>">
                                     <a href="javascript:uploadOneImage('图片上传','#avatar1');">
                                    <img src="<?php if($avatar1 == ''): ?>/themes/simpleboot3/public/assets/images/default-thumbnail.png<?php else: ?><?php echo cmf_get_image_url($avatar1); endif; ?>"
                                         id="avatar1-preview"
                                         width="135" style="cursor: pointer"/>
                                </a>
                                    </span>
                                    <span class="remove-upload">
                                        <input type="hidden" name="avatar2" id="avatar2" value="<?php if($avatar != ''): ?><?php echo $avatar2; endif; ?>">
                                     <a href="javascript:uploadOneImage('图片上传','#avatar2');">
                                    <img src="<?php if($avatar2 == ''): ?>/themes/simpleboot3/public/assets/images/default-thumbnail.png<?php else: ?><?php echo cmf_get_image_url($avatar2); endif; ?>"
                                         id="avatar2-preview"
                                         width="135" style="cursor: pointer"/>
                                </a>
                                    </span>
                                    <span class="remove-upload">
                                        <input type="hidden" name="avatar3" id="avatar3" value="<?php if($avatar != ''): ?><?php echo $avatar3; endif; ?>">
                                     <a href="javascript:uploadOneImage('图片上传','#avatar3');">
                                    <img src="<?php if($avatar3 == ''): ?>/themes/simpleboot3/public/assets/images/default-thumbnail.png<?php else: ?><?php echo cmf_get_image_url($avatar3); endif; ?>"
                                         id="avatar3-preview"
                                         width="135" style="cursor: pointer"/>
                                </a>
                                    </span>
                                    <span class="remove-upload">
                                        <input type="hidden" name="avatar4" id="avatar4" value="<?php if($avatar != ''): ?><?php echo $avatar4; endif; ?>">
                                     <a href="javascript:uploadOneImage('图片上传','#avatar4');">
                                    <img src="<?php if($avatar4 == ''): ?>/themes/simpleboot3/public/assets/images/default-thumbnail.png<?php else: ?><?php echo cmf_get_image_url($avatar4); endif; ?>"
                                         id="avatar4-preview"
                                         width="135" style="cursor: pointer"/>
                                </a>
                                    </span>
                                    <span class="t3 description">形象照最少三张，图片规格：PNG/JPG, 建议规格：800x800 图片小于2M</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>*</strong>个人介绍(语音):</td>
                            <td colspan="3">
                                <div class="upload-images">
                                  <span class="remove-upload">
                                  <button class="btn btn_primary" id="startRecord" style="background-color: #5aaefd;
    box-shadow: 0 5px 7.6px 0.4px rgba(48,140,227,.28);  width: 80px;    display: inline-block;line-height: 20px;
    text-align: center;border-radius: 10px;border: 0;color: #fff;font-size: 14px;transition: all .1s linear;outline: none;margin-top: 30px;">开始录音</button>
    <button class="btn btn_primary" id="stopRecord" style="background-color: #5aaefd;
    box-shadow: 0 5px 7.6px 0.4px rgba(48,140,227,.28);  width: 80px;    display: inline-block;line-height: 20px;
    text-align: center;border-radius: 10px;border: 0;color: #fff;font-size: 14px;transition: all .1s linear;outline: none;margin-top: 30px;display: none;">停止录音</button>
    <button class="btn btn_primary" id="playVoice" style="background-color: #5aaefd;
    box-shadow: 0 5px 7.6px 0.4px rgba(48,140,227,.28);  width: 80px;    display: inline-block;line-height: 20px;
    text-align: center;border-radius: 10px;border: 0;color: #fff;font-size: 14px;transition: all .1s linear;outline: none;margin-top: 30px;display: none;">播放语音</button>
  </span>
                                  <script type="text/javascript">
        
  // 4 音频接口
  // 4.2 开始录音
  $('#startRecord').click(function () {
    rec=Recorder();
    rec.open(function(){
        rec.start();
    },function(msg,isUserNotAllow){
        alert((isUserNotAllow?"用户拒绝了权限，":"")+"无法录音:"+msg);
    });
    $('#startRecord').css('display','none');
    $('#playVoice').css('display','none');
    $('#stopRecord').css('display','block');
  });
  // 4.3 停止录音
  $('#stopRecord').click(function () {
    //停止录音，得到了录音文件blob二进制对象，想干嘛就干嘛
    rec.stop(function(blob,duration){
        /*
        blob文件对象，可以用FileReader读取出内容
        ，或者用FormData上传，本例直接上传二进制文件
        ，对于普通application/x-www-form-urlencoded表单上传
        ，请参考github里面的例子
        */
        var form=new FormData();
        form.append("file",blob,"recorder.mp3");
        form.append("filetype","audio");
        form.append("type","audio/mp3");
        form.append("size","60648");
        form.append("name","1.mp3");
        form.append("id","WU_FILE_1");
        form.append("app","undefined");
        //和普通form表单并无二致，后端接收到upfile参数的文件，文件名为recorder.mp3
        
        //直接用ajax上传
        var xhr=new XMLHttpRequest();
        xhr.open("POST","/user/asset/webuploader.html?_ajax=1");//这个假地址在控制台network中能看到请求数据和格式，请求结果无关紧要
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4){
                if (xhr.status == 200 ) 
                 { 
                     var data = xhr.responseText;
                      var list  = JSON.parse(data);
                     console.log(list.data.url); 
                     $("#yuyin").attr("value",list.data.url);

                 } 
            }
        }
        xhr.send(form);
    },function(msg){
        alert("录音失败:"+msg);
    });
     $('#startRecord').css('display','none');
    $('#playVoice').css('display','block');
    $('#stopRecord').css('display','none');
  });
  // 4.5 播放音频
  $('#playVoice').click(function () {
    
        var audio=document.createElement("audio");
        audio.controls=true;
        document.body.appendChild(audio);
        audio.controls = false;
        //非常简单的就能拿到blob音频url
        audio.src=$("#yuyin").val();
        audio.play();
    
  });
    </script>
                                    <span class="remove-upload">
                                     <a href="javascript:uploadOne('语音上传','#yuyin','audio');" style="background-color: #5aaefd;
    box-shadow: 0 5px 7.6px 0.4px rgba(48,140,227,.28);  width: 80px;    display: inline-block;height: 20px;line-height: 20px;
    text-align: center;border-radius: 10px;border: 0;color: #fff;font-size: 14px;transition: all .1s linear;outline: none;margin-top: 30px;">
                                    上传语音
                                </a> <br>
                                <input type="text" name="yuyin" id="yuyin" style="border: 0px;" value="<?php if($yuyin != ''): ?><?php echo $yuyin; endif; ?>">
                                    </span>
                                    <span class="t3 description">文件规格：mp3, 小于1M</span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="buttons">
                    <button class="comm-btn primary js-ajax-submit" id="button1">下一步</button>
                </div>
            </div>

            <div class="step-2" style="display: none;">  
            <ul class="list"> 
                <li id="goods">
                                </li>
                 <li id="add">添加服务</li>请谨慎填写服务信息，每项服务只允许填写一次并上传显示服务等级图片，乱填或者不填的都将审核不通过。
                </ul>

                <footer>                  
                    <div>
                        <button class="comm-btn secondary" id="restep">上一步</button>
                        <button class="comm-btn primary" id="button2">提交</button><br>
                    </div>
                </footer>
            </div>

            <div class="step-3" style="display: none;">
                <img src="/themes/simpleboot3/public/assets/images/success.png" alt="">
                <p>提交成功</p>
                <p>申请入成功，管理员将在两个工作日内进行资质审核，审核通过以短信形式通知。</p>
            </div>

        </div>
    </div>
</main>
<?php if($user_type == '3'): ?>
    <script type="text/javascript">
    $(".step-1").css("display", "none")
                    $(".step-2").css("display", "none")
                    $(".step-3").css("display", "block")
                    $(".step-info").addClass('active')
                    $(".progress").width('75%');
                </script>
    <?php endif; ?>
       
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
            $(document).on('change', '.file', function() { 
                if(filestyle(this)) {
                    //获取本地url
                    function getObjectURL(file) {
                        var url = null;
                        if(window.createObjcectURL != undefined) {
                            url = window.createOjcectURL(file);
                        } else if(window.webkitURL != undefined) {
                            url = window.webkitURL.createObjectURL(file);
                        } else if(window.URL != undefined) {
                            url = window.URL.createObjectURL(file);
                        }
                        return url;
                    }
                    var objURL = getObjectURL(this.files[0]);
                    $(this).parent().children("img").attr("src", objURL);
                } else {
                    this.value = null;
                    alert("不能识别的图片格式");
                }

            });
         var j = 0;
        $(document).on('click', '#add', function() {
                $("#goods").append("<div  class='spxx'>" +
                "<span>服务信息:</span>" +
                "<span class='upimg'>等级图片:<input type='hidden' name='avatar' id='avatar"+j+"'>"+
                "<a href='javascript:uploadOneImage(\"图片上传\",\"#avatar"+j+"\");'><img id='avatar"+j+"-preview' src='/static/images/img.png' width='150px'></a></span><span style='line-height: 150px;height:150px;margin-right:50px;'><a href='/help/15.html' target='_blank'>样例图</a></span>" +
                "<span class='fuwu'>选择服务和等级:" +
                "<select id='fuwu"+j+"' name='fuwu' class='comm-select area-select' style='width:120px;' onchange='loadLevel(this.value,"+j+")''>" +
                "<option value='-1'>请选择服务</option>" +
                "</select>" +
                "<select id='dengji"+j+"' name='dengji' class='comm-select area-select' style='width:120px;'>" +
                "<option value='0'>请选择等级</option>" +
                "</select>" +
                "</span><!--<span class='fuwu' style='width:300px;'>服务价格:<input class='comm-input full-line' style='width:150px;' name='jiage'></input>元/小时</span>--><span class='remove'>删除</span>" +
                "</div>");
                 var ajaxurl = "<?php echo url('user/apply/ajax_return1'); ?>";
                  $.get(ajaxurl,function(data){
                          $.each(JSON.parse(data),function(no,items){
                              $('#fuwu'+(j-1)).append('<option value="'+items.id+'">'+items.cat_name+'</option>');
                          });
                          console.log('#fuwu'+(j-1));
                  });
                $("#goods").css("display", "block");
                j++;
            });
         $(document).on('click', '.remove', function() {
                $(this).parent().remove();
            });
        $('#button1').click(function(){
            var gexing = '';
                $("input[name='gexing']:checked").each(function () {
                        gexing += $(this).attr('value') + ',';
                });
                gexing = gexing.substring(0, gexing.length - 1);
            var qq=$('#qq').val();
            var province=$('#province option:selected').val();
            var city=$('#city option:selected').val();
            var district=$('#district option:selected').val();
            var birthday=$('#birthday').val();
            var avatar1=$('#avatar1').val();
            var avatar2=$('#avatar2').val();
            var avatar3=$('#avatar3').val();
            var avatar4=$('#avatar4').val();
            var yuyin=$('#yuyin').val();
            var sex=$('#sex option:selected').val();
            var query="qq="+qq+"&province="+province+"&city="+city+"&district="+district+"&birthday="+birthday+"&gexing="+gexing+"&avatar1="+avatar1+"&avatar2="+avatar2+"&avatar3="+avatar3+"&avatar4="+avatar4+"&yuyin="+yuyin+"&sex="+sex;
            $.post('/user/apply/editPost',query,function (data) {
                var data = eval('(' + data + ')');
                if(data.status==1){
                    $(".step-1").css("display", "none")
                    $(".step-2").css("display", "block")
                    $(".step-3").css("display", "none")
                    $(".step-info").eq(1).addClass('active')
                    $(".progress").width('50%');
                }
                else {
                    alert(data.info);
                }
            });
        });
                    
			
			$(document).on('click', '#button2', function() {
                var avatar = '';
                $("input[name='avatar']").each(function () {
                        avatar += $(this).val() + ',';
                });
                avatar = avatar.substring(0, avatar.length - 1);
                var fuwu = '';
                $("select[name='fuwu']").each(function () {
                        fuwu += $(this).val() + ',';
                });
                fuwu = fuwu.substring(0, fuwu.length - 1);
                var dengji = '';
                $("select[name='dengji']").each(function () {
                        dengji += $(this).val() + ',';
                });
                dengji = dengji.substring(0, dengji.length - 1);
                // var jiage = '';
                // $("input[name='jiage']").each(function () {
                //         jiage += $(this).val() + ',';
                // });
                jiage = 0;//jiage.substring(0, jiage.length - 1);
                var query="fuwu="+fuwu+"&dengji="+dengji+"&jiage="+jiage+"&avatar="+avatar;
                console.log(query);
                $.post('/user/apply/addPost',query,function (data) {
                var data = eval('(' + data + ')');
                if(data.status==1){
                    $(".step-1").css("display", "none")
                    $(".step-2").css("display", "none")
                    $(".step-3").css("display", "block")
                    $(".step-info").addClass('active')
                    $(".progress").width('75%');
                }
                else {
                    alert(data.info);
                }
            });
			});
			$(document).on('click', '#restep', function() {
				$(".step-1").css("display", "block")
				$(".step-2").css("display", "none")
				$(".step-3").css("display", "none")
				$(".step-info").eq(1).removeClass('active')
                $(".progress").width('25%');
			});
            function filestyle(this1) {
    var path;
    path = $(this1).val();
    console.log(path)
    var geshi;
    geshis = path.split('.');
    geshi = geshis[geshis.length - 1]; //jpg 缁撴灉
    if(geshi == "jpg" || geshi == "png" || geshi == "gif" || geshi == "bmp") {
        return true;
    } else {
        return false;
    }
}
        </script>
    </body>
</html>