function addPartners($button, callback,url) {
    var $keyword = $button.prev();
    if ($keyword.is(":hidden")) {
        $keyword.fadeIn();
        $button.text("Search");
        return;
    }
    $("ol.options").remove();
    var offset = $keyword.offset();
    callback(url,$keyword.val(), function (list) {
        $("<ol class=\"options\"><li><a href=\"javascript:\" title=\"close\" onclick=\"$(this).parent().parent().remove();\" class=\"close16gray\"></a>" + list.join("") + "</ol>")
            .appendTo($("body")).css({ position: "absolute", top: offset.top, left: offset.left }).slideDown()
            .find("li:not(:first)").click(function () {
                var $olOptions = $(this).parent();
                var $newElement = $(this).append("<a href=\"javascript:\" onclick=\"$(this).parent().remove();\" class=\"del16\" title=\"delete\"></a>");
                if ($button.parent().parent().text().indexOf($newElement.text()) > -1) {
                    $newElement.remove();

                } else {
                    $newElement.insertBefore($button.parent())
                        .unbind("click");
                }
                $keyword.val("");
                offset = $keyword.offset();
                $olOptions.css({ top: offset.top, left: offset.left });
            });
    });
}
function buildCommunityPartnerLiArray(url, keyword, callback) {
    $.getJSON(url, "name=" + keyword, function (data) {

        var list = new Array();
        for (var i = 0; i < data.length; i++) {
            list.push("<li>" + data[i].Name + "<input type=\"hidden\" name=\"communityPartnerIds\" value=\"" + data[i].ID + "\"/></li>");
        }
        callback(list);
    });
}

function buildIndividualPartnerLiArray(url, keyword, callback) {
    $.getJSON(url, "name=" + keyword, function (data) {

        var list = new Array();
        for (var i = 0; i < data.length; i++) {
            list.push("<li>" + data[i].Name + "<input type=\"hidden\" name=\"individualPartnerIds\" value=\"" + data[i].ID + "\"/></li>");
        }
        callback(list);
    });
}

