<%@ Page Title="Role Management" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master"
    AutoEventWireup="true" CodeBehind="RoleManagement.aspx.cs" Inherits="ICStars2_0.Account.RoleManagement" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function TipOption(value) {
            if (confirm("Are you sure to delete this role?")) {
                return true;
            }
            else {
                return false;
            }
        }
        function GoTo() {
            if ($("#RoleName").val() == "") {
                alert("Please type role name!");
                return false;
            }
            else
                return true;
        }
    </script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("tr:even").addClass("bg_f9f5f6");
            $("tr:gt(0)").hover(
  function () {
      $(this).addClass("hover");
  },
  function () {
      $(this).removeClass("hover");
  }
);
        });
    </script>
    <style type="text/css">em{ color: red;font-weight: bold;}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<h2>
    <span>Role Management</span><em>(All roles are not allowed to be modified!)</em></h2>
<div style="text-align: right;">
    
    <%=DropDownListHelper.DropDownList("RoleType", typeof(RoleType), false)%>
    RoleName：
    <asp:TextBox ID="txtName" CssClass="text" runat="server"></asp:TextBox>
    <asp:Button ID="btnSubmit" runat="server" Text="Create" OnClick="btnSubmit_Click" />
        <span class="field-validation-error">
            <asp:Literal ID="ltlError" runat="server"></asp:Literal></span>
    
</div>
<h2>Role</h2>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <th width="15%">
            ID
        </th>
        <th width="50%">
            Role
        </th>
        <th width="20%">
            Operation
        </th>
    </tr>
    <asp:Repeater ID="rptRole" runat="server">
    <ItemTemplate>
    <tr>
            <td>
                <%#Eval("ID") %>
            </td>
            <td>
            <%#Eval("Name") %>
            </td>
            <td>
                <%--<asp:LinkButton ID="LinkButton1" OnClick="DeleteRole_Click" CommandArgument='<%#Eval("ID") %>' OnClientClick="return TipOption(2);" runat="server">DeleteRole</asp:LinkButton>--%>
               
            </td>
        </tr>
    </ItemTemplate>
    </asp:Repeater>
</table>
<h2>MemberType</h2>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <th width="15%">
            ID
        </th>
        <th width="50%">
            MemberType
        </th>
        <th width="20%">
            Operation
        </th>
    </tr>
    <asp:Repeater ID="rptMemberType" runat="server">
    <ItemTemplate>
     <tr>
            <td>
                <%#Eval("ID") %>
            </td>
            <td>
            <%#Eval("Name") %>
            </td>
            <td>
                <%--<asp:LinkButton ID="LinkButton1" OnClick="DeleteRole_Click" CommandArgument='<%#Eval("ID") %>' OnClientClick="return TipOption(2);" runat="server">DeleteRole</asp:LinkButton>--%>
               
            </td>
        </tr>
    </ItemTemplate>
    </asp:Repeater>
  
</table>
</asp:Content>
