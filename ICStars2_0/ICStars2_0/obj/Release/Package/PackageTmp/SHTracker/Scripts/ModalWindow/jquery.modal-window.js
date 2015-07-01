﻿(function ($) {
    var ModalWindow = function () {
        var 
        windowX = 0,
        windowY = 0,
        /*0 means disabled; 1 means enabled;*/
        windowStatus = 0,
        /*背景ID*/
        backgroundId = "#windowBackground",
        /*窗口ID*/
        windowId = "#windowMain",
        /*触发按钮ID*/
        /*var buttonId = "#button";*/
        /*关闭按钮ID*/
        closeId = "#windowMainClose",
        welcomeUrl = "/Scripts/ModalWindow/welcome.htm",
        opacity = "0.7",
        _callback = null,
        /*创建HTML*/
        windowHTML = '<div id="windowMain"><div id="popupTitle"><a id="windowMainClose" title="关闭窗口">x</a><h1>提示</h1></div><iframe id="windowContent" scrolling="no" width="375" height="225" frameborder="0" src="' + welcomeUrl + '"></iframe></div><div id="windowBackground"></div>',
        init = function (url, title, width, height, isHtml, _opacity, _x, _y, callback) {

            if (url && isHtml && isHtml == true) {
                if ($("#windowMain iframe")[0]) {
                    $("#windowMain iframe").replaceWith("<div id=\"windowContent\" style=\"background:#FFF;\">" + url + "</div>");
                }
                else {
                    $("#windowMain #windowContent").html(url);
                }
            }
            else {
                /*如果先使用DIV就会把IFRAME替换掉，再使用IFRMAE时应该先恢复IFRAME的HTML*/
                if (!$("#windowMain iframe")[0]) {
                    $("#windowMain").empty();
                    $('<div id="popupTitle"><a id="windowMainClose" title="关闭窗口">x</a><h1>提示</h1></div><iframe id="windowContent" scrolling="no" width="375" height="225" frameborder="0" src="' + welcomeUrl + '"></iframe>').appendTo($("#windowMain"));

                    $(closeId).click(function () {
                        hideWindow();
                    });
                }
            }
            if (url && (!isHtml || isHtml == false)) {
                if ($.browser.msie) {
                    if (url.indexOf("?") > -1) {
                        url += "&rnd=" + Math.random();
                    }
                    else {
                        url += "?rnd=" + Math.random();
                    }
                }
                $("#windowMain iframe").attr("src", url);
            }
            if (width) {
                if (isHtml && isHtml == true) {
                    $("#windowMain #windowContent").css("width", width + "px");
                }
                else {
                    $("#windowMain #windowContent").attr("width", width);
                }
                $(windowId).css("width", width + "px");
            }
            if (height) {
                var h = height - 25;
                if (isHtml && isHtml == true) {
                    $("#windowMain #windowContent").css("height", h + "px");
                }
                else {
                    $("#windowMain #windowContent").attr("height", h);
                }
                $(windowId).css("height", height + "px");
            }
            if (title) { $("#windowMain #popupTitle h1").html(title); }
            if (_opacity) { opacity = _opacity; }
            if (_x) { windowX = _x; } else { windowX = 0; }
            if (_y) { windowY = _y; } else { windowY = 0; }
            if (callback) { _callback = callback; }
        },
        /*loading popup with jQuery magic!*/
        loadWindow = function () {
            /*loads popup only if it is disabled*/
            if (windowStatus == 0) {
                $(backgroundId).height($(document).height());
                $(backgroundId).css({
                    "opacity": opacity
                });
                if (opacity == 0) {
                    $(backgroundId).show();
                    $(windowId).show();
                }
                else {
                    $(backgroundId).fadeIn("slow");
                    $(windowId).fadeIn("slow");
                }
                windowStatus = 1;
            }
        },
        closeWindow = function () {
            /*hide window only if it is enabled*/
            if (windowStatus == 1) {
                if ($("#windowMain iframe")[0]) {
                    $("#windowMain iframe").attr("src", welcomeUrl);
                }
                $(backgroundId).hide();
                $(windowId).hide();
                windowStatus = 0;
            }
        },
        /*hide window*/
        hideWindow = function (callback) {
            if (callback) { _callback = callback; }
            /*hide window only if it is enabled*/
            if (windowStatus == 1) {
                if ($("#windowMain iframe")[0]) {
                    $("#windowMain iframe").attr("src", welcomeUrl);
                }

                if (opacity == 0) {
                    $(backgroundId).hide();
                    $(windowId).hide();
                }
                else {
                    $(backgroundId).fadeOut("slow");
                    $(windowId).fadeOut("slow");
                }
                windowStatus = 0;
                if (_callback && typeof (_callback) == "function") {
                    _callback.call();
                    _callback = null;
                    //                    window.cl = callback;
                    //                    setTimeout(function () { cl.call(); }, 1000);
                }
            }
        },
        /*centering window*/
        centerWindow = function () {
            /*request data for centering*/
            var windowWidth = document.documentElement.clientWidth;
            var windowHeight = document.documentElement.clientHeight;
            var popupHeight = $(windowId).height();
            var popupWidth = $(windowId).width();
            /*centering*/
            if (windowX == 0) { windowX = windowWidth / 2 - popupWidth / 2; }
            if (windowY == 0) { windowY = windowHeight / 3 - popupHeight / 3; }
            if (windowY < 0) windowY = 0;
            windowY += $(document).scrollTop();

            $(windowId).css({
                "position": "absolute",
                "top": windowY,
                "left": windowX
            });
            /*only need force for IE6*/

            $(backgroundId).css({
                "height": windowHeight
            });
        };

        return {
            ready: function () {
                /*初始化*/
                $(document).ready(function () {
                    $(windowHTML).appendTo(document.body);
                    /*CLOSING POPUP*/
                    /*Click the x event!*/
                    $(closeId).click(function () {
                        hideWindow();
                    });
                    /*Click out event!*/
                    /*$(backgroundId).click(function () {
                    hideWindow();
                    });*/
                    /*Press Escape event!*/
                    $(document).keypress(function (e) {
                        if (e.keyCode == 27 && windowStatus == 1) {
                            hideWindow();
                        }
                    });
                });
            },
            //当isHtml为true时，url输入HTML
            show: function (url, title, width, height, isHtml, _opacity, _x, _y, callback) {
                if (windowStatus == 1) closeWindow();
                init(url, title, width, height, isHtml, _opacity, _x, _y, callback);
                /*centering with css*/
                centerWindow();
                /*load window*/
                loadWindow();
            },
            showVancl: function (msg, title, width, height, _opacity, _x, _y, callback) {
                if (windowStatus == 1) closeWindow();
                init("<ul class=\"modelwindow\"><li>" + msg + "</li><li><a onclick=\"$.hideModalWindow();return false;\" class=\"button\">关闭窗口</a></li></ul>", title, width, height, true, _opacity, _x, _y, callback);
                /*centering with css*/
                centerWindow();
                /*load window*/
                loadWindow();
            },
            hide: function (callback) {
                hideWindow(callback);
            },
            close: function () {
                closeWindow();
            }
        };


    } ();
    ModalWindow.ready();
    $.extend({
        showModalWindow: ModalWindow.show,
        showVanclModalWindow: ModalWindow.showVancl,
        hideModalWindow: ModalWindow.hide,
        closeModalWindow: ModalWindow.close
    });
})(jQuery);

