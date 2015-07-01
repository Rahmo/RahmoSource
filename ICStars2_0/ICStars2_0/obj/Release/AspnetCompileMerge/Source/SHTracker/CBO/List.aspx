<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ICStars2_0.SHTracker.CBO.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
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
        <span>CBO Management</span></h2>
        <%if (IsAuthorized)
          { %>
        <div class="toolbar">
                <a href="Add.aspx">Add CBO</a></div>
                <% } %>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <th width="10%" align="center">
                ID
            </th>
           <th>
           CBO Name
           </th>
           <th>
           Contact FristName
           </th>
           <th>
           Contact LastName
           </th>
           <th>
           Contact Email
           </th>
           <th>
           Contact Phone
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
            <td align="center" valign="top">
               <span id="span_username"><%#Eval("Name")%></span>
            </td>
          <td><%#Eval("ContactFristName")%></td>
          <td><%#Eval("ContactLastName")%></td>
          <td><%#Eval("ContactEmail")%></td>
          <td><%#Eval("ContactPhone")%></td>

             <td align="center" valign="top">
             <%if (IsAuthorized)
               { %>
             <a href="Edit.aspx?id=<%#Eval("ID") %>">Edit</a>
                <%--|
                 <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to delete this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="lbtDeleteMember_Click" runat="server">Delete</asp:LinkButton>--%>
               
               <% } %>
            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>

</asp:Content>
