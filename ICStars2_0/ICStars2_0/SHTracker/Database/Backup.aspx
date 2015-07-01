<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="Backup.aspx.cs" Inherits="ICStars2_0.SHTracker.Database.Backup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<h2>
Table Names For Backup : <br/>
    <input type="checkbox" value="CBO" name="Tables"/>CBO <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="Course" name="Tables"/>Course <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="EventRequestForm" name="Tables"/>EventRequestForm <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="Member" name="Tables"/>Member <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="Member2CBO" name="Tables"/>Member2CBO <input type="hidden" value="MemberID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="Member2Role" name="Tables"/>Member2Role <input type="hidden" value="MemberID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="Role" name="Tables"/>Role <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="ServiceHours" name="Tables"/>ServiceHours <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="ServiceLearnersApplication" name="Tables"/>ServiceLearnersApplication <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="Student" name="Tables"/>Student <input type="hidden" value="ID" name="PrimaryKeys"/><br/>
    <input type="checkbox" value="Student2CBO" name="Tables"/>Student2CBO <input type="hidden" value="StudentID" name="PrimaryKeys"/><br/>
  <asp:Button ID="btnBuild"
        runat="server" Text="Backup" OnClick="btnBuild_Click" />
</h2>
</asp:Content>
