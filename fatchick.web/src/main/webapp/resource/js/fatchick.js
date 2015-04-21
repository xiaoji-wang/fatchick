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
                var index = $('.table').find('tr').length + 1;
                var html = '<tr onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" id="' + res.data.id + '">';
                html += '<td style="width: 15px;border-right: 1px solid #ddd;">' + index + '</td>';
                html += '<td>';
                html += '<a href="' + res.data.url + '" target="_blank">';
                html += '<img src="' + path + '/images/icon.png" style="width: 16px;height: 16px;"/>';
                html += '<span style="vertical-align:middle;">' + res.data.title + '</span>';
                html += '</a>';
                html += '</td>';
                html += '<td style="width: 40px;">';
                html += '<a style="display: none;" class="setting_button" href="javascript:void(0);" data-toggle="modal" data-target="#page_dialog" data-page_id="' + res.data.id + '">';
                html += '<span class="glyphicon glyphicon-cog" aria-hidden="true" style="width: 100%; height: 100%;"></span>';
                html += '</a>';
                html += '</td>';
                html += '</tr>';
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

function categateDropdown(index) {
    var text = $('.dropdown-menu').find('li').eq(index).find('a').eq(0).text();
    $('.dropdown-toggle[data-toggle="dropdown"]').find('span').eq(0).text(text);
}