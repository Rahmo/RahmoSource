<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ICStars2_0.SHTracker.Student.List" %>
<%@ Import Namespace="ICStars2_0.BusinessLayer" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
   <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="/SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../Scripts/UrlHelper.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    function TipOption(obj,msg) {
        var dialogConfirm = false;
        $("#dialog-confirm").html(msg);
        /*Jquery UI dialog*/
        $("#dialog-confirm").dialog({
            resizable: false,
            height: 200,
            title: "Warning",
            dialogClass: "warning",
            modal: true,
            buttons: {
                "Delete": function () {
                    dialogConfirm = true;
                    $(obj).parent().parent().remove();
                    eval($(obj).attr("href"));
                    $(this).dialog("close");
                },
                Cancel: function () {
                    $(this).dialog("close");
                }
            }
        });
        return dialogConfirm;
    }
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
        /*When pointer move over the name on the list, pop up the detailed information*/
        $("td.profile").hover(
            function () {
                var offset = $(this).position();
                var targetTop = offset.top - $(this).find("p").outerHeight() / 2 + $(this).outerHeight()/2;
                if (targetTop > $(window).height() + $(window).scrollTop() - $(this).find("p").outerHeight()) 
                {
                    targetTop = $(window).height() + $(window).scrollTop() - $(this).find("p").outerHeight();
                }
                if (targetTop < $(window).scrollTop()) {
                    targetTop = $(window).scrollTop();
                }
                $(this).find("p").css({ left: offset.left + $(this).width(), top: targetTop, position: "absolute", "z-index": 999, "background-color": "rgb(193, 213, 227)" }).show();

            },
            function () {
                $(this).find("p").hide();
            }
        );
        /*Initiate values for searching*/
        $("#txtSearch").val(UrlHelper.Current.getUrlParameter("SearchText"));
        $("#sltSearchType").val(UrlHelper.Current.getUrlParameter("SearchType"));
        $("#sltCourseID").val(UrlHelper.Current.getUrlParameter("SearchCourseID"));
     
            $("#btnSearch").click(function () {
                var url = UrlHelper.Current.setUrlParameter("SearchType", $("#sltSearchType").val());
                url = UrlHelper.Current.setUrlParameter("SearchText", encodeURIComponent($("#txtSearch").val()), url);
                url = UrlHelper.Current.setUrlParameter("SearchCourseID", encodeURIComponent($("#sltCourseID").val()), url);
                window.location = url;
            });
    });
function clearFrameCach(divid) {
    var oldUrl = $("#" + divid + " iframe").attr("src");
    $("#" + divid + " iframe").attr("src", oldUrl + "&rnd=" + Math.random());
}
function changeOrder(v) {
    var t = UrlHelper.Current.getUrlParameter("ordertype");
    if(t == "") {
        t = "DESC";
    }
    else if(t=="ASC") {
        t = "DESC";
    }
    else if(t=="DESC") {
        t = "ASC";
    }
    var url = UrlHelper.Current.setUrlParameter("orderby", v);
    url = UrlHelper.Current.setUrlParameter("ordertype", t, url);
    window.location = url;
}
function importHistoricalHours(studentId,targetCboId,targetCourseId,studentName) {
    var url = "/SHTracker/ServiceHours/HistoricalHours?studentid=" + studentId + "&targetCboId=" + targetCboId + "&targetCourseId=" + targetCourseId + "&returnUrl=" + window.location;
    $.get(url, function (data) {
        $("<div title=\"Import Historical Hours for ["+studentName+"]\">" + data + "</div>").dialog({ width: 400,modal:true });
     
    });
    
}
function rollover(sid,sender) {
    $("<div><iframe frameborder=\"0\" scrolling=\"no\" width=\"100%\" height=\"100%\" src=\"/SHTracker/Student/Rollover?sid=" + sid + "\"></iframe></div>").dialog({
        height: 400,
        width:450,
        title: "Rollover [" + $(sender).parent().parent().parent().find("td:eq(2) span").text() + "]",
        modal: true,
        close: function() {
            $(this).remove();
        }
    });
}
function notify(sid,cboid, sender) {
    $("<div><iframe frameborder=\"0\" scrolling=\"no\" width=\"100%\" height=\"100%\" src=\"/SHTracker/Student/Notify/" + sid + "?cboid="+cboid+"\"></iframe></div>").dialog({
        height: 700,
        width: $(document).width()-200,
        title: "Notify [" + $(sender).parent().parent().parent().find("td:eq(2) span").text() + "]",
        modal: true,
        close: function () {
            $(this).remove();
        }
    });
}
    </script>
    <style type="text/css">
    .for-dialog
    {
        display:none;
        }
        .warning
        {
            font-weight:bold;
            border:5px solid red;
            }
            .warning .ui-dialog-titlebar{background-color:red;color:Yellow;background-image:none;}
            .warning .ui-dialog-titlebar .ui-dialog-title{font-weight:bold;font-size:20px;}
            #dialog-confirm em{color:red;font-size:16px;font-weight:bold;}
            th a:link{text-decoration:underline;}
