<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ICStars2_0._Default" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>SHTracker System</title><link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--[if IE 6]>
   <style type="text/css">
   /*<![CDATA[*/ 
html {overflow-x:hidden;}
   /*]]>*/
   </style>
<![endif]-->

    <script type="text/javascript">
        function resize(obj) {
            if (obj.offsetHeight > 625 && window.screen.availHeight > 716) {
                obj.parentNode.cols = "260,15,*";
            }
        }
        window.onresize = function () {
            resize(document.getElementById("left"));
        }
    </script>
</head>
    <frameset rows="89,*,25" cols="*" frameborder="NO" border="0" framespacing="0">
    <frame src="Top.aspx" name="topFrame" scrolling="NO" border="0" noresize="noresize" />
    <frameset cols="260,15,*" border="0" frameborder="NO" framespacing="0">
        <frame name="left" id="left" src="Left.aspx" onload="resize(this);" />
        <frame id="center" src="Center.htm" />
        <frame name="right" id="right" src="<%=Request.QueryString["Url"]??"Right.aspx" %>" />
        <noframes>
            <body>
                <p>
                    This page used frameset, but your brower doesn't surport frameset.</p>
            </body>
        </noframes>
    </frameset>
    <frame src="Bottom.htm" scrolling="NO" border="0" noresize="noresize" />
</frameset>
</html>
