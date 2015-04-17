/**
 * 
 */
var Message = {
    Info: function(text, title) {
        alert("Info:" + text);
    },

    Error: function(text, title) {
        alert("Error:" + text);
    },

    Prompt: function() {
        var html = '<div style="z-index:999;background-color:#000000;opacity:0.2;width:100%;height:100%;position:absolute;top:0;"></div>';
        $('body').append(html);
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

function initItemSelect() {
    $(".item").each(function(i, v) {
        var href = $(v).find('a').attr("href");
        if (location.href.indexOf(location.host + href) >= 0) {
            $(v).addClass('current');
        } else {
            $(v).removeClass('current');
        }
    });
}

function onMouseOver(me) {
    $(me).find('button').show();
    $(me).addClass('div-odd');
}

function onMouseOut(me) {
    $(me).find('button').hide();
    $(me).removeClass('div-odd');
}

function removeWebsite(id) {
    Message.Prompt(id);
}

function addWebsite() {
    var url = $("#website").val();
    if (url && url.trim().length > 0) {
        $.post(path + "/website/addWebsite.data", {
            "url": url.trim()
        },
        function(res) {
            if (res.success) {
                var html = '<div style="padding: 8px 3px; border-bottom: dashed 1px #a0a0a0;" onmouseover="onMouseOver(this)" onmouseout="onMouseOut(this)">';
                html += '<a href="' + res.data.url + '" target="_blank">' + res.data.title + '</a>';
                html += '<button class="button-xsmall pure-button" style="float: right;display: none;">';
                html += '<i class="fa fa-cog fa-lg"></i>';
                html += '</button>';
                html += '</div>';
                $(".website").before($(html));
            } else {
                Message.Error(res.message);
            }
            $("#website").val(null);
        });
    } else {
        Message.Error("链接不能为空。");
    }
}

$(function() {
    initItemSelect();
});