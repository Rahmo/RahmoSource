﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="ICStars2_0.Top" %>
<%@ Import Namespace="ICStars2_0.Model" %>

<!DOCTYPE html>

<Html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>Top</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        html, body, div, img
        {
            margin: 0px;
            padding: 0px;
        }
        div
        {
            float: left;
        }
        body
        {
            background-color: #006AAD;
            color: #ffffff;
            font-family: "微软雅黑";
            font-size: 13px;
            font-weight: 500;
            line-height: 25px;
        }
        .bar4
        {
            font-size: 13px;
            font-weight: bold;
            height: 30px;
            padding-left: 10px;
        }
        .bar4 li
        {
            color: #000000;
            display: inline;
            font-family: "微软雅黑";
            font-size: 13px;
            font-weight: 500;
            line-height: 30px;
            list-style-type: none;
            padding-left: 4px;
            padding-right: 4px;
        }
        a:link, a:visited
        {
            color: #000000;
            font-family: "微软雅黑";
            font-size: 13px;
            line-height: 25px;
            text-decoration: none;
        }
        .button2
        {
            cursor: pointer;
            margin-right: 5px;
            vertical-align: middle;
        }
        #logo
        {
            height: 54px;
            width: 100%;
        }
        #nav
        {
            width: 100%;
        }
        #navleft
        {
            width: 70%;
            float: left;
            background-image: url(/SHTracker/images/barbg.jpg);
            height: 36px;
            line-height:36px;
            color:#fff;
           font-size:15px;
            font-weight:bold;
        }
        #navleft a:link, #navleft a:hover, #navleft a:visited
        {
            color: #FFFFFF;
            font-size: 10px;
            line-height: 33px;
            text-decoration: none;
        }
        #navright a:link, #navright a:hover, #navright a:visited
        {
            color: #FFFFFF;
            font-size: 14px;
            line-height: 33px;
            text-decoration: none;
        }
        #navright
        {
            width: 30%;
            float: left;
            border-bottom: 1px solid rgb(51, 51, 51);
            height: 34px;
        }
        #navright img#barright
        {
            float: left;
        }
        #logo div{position:absolute;right:10px;top:10px;}
        #logo div span{font-weight:bold;}
    </style>
</head>
<body>
    <div id="logo">
        <img alt="" src="/SHTracker/images/logo.gif" height="54" />
        <div>
            Welcome:&nbsp;&nbsp;<span><%=User.Identity.Name%> &nbsp;&nbsp;<%=UserData.RealName%></span></div></div>
    <div id="nav">
        <div id="navleft">
            &nbsp;&nbsp;Current Term : <%=UserData.QuarterYear%> &nbsp;&nbsp; <a href="/Account/Logout">Change?</a>
        </div>
    <div id="navright">
        <img alt="" id="barright" src="/SHTracker/images/barright2.jpg" />
        <div class="bar4">
            <li>
                <a href="/Account/Logout" target="right"><img alt="" border="0" class="button2" src="/SHTracker/images/export.gif"/>Logout</a></li>
            <li>
                <a href="https://campusconnect.depaul.edu" target="_blank"><img alt="" border="0" class="button2" src="/SHTracker/images/handle.gif"/>Change Password</a></li>
        </div>
    </div>
    </div>
</body>
</Html>
