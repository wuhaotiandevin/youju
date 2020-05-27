$(function(){
	//礼物栏展开
    $(".chat-center-gift-show").click(function (){  
        var flag = $(".chat-center-gift-content").is(":hidden");  
        if(flag){  
            $(".chat-center-gift-content").show();  
        }else{  
            $(".chat-center-gift-content").hide();  
        }  
    });
    //礼物选项卡切换
    $(".chat-center-gift-tab").on("click", "div", function() {
        var index = $(this).index();
        $(".chat-center-gift-list .gifttab").addClass("hide");
        var showTab = $(".chat-center-gift-list .gifttab").eq(index);
        showTab.removeClass("hide");
        $(".chat-center-gift-tab > div").removeClass("gift-selected");
        $(this).addClass("gift-selected");
        if (showTab.find(".current").length == 0) {
            showTab.find(".chat-center-gift-item").eq(0).addClass("current")
        }
    });
    //礼物选择
    $(".chat-center-gift-list").on("click", ".chat-center-gift-item", function() {
        var parent = $(this).parent();
        parent.find(".chat-center-gift-item").removeClass("current");
        sendGift.id = $(this).attr("giftid");
        $(this).addClass("current")
    });
    //礼物数量选择
    $("#spanShowGiftCount").on("click", function(e) {
        e.stopPropagation();
        if ($("#giftCountList").css("display") == "none") {
            $("#giftCountList").show();
            $(".gift-send-teacher-list").hide()
        } else {
            $("#giftCountList").hide()
        }
    });
    //点击礼物数量
    $("#giftCountList").on("click", "span", function(e) {
        e.stopPropagation();
        var val = $(this).text();
        $("#giftCountList span").removeClass("current");
        $(this).addClass("current");
        $("#inputGiftCount").val(val)
    });
    //弹出发送礼物对象
    $("#selectGiftTeacher, #spanTeacherShow").on("click", function(e) {
        e.stopPropagation();
        if ($(".gift-send-teacher-list").css("display") == "none") {
            $(".gift-send-teacher-list").show();
            $("#giftCountList").hide()
        } else {
            $(".gift-send-teacher-list").hide()
        }
    });
    //选择发送礼物对象
     $("#divTeacherList").on("click", "p", function() {
        var uid = $(this).attr("uid");
        var username = $(this).text();
        $("#selectGiftTeacher").attr("uid", uid);
        $("#selectGiftTeacher").text(username);
        giftToTeacher = {
            uid: uid,
            nickname: username
        }
    });
    //隐藏发送礼物对象
    $(".chat-center-gift-content").on("click", function(e) {
        e.stopPropagation();
        $("#giftCountList").hide();
        $(".gift-send-teacher-list").hide()
    });
    //赠送礼物
    $(".gift-send-btn").on('click', function(event) {
    	sendGift.uid = $("#selectGiftTeacher").attr("uid");
    	sendGift.num = $("#inputGiftCount").val();
    	if(sendGift.id == 0 || sendGift.uid == 0 || sendGift.num == 0){
    		toastMakeText("赠送失败，请检查是否选择礼,受赠人,个数.");
    		return false;
    	}
    	sendGiftOnline(sendGift);
    });
    //红包栏展开
    $(".chat-center-redpacket").click(function (){  
    	$(".sendPacketModal").show();  
    });
    //红包栏关闭
    $(".sendpacket-close").click(function (){  
    	$(".sendPacketModal").hide();  
    });
  	
    //加载emoji
    $(".chat-input-smile").on("click", function(e) {
        e.stopPropagation();
        if ($(".chat-emoji-list").css("left") == "-120px") {
            $(".chat-emoji-list").css("left", "-10000px")
        } else {
            $(".chat-emoji-list").css("left", "-120px");
            initEmoji();
            $(".chat-center-gift-content").hide()
        }
    });
    //发送文字
    $("#send").on('click',function(){
    	if(user.isLogin == 0){
    		$("#index_pup_box").show(); 
    		toastMakeText("登录后才能发言");
    		return false;
    	}
    	var content = $("#chat_content").val();
        sendmeg.uid = user.uid;
        sendmeg.toId = 0;//0发表频道消息
        sendmeg.name = user.name;
        sendmeg.photoPath = user.photoPath;
        sendmeg.vipLV = user.vipLV;
        sendmeg.message = content;
    	sendMessage(JSON.stringify(sendmeg));
    	$("#chat_content").val("");//清空输入框内容
    });
    //发送文本监听回车键
    $("textarea").keydown(function(event){
    	if(event.keyCode == 13){
    		$("#send").trigger('click');
    	}
	});
	//显示最新文本
	$("#chatNewmessage").click(function(event) {
		$(".chat-center-window-main").scrollTop(99999);
	});
    //选择emoji
    $(".chat-emoji-list").on("click", ".chat-emoji-item", function(e) {
        var text = $(this).attr("text");
        var nowmsg = $(".chat-input-text textarea").val();
        $(".chat-input-text textarea").val(nowmsg + text)
    });
    //周榜展开
    $("#weekList").click(function (){  
    	$("#weekListW").show();
        $("#monthListW").hide();     
    });
    //月榜展开
    $("#monthList").click(function (){  
        $("#monthListW").show();
        $("#weekListW").hide();     
    });
    //音量展开关闭
    $(".chat-function-text").click(function (){  
        var volume = $("div.chat-voice-volume");
        if (volume.css("display") != "none") {
              $("div.chat-voice-volume").hide()
        } else {
            $("div.chat-voice-volume").show()
        }
    });
    //话筒展开
    $(".chat-function-huatong").click(function(event) {
    	if($(this).attr("alt") == "no"){
            toastMakeText("已静音");
            localStream.muteAudio();
    		$(this).attr("alt","yes");
    		$(this).find(".chat-huatong").css("backgroundPosition","-26px 0px");
    	}else if($(this).attr("alt") == "yes"){
            toastMakeText("解除静音");
            localStream.unmuteAudio();
    		$(this).attr("alt","no");
    		$(this).find(".chat-huatong").css("backgroundPosition","0px 0px");
    	}
    });
    //关闭封禁窗口
    $("#user_mod_win_close").click(function() {
    	$(".user_mod_win").hide();
    });
    //点击 空白隐藏礼物栏、音量栏、emoji
    $(document).click(function(event){
    	var _con = $('.chat-center-gift-show');
    	var _con1 = $('.chat-center-gift-content');
    	//排除展开按钮
    	if(!_con.is(event.target) && _con.has(event.target).length === 0){
    		//排除礼物栏div子元素
    		if($(event.target).closest(_con1).length === 0){
    			$('.chat-center-gift-content').hide();
    		}
		};
		var _con2 = $('.chat-function-yinliang');
		var _con3 = $('.chat-voice-volume');
		if(!_con2.is(event.target) && _con2.has(event.target).length === 0){
    		//排除音量调节子元素
    		if($(event.target).closest(_con3).length === 0){
    			$('.chat-voice-volume').hide();
    		}
		};
		var _con4 = $('.chat-input-smile');
		var _con5 = $('.chat-emoji-list');
		if(!_con4.is(event.target) && _con4.has(event.target).length === 0){
    		//排除音emoji子元素
    		if($(event.target).closest(_con5).length === 0){
    			$(".chat-emoji-list").css("left", "-10000px");
    		}
		};
	});
	//联系客服
	$(".chat-dd-kefu").click(function (){  
		if (confirm("是否在线QQ咨询？")){					
			window.open("http://wpa.qq.com/msgrd?v=3&uin=3129016370&site=qq&menu=yes");
		}else{
			return;
		}
    });
	//展开登录
	$(".chat-btnlogin").click(function (){  
		$("#index_pup_box").show();  
    });
 	//移入移出展示头像详情
    var kapianInterval;
    $(".chat-center-banner-main").on("mouseenter", ".main-keng-header", function() {
         if($(this).find("img").attr("src") == "/mychat/img/empty.jpg")
            return false;
        var that = this;
        kapianInterval = setTimeout(function() {
            showKapian(that)
        }, 500)
    });
    $(".main-keng-item").on('click',function(){
        var _pos = $(this).attr("position");
        // if(isInited != 1){
        //     toastMakeText("等待进入房间..");
        //     return false;
        // }
        if($(".main-keng-item").eq(_pos - 2).attr("account") != 0){
            toastMakeText("麦上已经有人!");
            return false;
        }
        if(_pos == 0){
            if($("#onMain").html() == "上主持"){
                $("#onMain").attr("position",_pos);
                $("#onMain").trigger('click');//上主持
            }
        }else if(_pos > 0){
            $(".chat-shangmai-btn").attr("position",_pos);
            $(".chat-shangmai-btn").trigger('click');//上主麦
        }
    })
    $(".chat-center-banner-main").on("mouseleave", ".main-keng-header", function() {
	    var account = $(this).attr("account");
	    clearInterval(kapianInterval);
	    $(".chat-huiyuan-info").hide();
    });
    //弹出封禁窗口
    $("#user_mod_setTicket",".chat-room-item-empty", ".chat-room-item").on('click',function(){
		console.log("authorization:" + authorization);
		if($(this).attr("uid") == undefined)
			var id = $(this).attr("account");
		else
			var id = $(this).attr("uid");
			$("#user_id_cname").html(id);
			$(".user_mod_win").show();
    });
    function showKapian(that) {
        var offset = $(that).offset();
        var width = $(that).css("width").replace("px", "") * 1;
        var height = $(that).css("height").replace("px", "") * 1;
        position = $(that).parents(".main-keng-item").attr("position");
        var _nickname=$(".main-keng-item").eq(position - 2).find('font').html();
        var _uid = $(".main-keng-item").eq(position - 2).attr("account");
        if(_uid == user.uid){
            $("#setTicket").hide();
            $("#setDownVideo").hide();
        }else{
            $("#setTicket").show();
            $("#setDownVideo").show();
        }
        //设置头像
        $(".huiyuan-head img").attr("src",$(that).find("img").attr('src'));
        //设置麦位
        //设置ID
        $(".chat-huiyuan-info-bottom").find("a").each(function(i,n){
        	$(this).attr("uid",_uid);
        	$("#chat_user_id").html(_uid);
        })
        //设置昵称
        $("#chat_user_nickname").html(_nickname);
        //设置业务ID
        $("#user_mod_two").each(function(index, el) {
        	$(el).attr("uid",_uid);
        });
       	//设置VIP
        getUserInfo(_uid,function(e){
            $(".vipicon").attr("src","/mychat/img/" + user.vipLV + ".png");
        })
        //绑定业务
        $("#user_mod_two a").on('click', function(event) {
        	var sign = $(this).attr("alt");
        	if(sign == "privateChat"){
                var _uid = $(this).attr("uid");
                layui.use('layim', function(layim){
      layim.chat({
      id: _uid
      ,name: _nickname
      ,type: 'friend' //friend、group等字符，如果是group，则创建的是群聊
      ,avatar: ''
      });
      })
        		//toastMakeText("正向 " + $(this).attr("uid") + " 私聊");
        	}else if(sign == "setOrder"){
                var _uid = $(this).attr("uid");
                setTimeout("window.open('https://www.suprass.cn/detail/"+_uid+".html')",500);
        		//toastMakeText("正向 " + _uid + " 下单");
        	}else if(sign == "setTicket"){
        		var id = $(that).parents(".main-keng-item").attr("account");
				$("#user_id_cname").html(id);
				$(".user_mod_win").show();
        	}else if(sign == "setDownVideo"){
                var id = $(that).parents(".main-keng-item").attr("account");
                if(user.isLogin == 0){
                    toastMakeText("请登录！");
                    return false;
                }
                if(user.authorization < 3){
                    toastMakeText("无权限");
                    return false;
                }
                if(id == user.uid){
                    toastMakeText("不能抱自己下麦");
                    return false;
                }
                var _modVideo = new modVideo(id,position);
                updataVideo(1,position);
                downVideo(new User(id));
                sendMessage(JSON.stringify(_modVideo));
            }	
        });
        $(".chat-huiyuan-info").css("top",offset.top + height - 15);
      	$(".chat-huiyuan-info").css("left",offset.left - width - 30);
        $(".chat-huiyuan-info").show();  
    };
    //头像详情移入移出
    $("body").on("mouseenter", ".chat-huiyuan-info", function() {
        $(this).show();
    });
    $("body").on("mouseleave", ".chat-huiyuan-info", function() {
        $(this).hide();
    });   
    //登录注册切换
    $(".enroll").click(function() {
		$(".enroll").removeClass("enroll_add");
		$(this).addClass("enroll_add");
		var index = $(this).index();
		$(".enroll_content").hide();
		$(".enroll_content").eq(index).show();
	});
	//点单流程弹出层
	$(".gboQHC").on('click',function(){
		$(".ToastBlack").show();
		$(".Toast").show();
	})
	//登录隐藏显示
	$(".button_login").click(function(event) {
		if($(this).attr("alt") == "login"){
            var username=$('#username').val();
            var password=$('#pwd').val();
            var query="username="+username+"&password="+password;
            $.post('/portal/chat/doLogin',query,function (data) {
            var data = eval('(' + data + ')');

            if(data.status==1){
                toastMakeText("登录成功");
                window.location.href=data.url;
            }
            else {
                toastMakeText(data.info);
            }
        });
        }
		$("#win_register").hide();
		$("#win_login").show();
	});
	$(".button_register").click(function(event) {
		if($(this).attr("alt") == "register"){
			var username=$('#username').val();
            var password=$('#pwd').val();
            var phone=$('#phone').val();
            var code=$('#code').val();
            var query="username="+username+"&password="+password+"&phone="+phone+"&code="+code;
            $.post('/portal/chat/doRegister',query,function (data) {
                var data = eval('(' + data + ')');

            if(data.status==1){
                toastMakeText("登录成功");
                window.location.href=data.url;
            }
            else {
                toastMakeText(data.info);
            }
        });
        }
		$("#win_login").hide();
		$("#win_register").show();
	});
	$(".Toast .close").click(function(event) {
		$(".ToastBlack").hide();
		$(".Toast").hide();
	});
	//关闭登录注册面板
	$(".layer-cell-close").on("click", function(){
		$("#index_pup_box").hide();
	})
	//校验手机号
	$('#ctl00_mainContent_txt_phone').blur(function(){
		CheckPhone();
	});
	//校验用户名
	$('#user_name').blur(function(){
		$('.dislocation_box').eq(0).css('display','none');
		CheckUserName();
	})
	//校验手机号
	function CheckPhone(callback){
		var val = $('#ctl00_mainContent_txt_phone').val();
		var reg_phone = /^1\d{10}$/;
		if(!reg_phone.test(val)){
			$("#phone_tishi").text("手机号必须为11位数字");
			$("#checkall_phone").val(0);
			return;
		}
		//后台校验如果合法则执行：
		$("#phone_tishi").html('<img src="img/true.png"/>');
	};
	//校验用户名
	function CheckUserName(callback){
		var val = $("#user_name").val();
		var pattern = new RegExp("[%--`~!\#@$^&*()\\s\=|{}':;',\\[\\].<>/?~！@￥……&*（）——|{}【】‘；：”“'。，、？\"]");
		var pattern_2 = new RegExp("[0-9]+");
		if (val.length > 15 || val.length < 3) {
			$("#username_tishi").html("用户名格式不符合要求");
			return;
		}
		if (val.match(pattern) != null) {
			$("#username_tishi").html("用户名包含敏感字符");
			return;
		} else {
			if(val.match(pattern_2)==val){
				$("#username_tishi").html("用户名不能为纯数字");
				return;
			}
			//后台校验如果合法则执行：
			$("#username_tishi").html('<img src="/mychat/img/true.png"/>');
		};
	};
	var lang = 0;
	mainPosition = 1;
	//语言切换
	$("#language").click(function() {
		moveLanguage();
	});
	function moveLanguage(){
		if(lang === 0){
			$(".chat-btnlogin").html("Login");
			$(".channel-info-title").html("DayList");
			$(".hero-week-rank").html("WeekList");
			$(".right_chatroom_guanming").html("Make friends～");
			$("#inputSearchKeywords").attr("placeholder","Please enter tutor nickname");
			$("#expressions").html("bold expressions of love!");
			$("#give").html("give gifts");
			$("#envelopes").html("red envelopes");
			$("#send").html("send");
			$("#mic").html("MIC");
			$("#vol").html("VOL");
			$("#kefu").html("QQ Service");
			$("#chatNewmessage").html("new messages");
			if($(".chat-shangmai-btn").html == "上麦")
				$(".chat-shangmai-btn").html("ON MIC");
			else
				$(".chat-shangmai-btn").html("DOWN MIC");
			$(".gboQHC").html("Point-to-Point Flow");
			lang = 1;
			return;
		}
		if(lang === 1){
			$(".chat-btnlogin").html("登录");
			$(".channel-info-title").html("日榜");
			$(".hero-week-rank").html("周榜");
			$(".right_chatroom_guanming").html("交友活动正在进行中～");
			$("#inputSearchKeywords").attr('placeholder','请输入导师昵称');
			$("#expressions").html("大胆向Ta表白吧！");
			$("#give").html("赠送礼物");
			$("#envelopes").html("发红包");
			$("#send").html("发送");
			$("#send").html("话筒");
			$("#vol").html("音量");
			$("#kefu").html("联系客服");
			$("#chatNewmessage").html("有新消息");
			if($(".chat-shangmai-btn").html == "ON MIC")
				$(".chat-shangmai-btn").html("上麦");
			else
				$(".chat-shangmai-btn").html("下麦");
			$(".gboQHC").html("点单流程");
			lang = 0;
		}
	};
	//初始化useruid
	useruid = Math.round(Math.random() * 90000000 + 10000000); 
	//语音初始化
	
	//加入频道
	// join();	
	//上麦下麦
	$("#onMain").click(function(){
		if($(this).html() == '上主持' || $(this).html() == 'ON MAIN' ){
            if(mainPosition == 0){
                toastMakeText("已经有人主持了");
                return false;
            }
            if(user.authorization < 4){
                toastMakeText("您没有权限上主持");
                return false;
            }
            if(user.isLogin == 0){
                toastMakeText("主持需要登录！");
                return false;
            }
			if(user.authorization >= 2 && mainPosition == 1){
					var HTML = " ";
                    mainPosition = 0;
					HTML += "<p style='order:0' uid='"+user.uid+"'><font style='color:blue'>送给 "+user.name+"</font></p>";
					$("#divTeacherList").append(HTML);
					$("#main_zhuci_account").addClass('speaking');
			 		$(".main-zhuci #user_photo_main").attr("src",user.photoPath);
			 		$(".main-zhuci-name").find("font").html(user.name);
			 		$(".main-zhuci-name").find("font").show();
			 		$("#main_zhuci_account").attr("account",user.uid);
					$(".main-zhuci").show();
                    updataVideo(0,$(this).attr("position"));
					setRole(1); //上麦
                    updataVideo(0,1);
                    var _sendMeg = new sendMeg(user.uid,user.name,0,user.photoPath,user.vipLV,"",0,0,1,0); 
                    sendMessage(JSON.stringify(_sendMeg));
                    publish();  //发布本地音频流
					if(lang == 0)
						$(this).html('下主持');
					else
						$(this).html('DOWN MAIN');
			        return;
			}else{
				toastMakeText("无权限，或主持已有人！");
			}
		}
		if($(this).html() == '下主持' || $(this).html() == 'DOWN MAIN'){
			setRole(0);
            updataVideo(1,$(this).attr("position"));
			mainPosition = 1;
			$("#main_zhuci_account").removeClass('speaking');
			$("#user_photo_main").attr("src","/mychat/img/empty.jpg");
			$(".main-zhuci-name").find("font").hide();
			$("#divTeacherList p").each(function(index, el) {
   				if($(el).attr("uid") == user.uid)
   					$(el).remove();	
   			});
            updataVideo(1,1);
            var _sendMeg = new sendMeg(user.uid,user.name,0,user.photoPath,user.vipLV,"",0,0,0,1); 
            sendMessage(JSON.stringify(_sendMeg));
            if(lang == 0)
				$(this).html('上主持');
			else
				$(this).html('ON MAIN');
		}
		
	})
	$(".chat-shangmai-btn").click(function() {	
		if($(".chat-shangmai-btn").html() == '上麦' || $(".chat-shangmai-btn").html() == 'ON MIC' ){	
			 if(temp == 9){
			 	toastMakeText("当前没有麦位");
			 	return false;
			 }
             if(user.isLogin == 0){
                toastMakeText("上麦需要登录");
                return false;
             }
            position = $(this).attr("position");
			$(".main-keng-item").each(function(){
                if($(this).attr("account") == user.uid){
                    toastMakeText("不要重复上麦!")
                    return false;

                }
				if($(this).attr("position") == position){
					var HTML = " ";
					HTML += "<p style='order:0' uid='"+user.uid+"'><font style='color:red'>送给"+user.name+"</font></p>";
					$("#divTeacherList").append(HTML);
                    $(".chat-shangmai-btn").show();
					$(this).attr("account", user.uid);
					$(this).find('img').attr("src",user.photoPath);
					$(this).addClass("speaking");
					$(this).find("font").html(user.name);	
					$(this).find("font").show();				
					$(this).show();
                    updataVideo(0,position);
					temp ++;
					setRole(1); //上麦
                    var _sendMeg = new sendMeg(user.uid,user.name,0,user.photoPath,user.vipLV,"",1,0,0,0,position); 
					sendMessage(JSON.stringify(_sendMeg));//发送给其他用户提示此用户已上麦
					publish();  //发布本地音频流
					return false;
				}
			 });
			if(lang == 0)
				$(".chat-shangmai-btn").html('下麦');
			else
				$(".chat-shangmai-btn").html('DOWN MIC');
			return false;
		}
		else if($(".chat-shangmai-btn").html() == '下麦' || $(".chat-shangmai-btn").html() == 'DOWN MIC'){
			$("#divTeacherList p").each(function(index, el) {
   				if($(el).attr("uid") == user.uid)
   					$(el).empty();	
   			});
			$(".main-keng-item").each(function(){
				if($(this).attr("account") == user.uid){
                    position = $(this).attr("position");
                    updataVideo(1,position);
				    $(".chat-shangmai-btn").hide();
                	$(this).find('img').attr("src","/mychat/img/empty.jpg");
                    $(this).attr("account",0);
					$(this).removeClass("speaking");
					$(this).find("font").hide();
					temp --;
					setRole(0);	//下麦
					var _sendMeg = new sendMeg(user.uid,user.name,0,user.photoPath,user.vipLV,"",0,1,0,0,position); 
                    sendMessage(JSON.stringify(_sendMeg));
					return false;	
				}
			 });
			if(lang == 0)
				$(".chat-shangmai-btn").html('上麦');
			else
				$(".chat-shangmai-btn").html('ON MIC');
		}
	});	
	
	
});
//初始化隐藏
function initMangerMod(){
    if(user.authorization < 2){
        $("#setTicket").hide();
        $("#setDownVideo").hide();
    }
}
//初始化表情包
function initEmoji() {
        emojilist = emoji;
        var emojiArr = [];
        for (var i in emojilist) {
            var key = i,img = emojilist[i].file;
            emojiArr.push('<div class="flex chat-emoji-item" title="' + key + '" text="' + key + '" val="' + img + '">\n                                <img src="/mychat/img/emoji/' + img + '">\n                                                  </div>');
        }
        $(".chat-emoji-list").html(emojiArr.join(""));
    };
