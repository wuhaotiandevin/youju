//var leimu="", leixing="";

$("#list li").click(function() {
	$("#list li").removeClass("listclick");
	$(this).addClass("listclick");
	$(".lists>li:nth-of-type(2)").css("display", "flex");

})

function fabu(this1) {
	console.log(this1);
	$("#leixing li").removeClass("listclick");
	$(this1).addClass("listclick");
	//		$(".banner2>div:nth-of-type(5)").css("display", "flex");
	$("#add").css("display", "block");
}
$("#button1").click(function() {
	$("input[name='fuwu']").val(getValue().leimu)
	$("input[name='xiaolei']").val(getValue().leixing)						 
	var listValue = getValue();
	console.log(listValue);
})

$("#list1 span").click(function() {
	$("#list1 span").css("border-color", "#b6b4b4")
	$("#list1 span").children().css("display", "none")
	$(this).css("border-color", "#FE7E00");
	$(this).children().css("display", "block")
	$("#list1 span").removeClass("listclick");
	$(this).addClass("listclick");

})
$("#list2 span").click(function() {
	$("#list2 span").css("border-color", "#b6b4b4")
	$("#list2 span").children().css("display", "none")
	$(this).css("border-color", "#FE7E00");
	$(this).children().css("display", "block")
	$("#list2 span").removeClass("listclick");
	$(this).addClass("listclick");

})
$("#clear").click(function() {
	$("#list2 span").css("border-color", "#b6b4b4")
	$("#list2 span").children().css("display", "none")
	$("#list1 span").css("border-color", "#b6b4b4")
	$("#list1 span").children().css("display", "none")
	$("#list1 span").removeClass("listclick");
	$("#list2 span").removeClass("listclick");
	//	$("#area").children().remove();

	$("select:eq(0)").val("-1");
	$("select:eq(1)").val("-1");
	$("select:eq(2)").val("-1");
})

function getValue() {
	var leimu = $(".listclick:eq(0)").attr("id");
	var leixing = $(".listclick:eq(1)").attr("id");
	//	var goods=
	var listValue = { leimu: leimu, leixing: leixing, };

	return listValue;
}

function getMapvalue() {
	var address = new Array();
	//	console.log($(".listclick:eq(1)").html())
	if($(".listclick:eq(0)").html() != undefined) {
		var leimu = $(".listclick:eq(0)").attr("id");
	}
	if($(".listclick:eq(1)").html() != undefined) {
		var leixing = $(".listclick:eq(1)").attr("id");
	}
	$("select").each(function(i) {
		address.push($("select:eq(" + i + ")").val());
	})
	var bgMapvalue = { leimu: leimu, leixing: leixing, address: address };
	return bgMapvalue;
}

function addGoods() {
	
	$("#goods").append("<tr>"+
        "<td><span class='upimg'><input type='file' name='upload[]' id='file' class='file'/><img src='../themes/simpleboot3/public/assets/img/img.png'/></span></td>"+
        "<td>"+
		"<select name='cat_id[]'>" +
		"<option>请选择</option>" +
		"<option>11111</option>" +
		"<option>22222</option>" +
		"<option>33333</option>" +
		"</select>" +
        "</td>"+
        "<td><input name='goods_name[]'/></td>"+
        "<td><input name='goods_remarks[]'/></td>"+
        "<td><a class='remove'>删除</a></td>"+
        "</tr>");
	
}

function filestyle(this1) {
	var path;
	path = $(this1).val();
	console.log(path)
	var geshi;
	geshis = path.split('.');
	geshi = geshis[geshis.length - 1]; //jpg 结果
	if(geshi == "jpg" || geshi == "png" || geshi == "gif" || geshi == "bmp") {
		return true;
	} else {
		return false;
	}
}
//获取页面get值
function GetRequest() {
	var url = location.search; //获取url中"?"符后的字串 
	var theRequest = new Object();
	if(url.indexOf("?") != -1) {
		var str = url.substr(1);
		strs = str.split("&");
		for(var i = 0; i < strs.length; i++) {
			theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
		}
	}
	return theRequest;
}