<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="ICStars2_0.SHTracker.Student.Search" %>

<%@ Import Namespace="ICStars2_0.BusinessLayer" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model" %>
<%@ Import namespace="System.Linq" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>
<%@ Import Namespace="ICStars2_0.Model.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    
    <script src="../Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="/SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../Scripts/UrlHelper.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.printElement.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#txtSearch").val(UrlHelper.Current.getUrlParameter("SearchText"));
            $("#sltSearchType").val(UrlHelper.Current.getUrlParameter("SearchType"));
            $("#ddlQuarterYear").val(decodeURIComponent(UrlHelper.Current.getUrlParameter("QuaterYear")));
            $("form").validate({
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
            $("#btnSearch").click(function () {
                if ($("form").valid() == false) return false;
                var url = UrlHelper.Current.setUrlParameter("QuaterYear", $("#ddlQuarterYear").val());
                url = UrlHelper.Current.setUrlParameter("SearchType", $("#sltSearchType").val(), url);
                url = UrlHelper.Current.setUrlParameter("SearchText", encodeURIComponent($("#txtSearch").val()), url);
                window.location = url;
            });
        });
        function buildReport(stuId) {
            var url = UrlHelper.Current.setUrlParameter("StudentID", stuId);
            window.location = url;
        }
        function clearFrameCach(divid) {
            var oldUrl = $("#" + divid + " iframe").attr("src");
            $("#" + divid + " iframe").attr("src", oldUrl + "&rnd=" + Math.random());
        }
    </script>
    <link href="../Content/Css/Student/Search.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <table class="toolbar">
        <tr>
            <td style="width: 150px;">
                <h2>
                    Choose Term :</h2>
            </td>
            <td>
                <%=DropDownListHelper.DropDownList("ddlQuarterYear",null, new[]
                              {
                                  new ICStars2_0.Model.Items.SelectListItem
                                      {
                                          Text = "Select Quarter",
                                          Value = "",
                                          Selected=true
                                      }
                              }.Union(DropDownListHelper.BuildQuarterYearSelectListItems()),"class=\"required\"")%>
            </td>
        </tr>
        <tr>
            <td>
                <h2>
                    Enter Text :
                </h2>
            </td>
            <td>
                <input type="text" id="txtSearch" minlength="2" class="required" />
                <select id="sltSearchType" class="required">
                    <option value="">Select Field</option>
                    <option value="1">First Name</option>
                    <option value="2">Last Name</option>
                    <option value="3">Student ID</option>
                </select>
                &nbsp;&nbsp;<input type="button" value="Search" id="btnSearch" /> &nbsp;&nbsp;<input type="button" value="Print" onclick="$('#for_print').printElement({ leaveOpen: true, printMode: 'popup',overrideElementCSS: ['/SHTracker/Content/Css/Import.css','/SHTracker/Content/Css/Student/Search.css'] });"/> 
            </td>
        </tr>
    </table>
    <%if (CurrentStudentCollection != null)
      { %>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="float:left;">
        <tr>
            <th>
                Student Name
            </th>
            <th>
                CBO
            </th>
            <th>
                Course Name
            </th>
            <th>
                Operation
            </th>
        </tr>
        <% foreach (Student student in CurrentStudentCollection)
{ %><tr>
            <td>
                <%=student.FirstName%>
                <%=student.LastName%>
            </td>
    <td>
        <%=student.CBOName %>
    </td>
            <td>
                <%=student.CourseFullName%>
            </td>
            <td>
            <input type="button" value="BuildReport" onclick="buildReport(<%=student.ID%>);"/>
            </td>
        </tr>
        <%
}%>
    </table>
    <% } %>

    <div id="for_print">
    <%if(CurrentStudent!=null)
      {
          %>
        <fieldset>
            <legend>Student Service Report
                <%=Request.QueryString["QuaterYear"]%></legend>
            <div>
                <label>
                    Student Name :</label>
                <%=CurrentStudent.FirstName %>
                <%=CurrentStudent.LastName %><br />
                <label>
                    Course Name :
                </label>
                <%=CurrentStudent.CourseFullName %><br />
               
                <label>Email : </label><%=CurrentStudent.Email %>
                </div>
            <div>
                <label>
                    Orientation :
                </label>
                <%=CurrentStudent.Orientation %><br />
                <label>
                    SLC :
                </label>
                <%=CurrentStudent.SLC %></div>
        </fieldset>
          <%
      } %>
      <%if(CurrentServiceHoursCollection != null)
        {
            foreach (Student2CBO student2Cbo in CBOList)
            {
      %>
        <h2 class="toolbar">CBO: <%=student2Cbo.CBOName %></h2>
         <label>
                    Service Hours Total/Required Hours :
                </label>
                <%=string.Format("{0:0.000}", student2Cbo.ServedTotalHours) %>/<%=string.Format("{0:0.000}", student2Cbo.RequiredHours) %><br/>
        <table id="hours_list" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="float:left;">
        <tr><th>Date</th><th>Hours Served</th><th>Contact Type</th> <th>Notes</th><th>Creator</th><th>Last Editor</th><th>Operation</th></tr>
<%
            foreach (ServiceHours serviceHours in CurrentServiceHoursCollection.Where(m=>m.CBO_ID==student2Cbo.CBOID && m.CourseID==CurrentStudent.CourseID))
            {
                %>
                <tr>
                    <td>
                        <%=serviceHours.ServiceDate.ToString("MM/dd/yyyy") %>
                    </td>
                    <td>
                        <%=string.Format("{0:0.000}", serviceHours.HoursServed) %>
                    </td>
                    <td>
                        <%=serviceHours.ContactType %>
                    </td>
                    <td>
                        <%=serviceHours.Notes %>
                    </td>
                    <td><%=serviceHours.Creator %></td>
                    <td><%=serviceHours.LastEditor %></td>
                    <td>
                        <a href="#" onclick=" clearFrameCach('dialog<%=serviceHours.ID %>');$('#dialog<%=serviceHours.ID %>').dialog({width:450,height:570,close: function(event, ui) { window.location.reload(); }});return false;">Edit</a>
                        <div class="for-dialog" id="dialog<%=serviceHours.ID %>" title="Edit Hours">
                <iframe frameborder="0" scrolling="no" width="100%" height="100%" src="<%=Config.SHTrackerRoot %>/Student/ReportHours.aspx?id=<%=serviceHours.ID %>"></iframe>
                </div>
                    </td>
                </tr>
                <%
            }
            %>
        </table>
        <%
            }
        } %>
        </div>
</asp:Content>
