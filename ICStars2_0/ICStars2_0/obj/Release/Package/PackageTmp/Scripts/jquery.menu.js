if (typeof jQuery !== 'undefined') {
	(function ($) {
		$.fn.menu = function () {
			if (!this.parent("nav").html()) return alert("jquery menu NEEDS a <nav></nav> container!");
			this.find("li").hover(
                function () {
                	$(this).addClass("hover");
                },
                function () {
                	$(this).removeClass("hover");
                }
            );
			this.find("li").each(function () {
				if ($(this).children("ul").html()) {
					$(this).addClass("expandable");
				}
			});
			this.find("li").click(function (e) {
				e.stopPropagation();
				if ($(this).hasClass("expandable")) {
					var level = $(this).parents(".expanded").length+1;
					$(this).removeClass("expandable").addClass("expanded level" + level).children("ul").slideDown();
				}
				else if ($(this).hasClass("expanded")) {
					$(this).removeClass("expanded").addClass("expandable").children("ul").slideUp();
				}
			});
		}
	}(jQuery));
}