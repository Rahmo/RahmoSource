<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ICStars2_0.SHTracker.Course.Edit" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
     <script type="text/javascript">
         function checkForm() {
             if ($("form").valid()) return true;
             return false;
         }
         $(document).ready(function () {
             $("form").validate({
                 invalidHandler: function (form, validator) {
                     validator.invalidElements().first().focus();
                 }
                 });
         });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<h2>Edit Course</h2>

    <fieldset>
        <legend>Course</legend>
        
<div class="editor-label">
            <label>Course TermDescription</label>
        </div>  
        <div class="editor-field">
            <%=DropDownListHelper.DropDownList("TermDescription",CurrentCourse.TermDescription, new[]
                              {
                                  new ICStars2_0.Model.Items.SelectListItem
                                      {
                                          Text = "Select Term",
                                          Value = "",
                                          Selected=true
                                      }
                              }.Union(User.IsInRole("CSSP")?DropDownListHelper.BuildCSSPTermSelectListItems(): DropDownListHelper.BuildQuarterYearSelectListItems()),"class=\"required\"")%>
        </div>
        <div class="editor-label">
            <label>Subject</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtSubject" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>CatalogNumber</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtCatalogNumber" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>ClassSection</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtClassSection" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Title</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>InstructorName</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtInstructorName" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>BestEmail</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtBestEmail" runat="server" CssClass="required email"></asp:TextBox>
        </div> <div class="editor-label">
            <label>Staff</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtStaff" runat="server" Enabled="false"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" OnClientClick="return checkForm();" Text="Edit" /></p>
            </fieldset>
</asp:Content>
