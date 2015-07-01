$(document).ready(function () {
    $("#search").click(function () {
        $("ol.options").remove();
        search($(this), buildLiArray, searchResultUrl);
    });
});
function search($button, callback, url) {
    var $keyword = $button.prev();
    var offset = $keyword.offset();
    callback(url, $keyword.val(), function (list) {

        $("<ol class=\"options\"><li><a href=\"javascript:\" title=\"close\" onclick=\"$(this).parent().parent().slideUp(100);\" class=\"close16gray\"></a>" + list.join("") + "</ol>")
            .appendTo($("body")).css({ position: "absolute", top: offset.top + $keyword.outerHeight(), left: offset.left, width: $keyword.outerWidth() }).slideDown();
    });
}
function buildLiArray(url, keyword, callback) {
    $.getJSON(url, "name=" + keyword, function (data) {

        var list = new Array();
        if (data == "") {
            list.push("<li>No Result!</li>");
        }
        for (var i = 0; i < data.length; i++) {
            list.push("<li><a href=\"" + data[i].Link + "\" target=\"_blank\">" + data[i].Name + "</a></li>");
        }
        callback(list);
    }).fail(function () {
        if (confirm("You need to refresh the page to proceed, refresh?")) {
            location.reload();
        }
    });
}