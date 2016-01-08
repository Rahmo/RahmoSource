<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ICStars2_0.SHTracker.Log.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>
        <span>Log View</span></h2>
    
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <th width="10%" align="center">
                ID
            </th>
           <th>
               UserName
           </th>
            <th>
                Url
            </th>
            <th>UrlReferrer</th>
            <th>CreateDate</th>
            <th>IP</th>
        </tr>
        <asp:Repeater ID="rptList" runat="server">
        <ItemTemplate>
        <tr>
            <td align="center" valign="top">
                <%#Eval("ID") %>
            </td>
            <td align="center" valign="top">
                <%#Eval("UserName") %>
            </td>
            <td align="center" valign="top">
                <%#Eval("Url") %>
            </td>
            <td align="center" valign="top">
                <%#Eval("UrlReferrer") %>
            </td>
            <td align="center" valign="top">
                <%#Eval("CreateDate") %>
            </td>
            <td align="center" valign="top">
                <%#Eval("IP") %>
            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
    <div class="page_bar"><ICStars:PageBar ID="pageBar1" runat="server" Size="100" Displaysize="10"/></div>
   
</asp:Content>
