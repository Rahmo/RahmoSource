<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.Internship.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <table width="100%">
    <tr><th colspan="8"><h1>Internship Application List</h1></th></tr>
    <tr>
    <th>Quarter</th>
        <th>
            Name
        </th>
        <th>
            Email
        </th>
        <th>
           School/College
        </th>
        <th>
            Major
        </th>
        <th>
            Minor
        </th>
        <th>
            DPU ID
        </th>
        <th>
        </th>
    </tr>
    <asp:Repeater ID="rptList" runat="server">
    <ItemTemplate>
     <tr>
     <td><%#Eval("QuarterYear")%></td>
        <td>
            <%#Eval("Name") %>
        </td>
        <td>
             <%#Eval("Email") %>
        </td>
        <td>
             <%#Eval("College") %>
        </td>
        <td>
             <%#Eval("Major_Area_Of_Academic_Focus")%>
        </td>
        <td><%#Eval("Minor_Area_Of_Academic_Focus")%></td>
        <td><%#Eval("Depaul_ID_Number")%></td>
        <td>
            <a href="ApplicationDetails.aspx?id=<%#Eval("ID") %>">Details</a>
        </td>
    </tr>

    </ItemTemplate>
    </asp:Repeater>
   
       <div class="page_bar"><ICStars:PageBar ID="pageBar1" runat="server" Size="20" Displaysize="10"/></div>
</table>
</asp:Content>