.hover{background-color:rgb(193, 213, 227);color:#000;}


h2 {
    padding-right: 20px;
    text-align: left;
}
#s_remove {
    display: none;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
 <h2>
        <span><%=!string.IsNullOrEmpty(Request.QueryString["otherstobecalled"])?"Other Students To Be Called(These students haven't reported their hours for 7 days!)":!string.IsNullOrEmpty(Request.QueryString["tobecalled"])?"My Students To Be Called(These students haven't reported their hours for 7 days!)":string.IsNullOrEmpty(Request.QueryString["IsMine"])? "All Students":"My Students" %> </span></h2>
    <table class="toolbar">
        <% if (string.IsNullOrEmpty(Request.QueryString["IsMine"]) && User.IsInRole("SLC"))
           { %>
        <tr>
            <td colspan="2"><h2>Please contact an ASL member with the student detials to assign and add him/her to your list.</h2></td>
        </tr>
        <% } %>
        <tr>
            <td style="width: 150px;text-align:center;">
                
            </td>
            <td style="text-align:left;"><a href="Add.aspx">Add Student</a>
            </td>
        </tr>
        <tr>
            <td style="text-align:center;">
                    Enter Text :
            </td>
            <td align="left" style="text-align:left;">
                <input type="text" id="txtSearch" minlength="2" class="required" />
                <select id="sltSearchType" class="required">
                    <option value="">Select Field</option>
                    <option value="1">First Name</option>
                    <option value="2">Last Name</option>
                    <option value="3">Student ID</option>
                </select>
            </td>
        </tr>
         <tr>
                        <td style="text-align:center;">Course  :</td>
                        <td style="text-align:left;">
                            <%=DropDownListHelper.DropDownList("sltCourseID", null, this.CourseNameList, "class=\"required\"")%>
                &nbsp;&nbsp;<input type="button" value="Search" id="btnSearch" style="margin-left:150px;" />
                        </td>
                    </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <th width="10%" align="center">
                ID
            </th>
            <th>Quarter</th>
           <th>
           <a href="javascript:" onclick="changeOrder('FirstName');return false;" title="Order By Student Name by Clicking">Student Name</a>
           </th>
           <th>
           <a href="javascript:" onclick="changeOrder('CBOName');return false;" title="Order By CBO Name by Clicking">CBO</a>
           </th>
           <th><a href="javascript:" onclick="changeOrder('Course');return false;" title="Order By Course Name by Clicking">Course</a></th>
           <th><a href="javascript:" onclick="changeOrder('Orientation');return false;" title="Order By Orientation by Clicking">Orientation</a></th>
           <th><a href="javascript:" onclick="changeOrder('ServedHours');return false;" title="Order By Served Hours by Clicking">Served Hours</a></th>
           <th><a href="javascript:" onclick="changeOrder('SLC');return false;" title="Order By SLC by Clicking">SLC</a></th>
           <th>Last UpdateTime</th>
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
            <td><%#Eval("Quater_Year") %></td>
            <td align="center" valign="top" class="profile">
               <span id="span_username"><%#Eval("FirstName")%> <%#Eval("LastName")%></span>
               <p style="display:none;text-align:left;padding:10px;border:solid 1px #999;float:left;width:300px;">
            Gender : <%#Eval("Gender")%><br/>
            <a href='mailto:<%#Eval("Email")%>' style="color:Blue;text-decoration:underline;"><%#Eval("Email") %></a><br/>
            DPU ID : <%#Eval("DPU_ID")%><br/>
                   PrimaryPhone : <%#Eval("PrimaryPhone")%><br/>
            AlternatePhone : <%#Eval("AlternatePhone")%><br/>
            TelephoneNumber : <%#Eval("TelephoneNumber")%><br/>
            ReachMethod : <%#Eval("ReachMethod")%><br/>
            School : <%#Eval("School")%><br/>
            Major : <%#Eval("Major")%><br/>
            PermanentAddress : <%#Eval("PermanentAddress")%> , <%#Eval("City") %> , <%#Eval("State")%> <%#Eval("ZipCode")%>
            </p>
            </td>
            
            <td align="center" valign="top">
               <%#Eval("CBOName")%>
            </td>
            <td><%#Eval("CourseFullName")%></td>
            <td align="center" valign="top">
               <%#Eval("Orientation")%>
            </td>
            
            <td align="center" valign="top">
               <%#Eval("ServedHours")%>/<%#Eval("RequiredServeHours")%>
            </td>
            <td align="center" valign="top">
               <%# string.IsNullOrEmpty(Eval("SLC").ToString())?"N/A":Eval("SLC")%>
            </td>
            <td align="center" valign="top">
               <%# Convert.ToDateTime(Eval("LastUpdateTime")).ToString("MM/dd/yyyy")%>
            </td>

             <td align="center" valign="top">
                 <a href="Details.aspx?id=<%#Eval("ID") %>" class="button">Details</a>
                 <a href="Edit.aspx?id=<%#Eval("ID") %>" class="button">Edit</a>
                 <span id="<%#User.IsInRole("SLC") && !Eval("SLC").ToString().Equals(User.Identity.Name)?"s_remove":"" %>">
             <a href="#" class="button" onclick=" clearFrameCach('dialog<%#Eval("ID") %><%#Eval("CBOID") %>');$('#dialog<%#Eval("ID") %><%#Eval("CBOID") %>').dialog({width:450,height:550,close: function(event, ui) { window.location.reload(); }});return false;">Report Hours</a>
                 <a href="Search.aspx?StudentID=<%#Eval("ID") %>" class="button">Build Report</a>
             <br/>
                  <a href="#" class="button" onclick="rollover(<%#Eval("ID") %>,this);return false;">Roll Over</a>
                  <a href="#" class="button" onclick="notify(<%#Eval("ID") %>,<%#Eval("CBOID") %>,this);return false;">Notify</a>
             <a href="#" class="button" onclick='importHistoricalHours(<%#Eval("ID") %>,<%#Eval("CBOID") %>,<%#Eval("CourseID") %>,"<%#Eval("FirstName")%> <%#Eval("LastName")%>")'>Import Historical Hours</a>
             <asp:LinkButton ID="LinkButton1" CssClass="button" CommandArgument='<%#Eval("ID") %>' OnClientClick='return TipOption(this,"Are you sure to delete this student [<em>"+$(this).parent().siblings().find("#span_username").html()+"</em>]?")' OnClick="lbtDeleteMember_Click" runat="server">Delete</asp:LinkButton>
            <%--<asp:LinkButton ID="LinkButton2" CssClass="button" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("Are you sure to convert this student ["+$(this).parent().siblings().find("#span_username").html()+"] to CSSP Student?")' OnClick="lbtConvert_Click" runat="server">ConvertToCSSP</asp:LinkButton>--%>
            </span>
                 
                 
                <div class="for-dialog" id="dialog<%#Eval("ID") %><%#Eval("CBOID") %>" title="Report Hours For <%#Eval("FirstName")%> <%#Eval("LastName")%>">
                <iframe frameborder="0" scrolling="no" width="100%" height="100%" src="<%=Config.SHTrackerRoot %>/Student/ReportHours.aspx?sid=<%#Eval("ID") %>&cboid=<%#Eval("CBOID") %>&unlog=1&quarter=<%#Eval("Quater_Year") %>"></iframe>
                </div>
               

            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
    </table>
    <div class="page_bar"><ICStars:PageBar ID="pageBar1" runat="server" Size="20" Displaysize="10"/></div>
    <div id="dialog-confirm" class="for-dialog"></div>
</asp:Content>
