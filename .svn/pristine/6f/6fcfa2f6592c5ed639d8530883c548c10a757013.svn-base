
$(function() {
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
                    var maxTop = $(document).outerHeight() + $(document).scrollTop()-54;
                    top = top > maxTop ? maxTop : top;
                    
                    if (left > window.innerWidth - aWidth) {
                        left = offset.left + (aWidth > 200 ? aWidth / 2 : 0);
                    }
                    $("<div id=\"anchortitlecontainer\"></div>").appendTo($("body")).html(title).css({top:top,left:left}).delay(2000).fadeIn(function () {
                        var pop = $(this);
                        setTimeout(function () { pop.remove(); }, pop.text().length*80);
                    });
                },
                function() { $("#anchortitlecontainer").remove(); }
            );
    });
});