<%@ Page Title="Student Hours Reporting" Language="C#" MasterPageFile="~/SHTracker/StudentApp/StudentApp.Master" AutoEventWireup="true" CodeBehind="ReportHours_2.aspx.cs" Inherits="ICStars2_0.SHTracker.StudentApp.ReportHours_2" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div style="margin-left: 90px" class="fieldset">
<br/>
<p>
Choose Course : <label><%=DropDownListHelper.DropDownList("CourseID", this.CourseNameList)%></label>
</p>
<p>
                    <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="button" runat="server"
                        Text="Report Hours" />&nbsp;&nbsp;<input type="button" value="Go Back" class="button" onclick="window.location='ReportHours_1.aspx';"/></p>
                        <br/>
                        <br/>
    <asp:Panel ID="Panel1" Visible="false" runat="server">
    You have no courses in <%=Request.QueryString["q"] %>!<br/>
        Please contact your SLC to double check your information for <%=Request.QueryString["q"] %><br/>
    <a href="ReportHours_1.aspx">Go Back</a>
    </asp:Panel>
</div>
</asp:Content>
