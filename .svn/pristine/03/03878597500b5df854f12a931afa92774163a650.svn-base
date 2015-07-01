<%@ Page Title="Student Hours Reporting" Language="C#" MasterPageFile="~/SHTracker/StudentApp/StudentApp.Master" AutoEventWireup="true" CodeBehind="ReportHours_1.aspx.cs" Inherits="ICStars2_0.SHTracker.StudentApp.ReportHours_1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("form").validate({
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
        });
    </script>
    <style type="text/css">
    
            label.error{color:red;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div style="margin-left: 90px" class="fieldset">
<br/>
<p>
Quarter/Year : <label><asp:DropDownList ID="ddlQuarterYear" runat="server" CssClass="required">
            </asp:DropDownList></label>
           </p>
           <p>
            DPU ID : 
                        <label><asp:TextBox ID="txtDPUID" runat="server" Enabled="False" CssClass="text required number"></asp:TextBox></label>
               <br />DPU ID is empty? <a href="/Account/Student/Login">Re-login</a>
                        </p>
                        <p>
                    <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="button" runat="server"
                        Text="Submit" />&nbsp;&nbsp;<input type="button" value="Go Back" class="button" onclick="window.location='Default.aspx';"/></p>
                        <br/>
                        <br/>
                    <span class="red">
                        <asp:Literal ID="ltlError" runat="server"></asp:Literal></span>
</div>
</asp:Content>
