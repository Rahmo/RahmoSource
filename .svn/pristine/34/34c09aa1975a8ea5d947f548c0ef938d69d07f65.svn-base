<%@ Page Title="Student Hours Reporting" Language="C#" MasterPageFile="~/SHTracker/StudentApp/StudentApp.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ICStars2_0.SHTracker.StudentApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .fieldset select {
            width: 280px;
        }
        p{ padding: 0;margin: 0;text-align: center; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div style="text-align: center;" class="fieldset">
        <br />
        <asp:DropDownList ID="ddlAction" runat="server">
            <asp:ListItem Text="Select an action" Value="0"></asp:ListItem>
            <asp:ListItem Text="Report Hours" Value="1"></asp:ListItem>
            <asp:ListItem Text="View Hours" Value="2"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="button" runat="server"
            Text="Submit" />&nbsp;&nbsp;<input type="button" class="button" value="Logout" onclick="window.location = '/Account/Student/Logout';" />
        <br />
        <br />
        <span class="red">
            <asp:Literal ID="ltlError" runat="server"></asp:Literal></span>
    </div>
        <p><b>Notice:</b> The logon will be expired in 30 minutes!</p>
</asp:Content>
