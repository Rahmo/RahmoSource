﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="MemberManagement.aspx.cs" Inherits="ICStars2_0.SHTracker.Account.MemberManagement" %>

<%@ Import namespace="ICStars2_0.Common" %>
<%@ Import Namespace="ICStars2_0.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script src="../Scripts/jquery-1.7.1.min.js"
        type="text/javascript"></script>
       <script src="../Scripts/UrlHelper.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    function TipOption(msg) {
        if (confirm(msg)) {
            return true;
        }
        else {
            return false;
        }
    }

    $(document).ready(function () {




        /*Initiate values for searching*/
        $("#txtSearch").val(UrlHelper.Current.getUrlParameter("SearchText"));
        $("#sltSearchType").val(UrlHelper.Current.getUrlParameter("SearchType"));


    });

    function ClientSearchValues() {
        // put your code here 



        var url = UrlHelper.Current.setUrlParameter("SearchType", $("#sltSearchType").val());

        url = UrlHelper.Current.setUrlParameter("SearchText", encodeURIComponent($("#txtSearch").val()), url);
        //url = UrlHelper.Current.setUrlParameter("SearchCourseID", encodeURIComponent($("#sltCourseID").val()), url);
        //alert(url);
        window.location = url;
        return;


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
        <div class="toolbar">
            <% if (!CurrentRoles.Any(r => r.Equals("admin_account_slc")))
               { %>
            <a href="?roles=admin">Admin</a>
            <% } %>
            <asp:Repeater runat="server" ID="rptMemberType">
                <ItemTemplate>
                    <a href="?mt=<%#Eval("Name") %>"><%#Eval("Name") %></a>
                </ItemTemplate>
            </asp:Repeater>
            <% if (!CurrentRoles.Any(r => r.Equals("admin_account_slc")))
               { %>
            <a href="?other=1">Other</a>
            <a href="?all=1">All</a>
            <% } %>

            <input type="text" onblur="return ClientSearchValues(); " id="txtSearch" minlength="2" class="required" />
                <select id="sltSearchType" class="required" onblur="return ClientSearchValues() ">
                    <option value="3">CampusConnect Id</option>
                    <option value="1">First Name</option>
                    <option value="2">Last Name</option>
                   
                </select>
            <%--<input type="button" value="Search" id="btnPressed"  runat="server"   style="margin-left:150px;" />--%>
            <asp:LinkButton  OnClick="BtnSearch" ID="btnPressed" runat="server" >Search</asp:LinkButton>
        </div>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <th width="5%" align="center">
                ID
            </th>
            <th>Name</th>
           <th>
           Status
           </th>
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
            <td><%#Eval("FirstName") %>, <%#Eval("LastName") %></td>
             <td  align="center">
             <span>
             <%#(bool)Eval("Status") ? "Actived" : "Locked"%>
               </span>
            </td>
            <td align="center" valign="top">
               <span id="span_username"><%#Eval("CampusConnectID")%></span>
            </td>
            <td align="center" style="word-break: break-all">
               <%#  ArrayHelper.ToString(Roles.GetRolesForUser(Eval("CampusConnectID").ToString()),"<br />")%>
            </td>

             <td align="center" valign="top">
              
             <a href="EditMember.aspx?id=<%#Eval("ID") %>">EditMember</a>
                |
                 <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to lock this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="LockMember_Click" runat="server">Lock</asp:LinkButton>
           
                 <asp:LinkButton ID="LinkButton3" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to activate this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="ActiveMember_Click" runat="server">Activate</asp:LinkButton>
               
                |
                 <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption("Are you sure to delete this account ["+$(this).parent().siblings().find("#span_username").html()+"]?")' OnClick="lbtDeleteMember_Click" runat="server">Delete</asp:LinkButton>
               
             
            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
    
    <div class="page_bar"><ICStars:PageBar ID="pageBar1" runat="server" Size="50" Displaysize="10"/></div>
</asp:Content>
