<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ICStars2_0.SHTracker.CBO.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>

  <script type="text/javascript">
function checkForm() {
     if($('#<%=txtCBOName.ClientID %>').val() != $('#<%=hdfCBOName.ClientID %>').val()) {
         $("#<%=txtCBOName.ClientID %>").rules("add", {
             remote: { url: "/SHTracker/CBO/CheckCBOExists.ashx?qk=<%=txtCBOName.ClientID.Replace('_','$') %>", async: false }

             ,
             messages: {
                 remote: $.format("{0} is already in use")

             }
         });
     }else {
         $("#<%=txtCBOName.ClientID %>").rules("remove", "remote");
     }
    if ($("form").valid()) return true;
        return false;
    }

$(document).ready(function() {
    $("form").validate({ invalidHandler: function (form, validator) {
        validator.invalidElements().first().focus();
    } 
    });
});
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<h2>Edit CBO</h2>

    <fieldset>
        <legend>CBO</legend>
        
<div class="editor-label">
            <label>CBO Name</label>
        </div>
        <div class="editor-field">
            <asp:HiddenField ID="hdfCBOName" runat="server" />
            <asp:TextBox ID="txtCBOName" runat="server" CssClass="required"></asp:TextBox>
        </div>

        <div class="editor-label">
            <label>ContactFristName</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtContactFristName" runat="server" CssClass=""></asp:TextBox>
        </div>

        <div class="editor-label">
            <label>ContactLastName</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtContactLastName" runat="server" CssClass=""></asp:TextBox>
        </div>

        <div class="editor-label">
            <label>ContactEmail</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtContactEmail" runat="server" CssClass="email"></asp:TextBox>
        </div>

        <div class="editor-label">
            <label>ContactPhone</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtContactPhone" runat="server" CssClass=""></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Address</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtAddress" runat="server" CssClass=""></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Mission</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtMission" Rows="10" TextMode="MultiLine" runat="server" CssClass=""></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" OnClientClick="return checkForm();" Text="Edit" /></p>
            </fieldset>
</asp:Content>