//房间列表下拉监听
   	function lawn(that){
   		if($(that).attr("alt") == "hide"){
            var name = "chaoshikong";
   			// var name = $(that).find("e").eq(0).html();
            $("#channelroom_" + name).show();
   			$(that).attr("alt","show");
   		}
   		else{
            var name = "chaoshikong";
            // var name = $(that).find("e").eq(0).html();
            if($("#channelroom_" + name).css("display") != "none"){
                $("#channelroom_" + name).hide();
                $(that).attr("alt","hide");
            }
   		}
   	}
   	function upVideo(e){
   		$(".main-keng-item").each(function(){
                var _pos = e.position;
				if($(this).attr("account") == e.uid)
					return false;
				if($(this).attr("position") == _pos){
                    var HTML = " ";
					HTML += "<p style='order:0' uid='"+e.uid+"'><font style='color:red'>送给 "+e.name+"</font></p>";
					$("#divTeacherList").append(HTML);
                    $(this).find('img').attr("src",e.photoPath);
					$(this).attr("account", e.uid);
					$(this).addClass("speaking");
					$(this).find("font").show();	
					$(this).find("font").html(e.name);			
					$(this).show();
					temp ++;
					setRole(1); //上麦
					publish();  //发布本地音频流
					return false;
				}
			 });
   	}
   	function downVideo(e){
   		$(".main-keng-item").each(function(){
   					if($(this).attr("account") == e.uid){
   						$("#divTeacherList p").each(function(index, el) {
   							if($(el).attr("uid") == e.uid)
   								$(el).remove();	
   						});
   						temp--;
                        $(this).attr("account",0);
                        $(this).find('img').attr("src","/mychat/img/empty.jpg");
   						$(this).removeClass("speaking");
   						$(this).find("font").hide();
						setRole(0);	//下麦
						return false;
   			}	
		});
   	}
   	function upMainVideo(e){
        mainPosition = 0;
   		$(".main-zhuci #user_photo_main").attr("src",e.photoPath);
   		$("#main_zhuci_account").addClass('speaking');
		$(".main-zhuci-name").find("font").html(e.name);
		$(".main-zhuci-name").find("font").show();
		$("#main_zhuci_account").attr("account",e.uid);
		$("#divTeacherList").append("<p style='order:0' uid='"+e.uid+"'><font style='color:red'>送给"+e.name+"</font></p>");
		$(".main-zhuci").show();
   	}
   	function downMainVideo(e){
   		mainPosition = 1;
   		$("#divTeacherList p").each(function(index, el) {
   			if($(el).attr("uid") == e.uid)
   				$(el).remove();	
   		});
   		$(".main-zhuci-name").find("font").hide();
        $("#main_zhuci_account").removeClass('speaking');
		$("#user_photo_main").attr("src","/mychat/img/empty.jpg");
   	}
   	//弹出提示语
	function toastMakeText(message){
		$("#ToastMsgContext").html(message);
		$(".ToastMeg").fadeIn(500);
		setTimeout("$('.ToastMeg').fadeOut('slow')",2000);
	}
