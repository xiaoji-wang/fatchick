/**
 * 
 */
var Message={
	Info:function(text,title){
		alert("Info:"+text);		
	},

	Error:function(text,title){
		alert("Error:"+text);
	}
}

function find() {
	var form = $("form[class='search']").eq(0);
	form.submit();
	form.find("input[name='word']").val('');
}

function logout() {
	$(".menu").find("form[class='logout']").eq(0).submit();
}

function selectItem(me) {
	$(".item").each(function(i, v) {
		$(v).removeClass('current');
	});
	if (me) {
		$(me).addClass('current');
	}
}

function initItemSelect(){
	$(".item").each(function(i, v) {
		var href=$(v).find('a').attr("href");
		if(location.href.indexOf(location.host+href)>=0){
			$(v).addClass('current');
		}else{
			$(v).removeClass('current');
		}
	});	
}

function onMouseOver(me){
	$(me).find('button').show();
	$(me).addClass('div-odd');
}

function onMouseOut(me){
	$(me).find('button').hide();
	$(me).removeClass('div-odd');
}

function addWebsite(){
	var url=$("#website").val();
	if(url&&url.trim().length>0){
		$.post(path+"/website/addWebsite.data",{"url":url.trim()},function(res){
			if(res.success){
				Message.Info(res.message);
			}else{
				Message.Error(res.message);
			}
		});
	}else{
		Message.Error("链接不能为空。");
	}
}

$(function(){  
	initItemSelect();
});  