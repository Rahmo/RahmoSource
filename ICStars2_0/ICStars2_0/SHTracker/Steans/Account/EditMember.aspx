<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="EditMember.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.Account.EditMember" %>
<%@ Import Namespace="ICStars2_0.BusinessLayer" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <script src="../../Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="/SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <link href="../../Content/Css/Dialog-Warning.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript">

      function checkForm() {
          if ($('#<%=txtUserName.ClientID %>').val() != $('#<%=hdfUserName.ClientID %>').val()) {
        $("#<%=txtUserName.ClientID %>").rules("add", {
            remote: { url: "<%=Config.SHTrackerRoot %>/Account/CheckAccountExists.ashx?qk=<%=txtUserName.ClientID.Replace('_','$') %>", async: false }

             ,
            messages: {
                remote: $.format("{0} is already in use")

            }
        });
    } else {
        $("#<%=txtUserName.ClientID %>").rules("remove", "remote");
    }
    if ($("form").valid()) {
        return true;
    }
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
  <style type="text/css">
   fieldset{float:left;}
  fieldset#fleft{width:350px;}
  fieldset#fright em,div#fright2 em{float:left;}
  #dialog-confirm{display:none;}

            #dialog-confirm em{color:red;font-size:16px;font-weight:bold;}
            div textarea{ height: 50px;}
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<h2>Edit Member</h2>

    <fieldset id="fleft">
        <legend>Member</legend>
        
        <div class="editor-label">
            <label>MemberType</label>
        </div>
        <div class="editor-field">
        <%=RolesCheckBoxHelper.MemberTypeCheckBoxList("roles", Roles.GetRolesForUser(txtUserName.Text))%>
        </div>

        <div class="editor-label">
           <label>CampusConnectID</label>
        </div>
        <div class="editor-field">
            <asp:HiddenField ID="hdfUserName" runat="server" />
            <asp:TextBox ID="txtUserName" runat="server"   CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
           <label>EmplID</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtEmplID" runat="server"></asp:TextBox>
        </div>
        <div class="editor-label">
           <label>First name</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
           <label>Last Name</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtLastName" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Role</label>
        </div>
        <div>
        
        <%=RolesCheckBoxHelper.RolesCheckBoxList("roles", Roles.GetRolesForUser(txtUserName.Text))%>
        </div>
        <div class="editor-label">
           <label>Status</label>
        </div>
        <div class="editor-field">
            <asp:CheckBox ID="cbxStatus" runat="server" />(Available)
        </div>

        <div class="editor-label">
           <label>Email</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="email"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" OnClientClick="return checkForm();" Text="Edit" />
        </p>
    </fieldset>
    <fieldset id="fright"><legend>Member Details</legend>
        
        <div class="editor-label">
           <label>Department</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
        </div>
        
        <div class="editor-label">
           <label>Location</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtLocation" runat="server" Width="300" TextMode="MultiLine"></asp:TextBox>
        </div>
        
        <div class="editor-label">
           <label>JobTitle</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtJobTitle" runat="server" Width="300"></asp:TextBox>
        </div>
        
        <div class="editor-label">
           <label>OfficePhone</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtOfficePhone" runat="server"></asp:TextBox>
        </div>
        
        <div class="editor-label">
           <label>Fax</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtFax" runat="server"></asp:TextBox>
        </div>
        
        <div class="editor-label">
           <label>SupervisorFirstName</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtSupervisorFirstName" runat="server"></asp:TextBox>
        </div>
        
        <div class="editor-label">
           <label>SupervisorLastName</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtSupervisorLastName" runat="server"></asp:TextBox>
        </div>
        
        <div class="editor-label">
           <label>SupervisorEmail</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtSupervisorEmail" runat="server" CssClass="email"></asp:TextBox>
        </div>
    </fieldset>
    <div id="dialog-confirm"></div>


</asp:Content>

