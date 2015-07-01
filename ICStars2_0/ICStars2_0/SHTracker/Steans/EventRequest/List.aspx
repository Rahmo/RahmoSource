<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.EventRequest.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="/SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/SHTracker/Scripts/UrlHelper.js" type="text/javascript"></script>
    <style type="text/css">
        
        table{ width: 100%;}
        table tr.approved td {
            background-color: green;
            color: #fff;
        }
        table tr.discarded td{
            background-color: red;
            color: #fff;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>Event Request Form Management</h2>
      <table>
    <tr>
    <th>Contact Name</th>
        <th>
            Event Date
        </th>
        <th>
          Program
        </th>
        <th>Event Title</th>
        <th></th>
    </tr>
    <asp:Repeater ID="rptList" runat="server">
    <ItemTemplate>
     <tr class="<%#(int)Eval("Status")==1?"approved":(int)Eval("Status")==-1?"discarded":"" %>">
     <td><%#Eval("ContactName")%></td>
        <td>
            <%#Convert.ToDateTime( Eval("EventDate")).ToString("MM/dd/yyyy")%> <%#Eval("EventTime") %>
        </td>
        <td>
             <%#Eval("Program")%>
        </td>
        <td><%#Eval("EventTitle")%></td>
        <td>
            <a class="button" href="FormDetails.aspx?id=<%#Eval("ID") %>&k=<%#ICStars2_0.Common.MathHelper.Md5(string.Format("{0}{1}",ICStars2_0.Common.Const.ENCRYPT_KEY,Eval("ID"))) %>">Details</a>
            <asp:LinkButton ID="lbtDiscard" CssClass="button" CommandArgument='<%#Eval("ID") %>'  OnClick="lbtDiscard_Click" runat="server">Discard</asp:LinkButton>
            <asp:LinkButton ID="LinkButton1" CssClass="button" CommandArgument='<%#Eval("ID") %>'  OnClick="lbtApprove_Click" runat="server">Approve</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" CssClass="button" CommandArgument='<%#Eval("ID") %>'  OnClick="lbtUncheck_Click" runat="server">Uncheck</asp:LinkButton>
        </td>
    </tr>

    </ItemTemplate>
    </asp:Repeater>
   

</table>
    
    <div class="page_bar"><ICStars:PageBar ID="pageBar1" runat="server" Size="20" Displaysize="10"/></div>
</asp:Content>
