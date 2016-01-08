<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="ICStars2_0.Account.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../SHTracker/Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($("form").valid() == false) return false;
            $.ajax({
                type: "GET",
                url: "/Account/ajax.aspx",

                async: false,
                success: function (data) {
                    alert(data);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