//用户id
var useruid;

//语音测试
var APPID = "347306e49245484598ff96b3f641188b";
var TOKEN_OR_KEY = "";
var CHANNEL_NAME = "chaoshikong";
var UID = useruid;
var myuid;
var client;
var localStream;	
var temp = 0;	//是否有麦位
var count = 0;
var isInited = 0; //是否初始化完成
var position = -1;
clientinit();
function clientinit(){
	//创建客户端
	RTC = AgoraRTC.createClient({mode: 'live', codec: "h264"});
	//客户端初始化
	RTC.init(APPID, function () {
        getToken(CHANNEL_NAME);
	  console.log("AgoraRTC client initialized");
	}, function (err) {
	  console.log("AgoraRTC client init failed", err);
	});
}
function join(){
	//加入频道
	RTC.join(TOKEN_OR_KEY,CHANNEL_NAME, user.uid, function(uid) {
		console.log("User " + uid + " join channel successfully");
	//加载频道
	}, function(err) {
	  console.log("Join channel failed", err);
	});
}
function initsteam(){
	//创建音频流对象
	localStream = AgoraRTC.createStream({
	    streamID: user.uid,	//音视频流 ID。设置为用户 ID （uid），可通过 client.join 的回调获取
	    audio: true,	//是否开启音频。
	    video: false,	//是否开启视频。
	    screen: false}	// 是否开启屏幕共享功能。请勿将 video 和 screen 同时设置为 true 。
	);
	//初始化音频流
	localStream.init(function() {
		$("body").append("<video id='agora_local' style='display: none'></video>");
	  console.log("getUserMedia successfully");
	  // 这里使用agora_local作为dom元素的id。
	  localStream.play('agora_local');
	}, function (err) {
	  console.log("getUserMedia failed", err);
	});
}

