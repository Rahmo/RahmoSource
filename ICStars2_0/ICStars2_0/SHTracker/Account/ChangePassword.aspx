<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ICStars2_0.Account.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<h2>&nbsp;</h2>
<fieldset>
        <legend>Change Password Form</legend>
        <ol>
            <li><label for="OldPassword">Current password</label>
                <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server"></asp:TextBox>
            </li>
            <li><label for="NewPassword">New password</label>
                <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server"></asp:TextBox>
            </li>
            <li><label for="ConfirmPassword">Confirm new password</label>
                <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
            </li>
        </ol>
    <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Change Password" />
    </fieldset>
    <span class="field-validation-error">
        <asp:Literal ID="ltlError" runat="server"></asp:Literal></span>
</asp:Content>
