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
$(function(){  
	initItemSelect();
});  