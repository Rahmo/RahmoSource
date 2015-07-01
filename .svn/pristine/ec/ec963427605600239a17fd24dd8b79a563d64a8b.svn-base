<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.Account.MemberList" %>
<%@ Import namespace="ICStars2_0.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script src="../../Scripts/jquery-1.7.1.min.js"
        type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    function TipOption(msg) {
        if (confirm(msg)) {
            return true;
        }
        else {
            return false;
        }
    }
    </script>
    <script type="text/javascript">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
 <h2>
        <span>MemberManagement</span></h2>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <th width="5%" align="center">
                ID
            </th>
           <th>
           Status
           </th>
            <th>Name</th>
            <th width="20%" align="center">
                CampusConnectID
            </th>
            <th align="center">
                Role/MemberType
            </th>
              <th width="10%" align="center">
                Operation
            </th>
        </tr>
        <asp:Repeater ID="rptList" runat="server">
        <ItemTemplate>
        <tr>
            <td align="center" valign="top">
               <%#Eval("ID") %>
            </td>
             <td  align="center">
             <span>
             <%#(bool)Eval("Status") ? "Approved" : "Needs Approval"%>
               </span>
            </td>
            <td><%#Eval("FirstName") %>, <%#Eval("LastName") %></td>
            <td align="center" valign="top">
               <span id="span_username"><%#Eval("CampusConnectID")%></span>
            </td>
            <td align="center" style="word-break: break-all">
               <%#  ArrayHelper.ToString(Roles.GetRolesForUser(Eval("CampusConnectID").ToString()),"<br />")%>
            </td>

             <td align="center" valign="top">
             <a href="EditMember.aspx?id=<%#Eval("ID") %>">EditMember</a>
                |
                 <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to DISAPPROVE this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="LockMember_Click" runat="server">Disapprove</asp:LinkButton>
           
                 <asp:LinkButton ID="LinkButton3" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to APPROVE this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="ActiveMember_Click" runat="server">Approve</asp:LinkButton>
               
                |
                 <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to DELETE this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="lbtDeleteMember_Click" runat="server">Delete</asp:LinkButton>
               

            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>

</asp:Content>