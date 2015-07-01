
        var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
$(document).ready(function() {
    $("table tr.item").each(function() {
        var d = new Date($(this).find("td:eq(1)").text());
        $(this).find("td:eq(0)").html(dayNames[d.getDay()]);
    });
    var hoursAtSite = 0;
    var trainingHours = 0;
    $("table tr.item").each(function() {
        var v = $(this).find("td:eq(2)").text().trim();
        if (v != "") {
            hoursAtSite += parseFloat(v);
        }
        var v2 = $(this).find("td:eq(3)").text().trim();
        if (v2 != "") {
            trainingHours += parseFloat(v2);
        }
    });
    $("table tr.summary td:eq(1)").html(hoursAtSite);
    $("table tr.summary td:eq(2)").html(trainingHours);
    var total = hoursAtSite + trainingHours;
    $("table tr.summary td:eq(3)").html("= " + total + " hours");
            
    $("tr.item:even").addClass("bg_f9f5f6");
    $("tr.item:gt(0)").hover(
        function () {
            $(this).addClass("hover");
        },
        function () {
            $(this).removeClass("hover");
        }
    );
});