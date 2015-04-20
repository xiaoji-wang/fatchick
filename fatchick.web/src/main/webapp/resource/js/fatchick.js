function find() {
    var form = $("form[class='search']").eq(0);
    form.submit();
    form.find("input[name='word']").val('');
}

function logout() {
    $(".navbar").find("form[class='logout']").eq(0).submit();
}

function onMouseOver(me) {
    $(me).find('.setting_button').show();
}

function onMouseOut(me) {
    $(me).find('.setting_button').hide();
}

function addWebsite() {
    var url = $("#website").val();
    if (url && url.trim().length > 0) {
        $.post(path + "/website/addWebsite.data", {
            "url": url.trim()
        },
        function(res) {
            if (res.success) {
                var html = '<tr onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" id="'+res.data.id+'">';
                html += '<td><a href="' + res.data.url + '" target="_blank">' + res.data.title + '</a></td>';
                html += '<td style="width: 40px;">';
                html += '<a href="javascript:$("#page_dialog").modal("show")" class="setting_button" style="display: none;">';
                html += '<span class="glyphicon glyphicon-cog" aria-hidden="true" style="width: 100%; height: 100%;"></span>';
                html += '</a></td></tr>';
                $(".table").append($(html));
            } else {
                Message.Error(res.message);
            }
            $("#website").val(null);
        });
    } else {
        Message.Error("链接不能为空。");
    }
}

function categateDropdown(index){
	var text=$('.dropdown-menu').find('li').eq(index).find('a').eq(0).text();
	$('.dropdown-toggle[data-toggle="dropdown"]').find('span').eq(0).text(text);
}