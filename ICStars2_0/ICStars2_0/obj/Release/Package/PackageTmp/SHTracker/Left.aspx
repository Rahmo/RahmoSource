<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="ICStars2_0.Left" %>

<%@ Import Namespace="ICStars2_0.Components" %>

<!DOCTYPE html>

<html>
<head>
    <title>Left</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width" />
    <script src="../Scripts/jquery-1.10.2.js"></script>
    <style type="text/css">
        body,html{
            overflow-x:hidden;
        }
        body, nav {
            margin: 0;
            padding: 0;
            background: #EEEEEE;
        }

        h1 {
            font-size: 14px;
            text-align: center;
            padding: 0;
            margin: 0;
            color: #000;
            height: 32px;
            line-height: 32px;
            background: #EEEEEE;
        }
         nav {
            margin: 0;
            padding: 0;
            width: 240px;
            background: aliceblue;
        }
    </style>
    <link href="../Scripts/jquery.menu-light.css" rel="stylesheet" />
    <script src="../Scripts/jquery.menu.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("nav>ul").menu();
        });

    </script>
</head>
<body>
    <h1 class="title">My Menu
    </h1>
    <nav>
        <%= TreeViewHelper.TreeView(Roles.GetRolesForUser())%>
    </nav>
</body>
</html>
