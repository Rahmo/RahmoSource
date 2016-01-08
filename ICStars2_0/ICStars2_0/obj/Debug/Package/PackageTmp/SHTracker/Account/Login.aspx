<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ICStars2_0.Account.Login" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>
<%@ Import Namespace="ICStars2_0.Model.Items" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>SHTracker System Login</title>
    <script src="/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate-1.10.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var _top = window.top;
        while (_top.top && _top.top != _top) {
            _top = _top.top;
        }
        if (_top != window) {
            _top.location = window.location;
        }
        $(function () {
            $("form").validate();
        });
    </script>
    <style type="text/css">
        label.error{color:Red;float:right;}
        /* CSS Document */
        th
        {
            background-image: url(/SHTracker/images/barbg3.jpg);
            height: 28px;
            text-align: left;
        }
        td
        {
            line-height: 25px;
            padding-right: 10px;
        }
        li
        {
            border: 0 none;
            margin: 0;
            padding: 0px;
        }
        li span
        {
            display: inline-block;
            line-height: 24px;
        }
        .global
        {
            margin: 0 auto;
            clear: both;
        }
        .logo
        {
            border-bottom: 2px solid #006AAD;
            margin-left: 200px;
            margin-right: 200px;
            margin-top: 30px;
        }
        .kuang
        {
            margin-top: 20px;
            background-color: #f4f4f4;
            width: 490px;
            height: 350px;
            border: 1px solid #006AAD;
            padding: 5px;
        }
        .regist
        {
            height: 25px;
            width: 490px;
            background-color: #006AAD;
        }
        
        .bar
        {
            height: 33px;
            background-image: url(/SHTracker/images/bg2.jpg);
        }
        .bar span
        {
            font-size: 15px;
            font-weight: 550;
            line-height: 33px;
            margin-left: 10px;
        }
        .text
        {
            border: 1px solid #999999;
            height: 16px;
            margin-right: 4px;
            margin-left: 4px;
            width: 150px;
        }
        .radio
        {
            margin-left: 10px;
            margin-right: 3px;
        }
        .button
        {
            vertical-align: middle;
            margin-right: 10px;
            margin-bottom: 0px;
            margin-left: 5px;
            cursor: pointer;
        }
        .white
        {
            color: #FFF;
            font-size: 14px;
            font-family: "微软雅黑";
            margin-left: 10px;
        }
        .bar2
        {
            position: absolute;
            bottom: 0px;
            right: 0px;
        }
        .trcol
        {
            background-color: #f9f5f6;
        }
        .red
        {
            color: Red;
        }
    
    .fieldset ol {
        padding: 0;
        list-style: none;
    }
    
        .fieldset ol li {
            padding-bottom: 5px;
        }
    
    .fieldset label {
        display: block;
        font-size: 1.2em;
        font-weight: 600;
    }
    
    .fieldset label.checkbox {
        display: inline;
    }
    
    .fieldset input[type="text"], 
    .fieldset input[type="password"] {
        border: 1px solid #787878;
        color: #333;
        margin: 5px 0 6px 0;
        padding: 5px;
        width: 300px;
    }
    
        .fieldset input[type="text"]:focus, 
        .fieldset input[type="password"]:focus {
            border: 1px solid #7ac0da;
        }
    
    .fieldset input[type="submit"] {
        background-color: #d3dce0;
        border: solid 1px #787878;
        cursor: pointer;
        font-size: 1.2em;
        font-weight: 600;
        padding: 7px;
    }
    td{ vertical-align: top;}
    </style>
</head>
<body>
<form id="form1" runat="server">
   <div class="global" align="center">
            <div class="logo" align="center">
                <img src="/SHTracker/images/logo.gif" /></div>
            <div class="kuang" align="left">
                <div class="regist" align="left">
                    <span class="white">Please Login</span></div>
                <div style="margin-left: 30px" class="fieldset">
                <table>
                    <tr>
                        <td><br/>
                Choose Term : <br/><%=DropDownListHelper.DropDownList("ddlQuarterYear",null, DropDownListHelper.BuildQuarterYearSelectListItems(),"class=\"required\" multiple=\"multiple\" style=\"height:150px;\"")%></td>
                        <td><br />
                    User ID：
                    <label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="text required" TabIndex="1"></asp:TextBox>
                    </label>
                    <br />
                    <br />
                    Password：
                    <label>
                        <asp:TextBox ID="txtPWD" TextMode="Password" runat="server" TabIndex="2" CssClass="text required"></asp:TextBox>
                    </label>
                    <br />
                    <br />
                    <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="button" runat="server"
                        Text="Login" />
                            <asp:CheckBox ID="cbxStudentLogin" runat="server" />Student
                    <span class="red">
                        <asp:Literal ID="ltlError" runat="server"></asp:Literal></span></td>
                    </tr>
                </table>
                    

                </div>
            </div>
        </div>
    </form>
    <div style="height: 20px;">
        &nbsp;</div>
    <div style="text-align: center; width: 100%; font-size: 11px; color: #FFF; background-color: Gray;
        height: 20px; line-height: 20px;position:absolute;bottom:0px;">
        CopyRight Depaul Steans Center</div>
</body>
</html>
