<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="ReportHours.aspx.cs" Inherits="ICStars2_0.SHTracker.CSSP.ReportHours" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

 <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <script src="../Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="/SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
     <script type="text/javascript">
         function checkForm(obj) {
             if ($("form").valid()) {
                 $("#dialog-confirm").empty();
                 var msg = $("form").clone();
                 msg.find("p.toolbar").remove();
                 msg.find("input[type='hidden']").remove();
                 msg.find("#CBOID").replaceWith("<input type='text' disabled='disabled' value='" + $("#CBOID option:selected").text() + "'/>");
                 msg.find("input,select").each(function () {
                     msg.find('#' + $(this).attr("id")).replaceWith("<input type='text' disabled='disabled' value='" + $('#' + $(this).attr("id")).val() + "'/>");
                 });

                 $("#dialog-confirm").html(msg);
                 $("#dialog-confirm").dialog({
                     resizable: false,
                     width: 400,
                     height: 400,
                     title: "Are you sure these are correct?",
                     dialogClass: "warning",
                     modal: true,
                     buttons: {
                         "Submit": function () {
                             var f = $("form").get(0);

                             f.__EVENTTARGET.value = '<%=btnSubmit.ClientID.Replace("_","$") %>';
                             f.submit();
                             $(".ui-dialog-buttonpane button:eq(0)").html("&nbsp;").css({ "background": "url(../Scripts/ModalWindow/images/ajax-loader.gif) no-repeat", width: 33, height: 33 });
                         },
                         Cancel: function () {
                             $(this).dialog("close");
                         }
                     }
                 });
             }
             return false;
         }
         $(document).ready(function () {
             $("form").validate({
                 invalidHandler: function (form, validator) {
                     validator.invalidElements().first().focus();
                 }
             });

             $("#<%=txtServiceDate.ClientID %>").attr("readonly", "true").datepicker({
                 changeMonth: true,
                 changeYear: true
             });
         });
     </script>
  
    <style type="text/css">
    .for-dialog
    {
        display:none;
        }
        .warning
        {
            font-weight:bold;
            border:5px solid blue;
            }
            .warning .ui-dialog-titlebar{background-color:blue;color:Yellow;background-image:none;font-weight:bold;}
            .warning .ui-dialog-titlebar .ui-dialog-title{font-weight:bold;font-size:20px;}
            #dialog-confirm em{color:blue;font-size:16px;font-weight:bold;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <fieldset>
        <legend>Course</legend>
        <div class="editor-label">
            <label>Quarter: <%if(CurrentServiceHours!=null){%><%=CurrentServiceHours.Quater_Year %><%}else{%><%=Request.QueryString["Quarter"] %><%} %></label>
        </div> 
<div class="editor-label">
            <label>CBO</label>
        </div>  
        <div class="editor-field">
            <%= CurrentServiceHours==null? DropDownListHelper.DropDownList("CBOID",Request.QueryString["CBOID"], this.CBONameList,"class=\"\""):"<input type='text' disabled='disabled' value='"+CBONameList.First(m=>m.Value.Equals(CurrentServiceHours.CBO_ID.ToString())).Text+"' />"%>
        </div>
        <div class="editor-label">
            <label>Course</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtCourse" runat="server" Enabled="false"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>ServiceDate</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtServiceDate" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Hours Served</label>
        </div>  
        <div class="editor-field">
            <asp:DropDownList ID="ddlHoursServed" runat="server" CssClass="required">
            </asp:DropDownList>
        </div>
        <div class="editor-label">
            <label>Type of Engagement</label>
        </div>  
        <div class="editor-field">
            <asp:DropDownList ID="ddlContactType" runat="server" CssClass="required">
            <asp:ListItem Value="" Selected="true">Select Type</asp:ListItem>
            <asp:ListItem Value="Service">Service</asp:ListItem>
            <asp:ListItem Value="Meeting">Meeting</asp:ListItem>
            <asp:ListItem Value="Orientation">Orientation</asp:ListItem>
            <asp:ListItem Value="Training">Training</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="editor-label">
            <label>Description of Engagement</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtEngagementDescription" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Notes(Alternative site  supervisor Contact Info)</label>
        </div>  
        <div class="editor-field">
            <asp:TextBox ID="txtNotes" runat="server"></asp:TextBox>
        </div>
        
        <p class="toolbar">
            <asp:LinkButton ID="btnSubmit" ClientIDMode="AutoID" OnClick="btnSubmit_Click" runat="server" OnClientClick="return checkForm(this);" Text="Report" /></p>
            </fieldset>
    <div id="dialog-confirm" class="for-dialog"></div>
</asp:Content>
