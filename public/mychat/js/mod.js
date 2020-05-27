
	//0普通用户 1管理员
	//获取房间列表
	function getRoomList(){
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/channel",
			type:"get",	
			dataType:"json",
			success:function(e){
				var size = e.data.data.total_size;
				var cname;
				$("#chatRoomList").html("");
				for(var i = 0;i < size;i ++){
					cname = e.data.data.channels[i].channel_name;
					$("#chatRoomList").append("<div class='chat-room-all-item' id='channel_item_"+ cname + "'><p class='chat-room-name chat-room-part-name' style='display: flex; align-items: center; background: transparent;' alt='hide'><span class='chat-room-name-zhan'><img src='/mychat/img/sanjiaoicon.png'></span><span style='flex:1; display:flex; flex-direction:column; margin:0 8px; font-style:normal; font-size:14px; text-align:center'><e style='font-size:14px;color: #333;font-size:18px;'>" +"语聊大厅"+"</e><e style='font-size:14px; color:#999;'> </e></span><span class='chat-room-name-count' id='user_size_" +cname + "'>（0）</span><br><div style='display: none;' id='channelroom_"+ cname+ "'></div></div>" );
					// getChannelName(function(e){
					// 	for(let i = 0;i < 2;i ++){
					// 		$("#chatRoomList").append("<div class='chat-room-all-item' id='channel_item_"+ e[i].ename + "'><p class='chat-room-name chat-room-part-name' style='display: flex; align-items: center; background: transparent;' alt='hide'><span class='chat-room-name-zhan'><img src='/mychat/img/sanjiaoicon.png'></span><span style='flex:1; display:flex; flex-direction:column; margin:0 8px; font-style:normal; font-size:14px; text-align:center'><e style='font-size:14px;color: #333;font-size:18px;'>" +e[i].ename+"</e><e style='font-size:14px; color:#999;'>测试使用</e></span><span class='chat-room-name-count' id='user_size_" +e[i].ename + "'>（0）</span><br><div style='display: none;' id='channelroom_"+ e[i].ename + "'></div></div>" );
					// 		getChannelUser(e[i].ename );
					// 	}
					// });
				}
				getChannelUser(cname);
			},
			error:function() {
				console.log("获取房间列表失败");
			}
		})
	};
	//获取对应名称
	function getChannelName(CallBack){
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/creat_channel",
			dataType:"json",
			success:function(e){
				CallBack(e.data);
			}
		})
	}
	//获取频道人数
	function getChannelUser(channel_name){
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/channel_users",
			data:{"cname":channel_name},
			dataType:"json",
			success:function(e){
				e = eval(e.data);
				var size = e.data.audience_total;
				if(size == undefined)
					size = 0;
				var name;
				$("#user_size_" + channel_name).html("(" + size + ")");
				for(var i = 0;i < size;i ++){
					var data = e.data.audience[i];
					$("#channelroom_" + channel_name).append("<div class='chat-room-users'><div nickname='"+data.nickname+"' class='chat-room-item-empty chat-room-item' style='order:1000; display:flex;' account='"+data.id+"'><span class='chat-room-span-header'><img class='chat-room-img-header' onerror='this.src=&#39;/mychat/img/noavatar_1.jpg&#39;;' src='"+data.avatar+"'></span><span class='chat-talk-light chat-room-img-online' style='display:none;'></span><div style='display:flex;flex-direction: column;justify-content: flex-start;margin-left:10px;'><div class='chat-room-item-icons'><span style='display:none;'><img class='img-xin-icon' src='/mychat/img/xinicon.png'></span><span></span></div><span class='chat-room-name' style='display:inline-block;'><font style='color:#666'>"+data.nickname+"</font></span></div></div></div>");
				}
				//加载完成绑定点击事件
				$(".chat-room-part-name").off('click').on('click',function(e){
   					lawn($(this));
   					e.stopPropagation();
					e.preventDefault();
   				});
   				$(document).on('click',".chat-room-item-empty",function(){
   					var id;
			    	if($(this).attr("uid") == undefined)
			    		id = $(this).attr("account");
			    	else
			    		id = $(this).attr("uid");
			    	$("#user_id_cname").html(id);
			    	$(".user_mod_win").show();
   				})
			}
		})
	}
	//踢人操作
	function setTicket(cname,uid,time,that){
		if(user.authorization < 2){
			that.hide();
			console.log("无权限，被驳回");
			return;
		}
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/create_rule",
			type:"POST",
			dataType:"json",
			data:{"cname":cname,"uid":uid,"time":time},
			success:function(e){
				e = eval(e.data);
				console.log(e);
			},
			error:function(){
				alert("踢人操作不成功，请稍后重试！");
			}
		})
		if(that != undefined)
			that.hide();
	}
	//获取服务端的踢人规则列表。
	function getTicketRules(){
		if(user.authorization < 2){
			that.hide();
			return;
		}
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/rule",
			type:"get",
			dataType:"json",
			success:function(e){
				e = eval(e.data);
				console.log(e);
			}
		})
	}
	//更新服务端踢人的生效时间
	function updateTicketTime(id,time){
		if(user.authorization < 2){
			that.hide();
			return;
		}
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/update_rule",
			type:"get",
			dataType:"json",
			data:{"id":id,"time":time},
			success:function(e){
				e = eval(e.data);
				console.log(e);
			}
		})
	}
	//删除服务端踢人规则。
	function deleteTicket(id){
		if(user.authorization < 2){
			that.hide();
			return;
		}
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/delete_rule",
			type:"get",
			dataType:"json",
			data:{"id":id},
			success:function(e){
				e = eval(e.data);
				console.log(e);
			}
		})
	};
	//获取排行榜
	function getNumList(){
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/bangdan",
			dataType:"json",
			success:function(e){
				$("#dayListController").html();
				for(let i = 0;i < 10;i ++){
					if(i <= 2)
						var HTML = "<li class='carpai carpai"+(i+1)+"'><div class='car-qs-div'><img class='carqiansan-header' onerror='this.src='/mychat/img/noavatar_1.jpg'' src='"+e.data[i].avatar+"'><div class='car-qs-guan car-qs-guan-"+(i + 1)+"'></div></div><div class='carpaihang-userinfo' style='flex:1'><div class='flex carpaihang-userinfo-name'>"+e.data[i].user_login + "<br>";
					else
						var HTML = "<li class='paihang-other'><div class='car-qs-paimingnum'>" +(i + 1)+ "</div><div class='carpaihang-userinfo' style='flex:1'><div class='flex carpaihang-userinfo-name'>"+e.data[i].user_login + "<br>";
					if(e.data[i].sex == 1)
						HTML += "<span class='sex-girl'>♀</span>";
					else
						HTML += "<span class='sex-man'>♂</span>";
					HTML += "</div><div><img src='/mychat/img/4.png'></div></div><div class='flex' style='color: #666; align-items:center;'>"+e.data[i].gongxian+"&nbsp;</div></li>";
					$("#dayListController").append(HTML);
				}
			}
		})
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/zhoubangdan",
			dataType:"json",
			success:function(e){
				e = eval("(" + e + ")");
				$("#weekListController").html();
				for(let i = 0;i < 10;i ++){
					if(i <= 2)
						var HTML = "<li class='carpai carpai"+(i+1)+"'><div class='car-qs-div'><img class='carqiansan-header' onerror='this.src='/mychat/img/noavatar_1.jpg'' src='"+e.data[i].avatar+"'><div class='car-qs-guan car-qs-guan-"+(i + 1)+"'></div></div><div class='carpaihang-userinfo' style='flex:1'><div class='flex carpaihang-userinfo-name'>"+e.data[i].user_login + "<br>";
					else
						var HTML = "<li class='paihang-other'><div class='car-qs-paimingnum'>" +(i + 1)+ "</div><div class='carpaihang-userinfo' style='flex:1'><div class='flex carpaihang-userinfo-name'>"+e.data[i].user_login + "<br>";
					if(e.data[i].sex == 1)
						HTML += "<span class='sex-girl'>♀</span>";
					else
						HTML += "<span class='sex-man'>♂</span>";
					HTML += "</div><div><img src='/mychat/img/4.png'></div></div><div class='flex' style='color: #666; align-items:center;'>"+e.data[i].gongxian+"&nbsp;</div></li>";
					$("#weekListController").append(HTML);
				}
			}
		})
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/yuebangdan",
			dataType:"json",
			success:function(e){
				e = eval("("+e+")");
				$("#monthListController").html();
				for(let i = 0;i < 10;i ++){
					if(i <= 2)
						var HTML = "<li class='carpai carpai"+(i+1)+"'><div class='car-qs-div'><img class='carqiansan-header' onerror='this.src='/mychat/img/noavatar_1.jpg'' src='"+e.data[i].avatar+"'><div class='car-qs-guan car-qs-guan-"+(i + 1)+"'></div></div><div class='carpaihang-userinfo' style='flex:1'><div class='flex carpaihang-userinfo-name'>"+e.data[i].user_login + "<br>";
					else
						var HTML = "<li class='paihang-other'><div class='car-qs-paimingnum'>" +(i + 1)+ "</div><div class='carpaihang-userinfo' style='flex:1'><div class='flex carpaihang-userinfo-name'>"+e.data[i].user_login + "<br>";
					if(e.data[i].sex == 1)
						HTML += "<span class='sex-girl'>♀</span>";
					else
						HTML += "<span class='sex-man'>♂</span>";
					HTML += "</div><div><img src='/mychat/img/4.png'></div></div><div class='flex' style='color: #666; align-items:center;'>"+e.data[i].gongxian+"&nbsp;</div></li>";
					$("#monthListController").append(HTML);
				}
			}
		})
	}
	//获取用户信息
	function getUserInfo(_uid,CallBack){
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/user1",
			dataType:"json",
			data:{"uid":_uid,"cname":"chaoshikong"},
			async:true,
			success:function(e){
				e = eval(e.data);
				CallBack(e);
			}
		})
	}
	//初始化礼物列表
	function initGiftList(CallBack){
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/gifts",
			dataType:"json",
			success:function(e){
				var count = e.count;
				$("#giftTab1").html("");
				CallBack(e);
				for(let i = 0;i < count;i++){
					var HTML = "<div title='"+e.data[i].name+"' isshow='0' giftname='"+e.data[i].name+"' giftid='"+e.data[i].id+"' pic='"+e.data[i].image+"' gifpic='img/1325691548937036.svga'diamond='10' price='100' class='chat-center-gift-item'><div><img src='"+e.data[i].image+"'></div><div>"+e.data[i].name+"</div><div class='flex' style='font-size:12px; color:#666; justify-content:center; align-items:center;'><img style='width:12px; height:9px; margin-right:3px;' src='/mychat/img/zuanshi.png'> ￥"+e.data[i].price+"</div></div>"
					$("#giftTab1").append(HTML);
				}
			}
		})
	}
	//赠送礼物
	function sendGiftOnline(sendGift){
		if(user.isLogin == 0){
			toastMakeText("请登录！");
			return false;
		}else if(user.uid == sendGift.id){
			// toastMakeText("不能赠送给自己！");
			// return false;
		}
		$.ajax({
    		url:"https://peiwan.wdzxiu.com/portal/chat/give_gift",
    		dataType:"json",
    		type:"get",
    		data:{"id":sendGift.id,"uid":sendGift.uid,"num":sendGift.num},
    		success:function(e){
    			//更新
    			if(e.code == 0){
    				toastMakeText(e.message);
    			}else if(e.code == 1){
    				$("#font-my-yue").html(e.data.yue);
    				sendGift.fromId = user.uid;
    				sendMessage(JSON.stringify(sendGift));
    				toastMakeText("赠送成功!");
    			}
    			
    			
    		},
    		error:function(err){
    			toastMakeText("网络繁忙，稍后重试！");
    		}
    	})
	}
	//获取公告信息
	function getNotice(_cname,CallBack){
		// $.ajax({
		// 	url:"https://peiwan.wdzxiu.com/portal/chat/notice",
		// 	dataType:"json",
		// 	data:{"cname":_cname},
		// 	success:function(e){
		// 		CallBack(e.data.notice);
		// 	}
		// })
		CallBack("你已经进入派单厅，超时空倡导绿色直播。直播内容和评论严禁包含政治、低俗色情、吸烟酗酒等内容 。任何冒充官方发布消息的，都将会被平台严惩。<br>——————————————导师试音流程<br>1：需要试音的导师点击（左上角的上麦）在公屏扣1示意主持<br>2：上麦的导师，在没得到老板或主持示意，导师必须闭麦等待安排<br>3：主持安排试音开始时，大神按顺序接下麦克（简短的介绍）试音完毕记得甩给下一麦克，关闭麦克 风<br>聊天厅守则<br>1：任何人不得在聊天厅内发布：禁止涉黄，暴力，政治，宗教话题<br>2：导师不得在聊天厅内公屏接单以及引导老板给自己点单<br>3：导师不得在聊天厅内私自报自己的单价<br>4：无开通资质的导师不得跳单<br>5：任何人不得在聊天厅内恶意攻击导师、老板、主持<br>违反以上规则的，一律按违规处理！请大家一起维护好派单厅的规则。<br>");
	}
	//上麦
	function updataVideo(type,_position){
		if(type == 0){
			$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/maixu",
			dataType:"json",
			data:{"type":"shangmai","id":_position,"uid":user.uid,"nickname":user.name,"avatar":user.photoPath},
			success:function(e){
				
			},
			error:function(){
				toastMakeText("系统繁忙，麦序同步失败");
			}
		})
		}else if(type == 1){
			$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/maixu",
			dataType:"json",
			data:{"type":"xiamai","id":_position,"uid":user.uid,"nickname":user.name,"avatar":user.photoPath},
			success:function(e){
				
			},
			error:function(){
				toastMakeText("系统繁忙，麦序同步失败");
			}
			})
		}else if(type == 2){
			$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/maixu",
			dataType:"json",
			data:{"type":"list"},
			success:function(e){
				var size = 9;
				e = eval("(" + e + ")");
				for(var i = 0;i < size;i ++){
					let _uid = e.data[i].uid;
					let _pos = e.data[i].id;
					let _photoPath = e.data[i].avatar;
					let _nick = e.data[i].nickname;
					if(_uid !== 0)
					{
						getUserInfo(_uid,function(e){
							var _user = new User();
							_user.uid = _uid;
							_user.position = _pos;
							_user.name = _nick;
							_user.photoPath = _photoPath;
							if(_pos == 1)
								upMainVideo(_user);
							else
								upVideo(_user);
					})
					}
				}
			}
			})
		}
	}
	//获取权限
	function getPower(){
		$.ajax({
			url:"https://peiwan.wdzxiu.com/portal/chat/is_zhuchi",
			dataType:"json",
			data:{"uid":user.uid,"cname":"chaoshikong"},
			success:function(e){
				e = eval(e.data);
				if(e.is_zhuchi == 1){
					user.authorization = 4;
				}else{
					user.authorization = 3;
				}
			}
		})
	}
	//用户信息
	User = function(_uid,_name,_vipLV,_photoPath,_authorization,_isLogin,_count,_position){
		var json = {};
		json.uid = _uid;
		json.name = _name;
		json.photoPath = _photoPath; 
		json.vipLV = _vipLV;
		json.authorization = _authorization  == undefined ? 1 : _authorization;//0游客1普通用户2管理员
		json.isLogin = _isLogin;//0未登录1登录
		json.count = _count;
		json.position = _position;
		json.type = "User";
		return json;
	}
	//发言结构体
	sendMeg = function(_uid,_name,_toId,_photoPath,_vipLV,_message,_upVideo,_downVideo,_upMainVideo,_downMainVideo,_position){
		var json = {};
		json.uid = _uid;
		json.name = _name;
		json.toId = _toId;
		json.photoPath = _photoPath;
		json.vipLV = _vipLV;
		json.message = _message;
		json.upVideo = _upVideo;
		json.downVideo = _downVideo;
		json.upMainVideo = _upMainVideo;
		json.downMainVideo = _downMainVideo;
		json.position = _position;
		json.type = "sendMeg"
		return json;
	}
	//赠送礼物
	sendGift = function(id,uid,num,fromId){
		var json = {};
		json.id = id;
		json.uid = uid;
		json.num = num;
		json.fromId = fromId;
		json.type="sendGift";
		return json;
	}
	//踢下麦
	modVideo = function(_id,_position){
		var json = {};
		json.uid = _id;
		json.position = _position;
		json.type ="modVideo";
		return json;
	}