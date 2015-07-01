<%@ Page Title="Student Hours Reporting" Language="C#" MasterPageFile="~/SHTracker/StudentApp/StudentApp.Master" AutoEventWireup="true" CodeBehind="ReporthoursSuccess.aspx.cs" Inherits="ICStars2_0.SHTracker.StudentApp.ReporthoursSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        em {
            font-style: normal;
            font-weight: bold;
            color: green;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div id="content" style="text-align:left;" class="fieldset">
<b>Reporting Hours has been done.</b>   <br/><br/>
    <b>CBO :</b> <em><%=CBOName %></em><br/>
    <b>Course:</b> <em><%=CourseName %></em><br/>
<b>Reported :</b> <em><%=ReportedHours%> Hours</em><br/>
<b>Total Reported :</b> <em><%=TotalReortedHours%> Hours</em><br/>
<a href="Default.aspx">Return</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=Request.UrlReferrer %>">Report Addtional Hours</a>
<br/>
<br/>
</div>
</asp:Content>
