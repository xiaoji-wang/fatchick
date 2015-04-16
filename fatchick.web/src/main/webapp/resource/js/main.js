function expand(id){
	var ele=$('#'+id);
	if(ele.attr('expand')=='true'){
		ele.css('transform','rotate(90deg)');
		ele.attr('expand','false');
	}else{
		ele.css('transform','rotate(180deg)');
		ele.attr('expand','true');
	}
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