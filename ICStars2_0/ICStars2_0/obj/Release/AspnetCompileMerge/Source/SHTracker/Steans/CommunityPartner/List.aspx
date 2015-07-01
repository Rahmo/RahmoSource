<%@ Page Title="Service Learners  Application List" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.CommunityPartner.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="/SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/SHTracker/Scripts/UrlHelper.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            var quarter = UrlHelper.Current.getUrlParameter("quarter");

            $('#ddlQuarterYear').val(decodeURIComponent(quarter));

            $('#ddlQuarterYear').change(function () {
                window.location = UrlHelper.Current.setUrlParameter("quarter", encodeURIComponent($(this).val()));
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
     <h2>
        <span>Service Learners Application Management</span></h2>
    <div class="toolbar">
             Select Quarter: <select id="ddlQuarterYear" class="required">
	<option value="">All</option>
	<option value="Spring 2012">Spring 2012</option>
	<option value="Summer 2012">Summer 2012</option>
	<option selected="selected" value="Fall 2012">Fall 2012</option>
	<option value="Winter 2013">Winter 2013</option>
	<option value="Spring 2013">Spring 2013</option>
	<option value="Summer 2013">Summer 2013</option>
	<option value="Fall 2013">Fall 2013</option>
	<option value="Winter 2014">Winter 2014</option>
	<option value="Spring 2014">Spring 2014</option>
	<option value="Summer 2014">Summer 2014</option>
	<option value="Fall 2014">Fall 2014</option>
	<option value="Winter 2015">Winter 2015</option>
	<option value="Spring 2015">Spring 2015</option>
	<option value="Summer 2015">Summer 2015</option>
	<option value="Fall 2015">Fall 2015</option>
	<option value="Winter 2016">Winter 2016</option>
	<option value="Spring 2016">Spring 2016</option>
	<option value="Summer 2016">Summer 2016</option>
	<option value="Fall 2016">Fall 2016</option>
	<option value="Winter 2017">Winter 2017</option>

</select></div>
    <table>
    <tr>
    <th>Quarter</th>
        <th>
            Organization Name
        </th>
        <th>
          Region
        </th>
        <th style="width:45%;">Major Programs Services Provided</th>
        <th></th>
    </tr>
    <asp:Repeater ID="rptList" runat="server">
    <ItemTemplate>
     <tr>
     <td><%#Eval("QuarterYear")%></td>
        <td>
            <%#Eval("OrganizationName")%>
        </td>
        <td>
             <%#Eval("Region")%>
        </td>
        <td><%#Eval("MajorProgramsServicesProvided")%></td>
        <td>
            <a href="ApplicationDetails.aspx?id=<%#Eval("ID") %>">Details</a>
        </td>
    </tr>

    </ItemTemplate>
    </asp:Repeater>
   

</table>
    
    <div class="page_bar"><ICStars:PageBar ID="pageBar1" runat="server" Size="20" Displaysize="10"/></div>
</asp:Content>
