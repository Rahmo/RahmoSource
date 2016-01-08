<%@ Page Title="" Language="C#"  ValidateRequest="false" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.EventRequest.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
     <script type="text/javascript" src="../../Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../../Scripts/CkEditor/ckeditor.js"></script>
    <script type="text/javascript" src="../../Scripts/CkEditor/CheckCompatibility.js"></script>
    <script type="text/javascript">
        $(function () {
            CKEDITOR.replace('<%=txtBody.ClientID%>', {
                extraPlugins: 'autogrow',
                autoGrow_maxHeight: 400
            });
        });
    </script>
    <style type="text/css">
        td{ text-align: left;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
  <h2>Event Request Email Sending Settings</h2>
        <table class="toolbar">
        <tr>
            <td>Receiver Email : </td>
            <td><asp:TextBox ID="txtReceiverEmail" runat="server" Width="500"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Email Title : </td>
            <td><asp:TextBox ID="txtTitle" runat="server" Width="500"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Email Body : </td>
            <td>
                <asp:TextBox ID="txtBody" runat="server" Width="500" TextMode="MultiLine"></asp:TextBox>
   
            </td>
        </tr>
        
        <tr>
            <td>Is Html : </td>
            <td>
                <asp:DropDownList ID="ddlIsHtml" runat="server">
                  <asp:ListItem Value="True" Selected="True">Yes</asp:ListItem>
                  <asp:ListItem Value="False">No</asp:ListItem>
                </asp:DropDownList>
   
            </td>
        </tr>
        <tr>
            <td>If Send Email : </td>
            <td>
                <asp:DropDownList ID="ddlIsSendingEmail" runat="server">
                  <asp:ListItem Value="True" Selected="True">Yes</asp:ListItem>
                  <asp:ListItem Value="False">No</asp:ListItem>
                </asp:DropDownList>
   
            </td>
        </tr>
        <tr><td></td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>
    </table>
</asp:Content>
