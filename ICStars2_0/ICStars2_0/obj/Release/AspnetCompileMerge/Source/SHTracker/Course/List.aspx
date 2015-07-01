<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ICStars2_0.SHTracker.Course.List" %>
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
        <span>Course Management</span></h2>
        <%if (IsAuthorized)
          { %>
        <div class="toolbar">
                <a href="Add.aspx">Add Course</a><% if (!User.IsInRole("CSSP"))
                                                    { %> &nbsp;&nbsp;<a href="?t=0">Standard Course</a>&nbsp;&nbsp;<a href="?t=1">CSSP Course</a><% } %></div>
                <% } %>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <th width="10%" align="center">
                ID
            </th>
           <th>
           TermDescription
           </th>
           <th>Subject</th>
           <th>CatalogNumber</th>
           <th>ClassSection</th>
           <th>Title</th>
           <th>InstructorName</th>
           <th>BestEmail</th>
           <th>Staff</th>
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
               <span id="span_username"><%#Eval("TermDescription")%></span>
            </td>
          
            <td align="center" valign="top">
               <%#Eval("Subject")%>
            </td>
            <td align="center" valign="top">
               <%#Eval("CatalogNumber")%>
            </td>
            <td align="center" valign="top">
               <%#Eval("ClassSection")%>
            </td>
            <td align="center" valign="top">
               <%#Eval("Title")%>
            </td>
            <td align="center" valign="top">
               <%#Eval("InstructorName")%>
            </td>
            <td align="center" valign="top">
               <%#Eval("BestEmail")%>
            </td>
            <td align="center" valign="top">
               <%#Eval("Staff")%>
            </td>

             <td align="center" valign="top">
             <%if (IsAuthorized)
               { %>
             <a href="Edit.aspx?id=<%#Eval("ID") %>">Edit</a>
                |
                 <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to delete this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="lbtDeleteMember_Click" runat="server">Delete</asp:LinkButton>
               <% } %>

            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
</asp:Content>
