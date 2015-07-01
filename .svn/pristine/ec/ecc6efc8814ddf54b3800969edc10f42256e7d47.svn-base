<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="ChooseTerm.aspx.cs" Inherits="ICStars2_0.SHTracker.Report.ChooseTerm" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>
<%@ Import Namespace="ICStars2_0.Model.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate-1.10.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
       
        $(function () {
            $("form").validate();
            var quarter_year = '<%=UserData.QuarterYear%>';
            $("#ddlQuarterYear option").each(function() {
                if (quarter_year.indexOf($(this).val()) < 0) {
                    $(this).remove();
                }
            });
        });
    </script>
    <style type="text/css">
        h2,p{ width: 100%;display: block;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<p>Choose Term : <%=DropDownListHelper.DropDownList("ddlQuarterYear",null,DropDownListHelper.BuildQuarterYearSelectListItems(),"class=\"required\" multiple=\"multiple\" style=\"height:150px;\"")%> &nbsp;&nbsp;<asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="Next" /></p>
    <h2>Tips: 1. Hold "Shift" or "Ctrl" key and left click to choose mutiple options.</h2>
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Terms List can only show what you chose at login page.</h2>
</asp:Content>
