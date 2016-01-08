$.ajaxSetup({
    cache: false
});
$(document).ready(function () {
    $("header nav ol li").unbind("mouseenter mouseleave");
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title', /*prevYear title nextYear*/
            right: 'month,agendaWeek,agendaDay'
        },
        snapMinutes:5,
        editable: false,
        eventClick: function (event, jsEvent, view) {
            if (event.originalID == 0) {
                dialog("/Calendar/Events/EventDetails/" + event.id, event.title, 600, 400);
            } else {
                dialog("/Calendar/Events/RepeatEventDetails/" + event.originalID + "?start=" + moment(event.start).format('MM/DD/YYYY, h:mm:ss a'), event.title, 600, 400);
            }
        },
        events: function (start, end, callback) {
            $.ajax({
                url: eventsUrl + "?sd=" + encodeURIComponent(start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate()) + "&ed=" + encodeURIComponent(end.getFullYear() + "-" + (end.getMonth() + 1) + "-" + end.getDate()),
                dataType: 'json',
                success: function (events) {
                    callback(events);
                },
                error: function () {
                    $("<div><b>You have to login to acquire the data!</b></div>").dialog({
                        modal: true,
                        width: 300,
                        height: 200,
                        title: "Authorization",
                        close: function (event, ui) {
                            window.location.reload();
                        },
                        buttons: {
                            Login: function () {
                                window.location.reload();
                            }
                        }
                    });
                }
            });
        },
        dayClick: function (date, allDay, jsEvent, view) {
            if (view.name != 'month')
                return;

            $('#calendar').fullCalendar('changeView', 'agendaDay')
                .fullCalendar('gotoDate', date);
        },
        eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
            $.ajax({
                type: "POST",
                url: "/Calendar/Events/Drop",
                data: "id=" + event.id + "&dayDelta=" + dayDelta + "&minuteDelta=" + minuteDelta + "&allDay=" + allDay + "&orginalID=" + event.originalID + "&start=" + moment(event.start).format('MM/DD/YYYY, h:mm:ss a') + "&end=" + moment(event.end).format('MM/DD/YYYY, h:mm:ss a'),
                dataType: 'json',
                success: function (data) {
                    if (data == "unauthorized") {
                        location.reload();
                        revertFunc();
                    }
                    if (data == false) {
                        revertFunc();
                    }
                },
                error: function () {
                    $("<div><b>You have to login to acquire the data!</b></div>").dialog({
                        modal: true,
                        width: 300,
                        height: 200,
                        title: "Authorization",
                        close: function (event, ui) {
                            window.location.reload();
                        },
                        buttons: {
                            Login: function () {
                                window.location.reload();
                            }
                        }
                    });
                }
            });
        },
        eventResize: function(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view) {
            $.ajax({
                type: "POST",
                url: "/Calendar/Events/Resize",
                data: "id=" + event.id + "&dayDelta=" + dayDelta + "&minuteDelta=" + minuteDelta,
                dataType: 'json',
                success: function (data) {
                    if (data == "unauthorized") {
                        location.reload();
                        revertFunc();
                    }
                    if (data == false) {
                        revertFunc();
                    }
                },
                error: function () {
                    $("<div><b>You have to login to acquire the data!</b></div>").dialog({
                        modal: true,
                        width: 300,
                        height: 200,
                        title: "Authorization",
                        close: function (event, ui) {
                            window.location.reload();
                        },
                        buttons: {
                            Login: function () {
                                window.location.reload();
                            }
                        }
                    });
                }
            });
        }
        /*viewRender: function (view, element) {
            //$('#calendar').fullCalendar({ events: "/Calendar/Events?sd=" + encodeURIComponent(view.visStart.getFullYear() + "-" + view.visStart.getMonth() + "-" + view.visStart.getDate()) + "&ed=" + encodeURIComponent(view.visEnd.getFullYear() + "-" + view.visEnd.getMonth() + "-" + view.visEnd.getDate()) });
        }*/
    });
    var offset = $("span.active").offset();
    if (offset) {
        $("body").append($("<img src=\"/images/upside-down-arrow.png\" />").css({ position: "absolute", left: offset.left + 10, top: offset.top - 15, height: 20 }));
    }
});

function dialog(url, title, width, height, isReload) {
    var dialogId = "ActiveDialog";
    var html = "<div id=\"" + dialogId + "\"><img style=\"position: absolute; left: 200px; top: 240px;\" src=\"/Images/ajax-loader_bar.gif\" /></div>";
    
    if (navigator.userAgent.indexOf("Safari") > -1) {
        html = "<div id=\"" + dialogId + "\"><b style=\"position: absolute; left: 200px; top: 240px;\">Loading...</b></div>";
    }
    $(html).dialog({
        modal: true,
        width: width ? width : 600,
        height: height ? height : 650,
        title: title,
        close: function (event, ui) {
            $(this).remove();
            if (isReload) {
                location.reload();
            }
        }
    });
    $(html).load(url, function (responseText) {
        if (responseText == "\"unauthorized\"") {
            location.reload();
        } else {
            $("#" + dialogId).html(responseText);
        }
    });
    
    return false;
}