function publish(){
	//发布本地音频流
	RTC.publish(localStream, function (err) {
	  console.log("Publish local stream error: " + err);
	});
	//监听发布流成功事件
	RTC.on('stream-published', function (evt) {
	  console.log("Publish local stream successfully");
	});

}

function subscribe(){
	RTC.on('stream-added', function (evt) {
	  var stream = evt.stream;
	  console.log("New stream added: " + stream.getId());

	  RTC.subscribe(stream, function (err) {
	    console.log("Subscribe stream failed", err);
	  });
	});
	RTC.on('stream-subscribed', function (evt) {
	  var remoteStream = evt.stream;
	  getUserInfo(remoteStream.getId(),function(e){
        upVideo(e);
      })
	  $("body").append("<video id='agora_local" + remoteStream.getId()+ "' style='display: none'></video>");
	  remoteStream.play('agora_local' + remoteStream.getId());
	})
};
function myleave(){
	//使用 client.leave 方法让用户离开当前通话或直播（频道）
	RTC.leave(function () {
	  console.log("Leave channel successfully");
	}, function (err) {
	  console.log("Leave channel failed");
	});
}
//设置用户权限host主播，audience观众
function setRole(flag){
	var role;
	if(flag == 1){
		role = "host";
	}else{
		role = "audience";
	}
	RTC.setClientRole(role, function() {
	  console.log("setHost success");
	}, function(e) {
	  console.log("setHost failed", e);
	})
};
//RTM初始化
function initRTM(APPID)
{
	rtm = AgoraRTM.createInstance(APPID);
	rtm.on('ConnectionStateChanged', (newState, reason) => {
  		if(reason == "LOGIN_SUCCESS"){
  			console.log("uid:" +useruid+ " 登录成功");
  		}
  	});
}
//登录
function login(impid){
	rtm.login({uid:impid.toString()}).then(() => {
  		console.log('AgoraRTM client login success');
	}).catch(err => {
  		console.log('AgoraRTM client login failure', err);
	})
};
//退出登录
function logout(){
	rtm.logout();
}
//创建频道
function createChannel(){
	channel = rtm.createChannel("chaoshikong"); // 此处传入频道 ID
	setListener();
	relayMessage();
}
//加入频道
function joinChannel(){
	channel.join().then(() => {
		getRoomList();
        getNotice("chaoshikong",function(e){
            $(".chatroom-gonggao").append("<div class='flex getredbag-message' style='margin:10px 0;width:100%'>"+e+"</div>");
        });
		$(".chatroom-gonggao").append("<div class='flex getredbag-message' style='margin:10px 0;'><div class='flex welcome-get-message' id='log'>欢迎 <span>"+user.name+"</span> 进入频道</div></div>");
        isInited = 1;
        console.log("进入频道成功！");
        localStream.muteAudio();
  /* 加入频道成功的处理逻辑 */
}).catch(error => {
  /* 加入频道失败的处理逻辑 */
  		console.log("进入频道失败",error);
})};	
//发送频道消息
function sendMessage(message){
	channel.sendMessage({ text: message }).then(() => {
		var faceHTML = new Array();
		var userHTML = " " ;
        var e = JSON.parse(message);
        for(var key in emojilist){
            var k = key.slice(1,key.length - 1);
            e.message = e.message.replace(new RegExp(k,"g"),"<img style='margin-top:8px;margin-left:5px' src='/mychat/img/emoji/" +emojilist[key].file + "'/>");
        }
        //替换所有符号
        e.message = e.message.replace(/\[/g,"");
        e.message = e.message.replace(/\]/g,"");
		//设置等级图片
		userHTML += e.name + "<img src='/mychat/img/" + e.vipLV + ".png' style = 'margin-left:5px;margin-top:-2px;'/>";
        if(e.upVideo == 1 || e.upMainVideo == 1)
            e.message = "<span style='color:#EE7600'>豪迈得上麦啦</span>";
        else if(e.downVideo == 1 || e.downMainVideo == 1)
            e.message = "<span style='color:#EE7600'>偷偷得下麦啦</span>";
		$(".chatroom-gonggao").append("<div class='flex getredbag-message' style='margin:10px 0;'><div class='flex welcome-get-message' id='log'><span>"+userHTML+": </span>" +e.message+ "</div></div>");
		console.log("发送文本：" + e.message);
  /* 频道消息发送成功的处理逻辑 */
	}).catch(error => {
		console.log(error);
  /* 频道消息发送失败的处理逻辑 */
})};
//接收频道消息
function relayMessage(){
	channel.on('ChannelMessage', ({ text }, senderId) => { // text 为收到的频道消息文本，senderId 为发送方的 User ID
		//先判断是否上麦提示
		var e = JSON.parse(text);
        console.log(e);
        if(e.type == "sendMeg"){
            if(e.upVideo == 1){
                upVideo(e);
            }else if(e.downVideo == 1){
                downVideo(e);
            }else if(e.upMainVideo == 1){
                upMainVideo(e);
            }else if(e.downMainVideo == 1){
                downMainVideo(e);
            }
        }else if(e.type == "modVideo"){
            downVideo(e);
            if(e.uid == user.uid){
                $(".chat-shangmai-btn").html("上麦");
                $(".chat-shangmai-btn").hide();
            }
            toastMakeText("系统消息：" + e.uid + " 被强制下麦");
            return false;
        }else if(e.type == "sendGift"){
            let _toId = e.uid;
            let _giftId = e.id;
            let _num = e.num;
            let _giftName = " ";
            let _photoPath = " ";
            getUserInfo(e.fromId,function(e){
                var _name = e.nickname;
                getUserInfo(_toId,function(e){
                    var _toName = e.nickname;
                    initGiftList(function(e){
                        var count = e.count;
                        for(let i = 0;i < count;i ++){
                            if(e.data[i].id == _giftId){
                               _photoPath = e.data[i].image;
                                break;
                            }
                        }
                        var userHTML = _name + " 送给 " + _toName +" " + "<img style='width:20px;height:20px;margin:0 10px;'src='"+_photoPath+"'/>" + "×" +_num;
                        $(".chatroom-gonggao").append("<div class='flex getredbag-message' style='margin:10px 0;'><div class='flex welcome-get-message' id='log'><span>"+userHTML+"</span></div></div>");
                        return false;
                    })
                });

            })
            return false;
        }
        if(e.upVideo == 1 || e.upMainVideo == 1)
            e.message = "<span style='color:#EE7600'>豪迈得上麦啦</span>";
        else if(e.downVideo == 1 || e.downMainVideo == 1)
            e.message = "<span style='color:#EE7600'>偷偷得下麦啦</span>";
        var userHTML = e.name + "<img src='/mychat/img/" + e.vipLV + ".png' style = 'margin-left:5px;margin-top:-2px;'/>";
		$(".chatroom-gonggao").append("<div class='flex getredbag-message' style='margin:10px 0;'><div class='flex welcome-get-message' id='log'><span>"+userHTML+": </span>" +e.message+ "</div></div>");
  /* 收到频道消息的处理逻辑 */
})};
//监听
function setListener(){
	channel.on('MemberJoined', memberId => { // memberId 为加入频道的用户 ID
  /* 收到频道用户加入通知的处理逻辑 */
        getUserInfo(memberId,function(e){
            toastMakeText("<img src='"+e.avatar+"' style='width:20px;height:20px;marign-right:15px;border-radius:50%;'/>欢迎 " + e.nickname + " <span style='color:yellow'>进入频道</span>");
            getRoomList();
            $(".chatroom-gonggao").append("<div class='flex getredbag-message' style='margin:10px 0;'><div class='flex welcome-get-message' id='log'>欢迎 <span>"+e.nickname+"</span> 进入频道</div></div>");
        })
  	});
  	channel.on('MemberLeft', memberId => { // memberId 为离开频道的用户 ID
  /* 收到频道用户离开通知的处理逻辑 */
  		console.log("离开" + memberId);
		getRoomList();
	});
}
//退出频道
function quitChannel(){
	channel.leave();
}
//监听网页关闭
window.onbeforeunload = function () {  
    if($("#user_photo_main").attr("src") != "/mychat/img/empty.jpg"){
        $("#onMain").trigger('click');//下主持    
    };
    $(".chat-shangmai-btn").html("下麦");
    $(".chat-shangmai-btn").trigger("click");
    quitChannel();//退出频道
    logout();//退出登录
    updataVideo(1,position);
}
//获取token
function getToken(_cname){
    useruid = Math.round(Math.random() * 90000000 + 10000000); 
	$.ajax({
		url:"https://peiwan.wdzxiu.com/portal/chat/user",
		dataType:"json",
		data:{"uid":useruid,"cname":_cname},
		success:function(e){
            e = eval(e.data);
			if(e.is_login != 0){
                if(e.yue == undefined)
                    e.yue = 0;
				user = new User(e.uid,e.nickname,0,e.avatar,0,1,e.yue);
            }
			else{
				user = new User(useruid,"游客" + useruid,0,"null",2,0,0);
            }
			//初始化发言
            sendmeg = new sendMeg(0,0,0,0,0,0,0,0,0,0);
            //初始化送礼结构体
            sendGift = new sendGift(1,0,0);
            TOKEN_OR_KEY = e.token;//更新TOKEN
            setTimeout("init()",2000);
		},
		error:function(e){
           user = new User(useruid,"游客" + useruid,0,"null",3,0,0);
           init();
           toastMakeText("客户端产生错误，准备重载……");
           //setTimeout("window.location.reload()",3000);
		}
	})
}
function init(){
    join();//加入频道
            //创建音频流
    initsteam();
            //远程音频监听
    subscribe();
            //初始化RTM
    initRTM(APPID);
    login(user.uid);//登录
    createChannel();//创建频道 
    updataVideo(2,-1);//同步麦序信息
    setTimeout('initEmoji()',1000);
    setTimeout('initGiftList(function(){})',1000);
    setTimeout('joinChannel()',3000);//创建频道并进入
    setTimeout('getNumList()',3000);//初始化排行榜
    initMangerMod();
    getPower();
    $("#chatHeadYkNickname").html(user.name);//设置显示昵称
    $(".gift-my-money").find('p').find('font').html(user.count);//设置显示昵称
}