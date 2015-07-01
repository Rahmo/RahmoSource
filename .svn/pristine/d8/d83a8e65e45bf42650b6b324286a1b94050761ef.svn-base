if (typeof jQuery !== 'undefined') {
	(function ($) {
	    $.fn.CommengdpuMenu = function(currentAbsolutePath) {
	        if (this.parent("nav").length == 0) return alert("jquery menu NEEDS a <nav></nav> container!");
	        this.find("li").hover(
	            function() {
	                $(this).addClass("hover");
	            },
	            function() {
	                $(this).removeClass("hover");
	            }
	        );
	        this.find("li").each(function() {
	            if ($(this).children("ul").length > 0) {
	                $(this).addClass("expandable");
	            }
	        });
	        this.find("li").click(function(e) {
	            e.stopPropagation();
	            if ($(this).hasClass("expandable")) {
	                var level = $(this).parents(".expanded").length + 1;
	                $(this).removeClass("expandable").addClass("expanded level" + level).children("ul").slideDown();
	            } else if ($(this).hasClass("expanded")) {
	                $(this).removeClass(function(index, css) {
	                    return (css.match(/\blevel\S+/g) || []).join(' ') + " expanded";
	                }).addClass("expandable").children("ul").slideUp();
	            }
	        });
            /*select current active menu*/
	        var $expandedLi = $(this).find("a[href]").filter(function () {
	            return this.href.toLowerCase().indexOf(currentAbsolutePath.toLowerCase()) > -1;
	        }).parent();
	        
	        $expandedLi.prop("id", "active");
	        var clickEventsStack = new Array();
	        while ($expandedLi.length > 0 && !$expandedLi.is(":visible")) {

	            clickEventsStack.push($expandedLi);
	            $expandedLi = $expandedLi.parent().parent();
	        }
	        clickEventsStack.push($expandedLi);
	        while (clickEventsStack.length > 0) {
	            clickEventsStack.pop().click();
	        }
	        /*select current active menu----end*/
	        return this;
	    };
	}(jQuery));
}