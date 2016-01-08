function overevent(level, target) {
    level += 1;
    var targetWidth = 200;/*nav ul width:200px*/
    var margin = 2;/*nav ul li margin:2px 2px 0 2px;*/
    var marginTop = 30;/*nav ol li line-height: 20px;padding: 5px;*/
    var $target = $(target);
    var $ul = $target.find("ul");
    var $offset = $target.offset();
    var overwidth = $offset.left + targetWidth * (level == 0 ? 1 : 2) - $(window).width();
    if ($ul.html() != undefined) {
        var targetLeft = level == 0 ? 0 : targetWidth - margin * 2;
        if (overwidth > 0) {
            targetLeft = level == 0 ? targetLeft - overwidth : -1 * targetWidth;
        }
        $ul.css({ left: targetLeft, top: level > 0 ? -1 * margin : marginTop, "z-index": level * 100 });

        $ul.find("li").hover(function () { overevent(level, this); }, outevent);
        $ul.show();
        $ul.find("ul").hide();
    }
};
function outevent() {
    var $ul = $(this).find("ul");
    $ul.hide();
};

$(function() {
    $("header nav ol>li").hover(function() { overevent(-1, this); }, outevent);
    $("a[title]").each(function() {
        var a = $(this);
        var title = a.attr('title');
        if (title == undefined || title == "") return;
        a.data('title', title)
            .removeAttr('title')
            .hover(
                function () {
                    var offset = a.offset();
                    var aWidth = a.outerWidth();
                    var aHeight = a.outerHeight();
                    var left = offset.left + a.outerWidth() + 1;
                    var top = offset.top + aHeight + 10;
                    if (left > window.innerWidth - aWidth) {
                        left = offset.left + (aWidth > 200 ? aWidth / 2 : 0);
                    }
                    /*var scrollTop = $(document).scrollTop();
                    var tipHeight = 30;
                    if (top +tipHeight > $(window).height() + scrollTop) {
                        top = $(window).height() + scrollTop - tipHeight-7;
                    }*/
                    $("<div id=\"anchortitlecontainer\"></div>").appendTo($("body")).html(title).css({top:top,left:left}).delay(3000).fadeIn(function () {
                        var pop = $(this);
                        setTimeout(function () { pop.remove(); }, pop.text().length*80);
                    });
                },
                function() { $("#anchortitlecontainer").remove(); }
            );
    });
});