<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="MyCourse.aspx.cs" Inherits="ICStars2_0.SHTracker.Report.MyCourse" %>
<%@ Import Namespace="ICStars2_0.BusinessLayer.StudentServices" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>
<%@ Import Namespace="ICStars2_0.Model.Items" %>
<%@ Import Namespace="ICStars2_0.Model.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/UrlHelper.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.printElement.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            var courseid = UrlHelper.Current.getUrlParameter("CourseID");
            var term = UrlHelper.Current.getUrlParameter("Term");
            if ($("#ddlQuarterYear").html()) {
                $("#ddlQuarterYear").val(decodeURIComponent(term));
            }
            $("#CourseID").val(courseid);
            $("#course_title").html($("#CourseID option:selected").text());
        });
        function buildReport() {

            var url = UrlHelper.Current.setUrlParameter("CourseID", $("#CourseID").val());
            if ($("#ddlQuarterYear").html()) {
                url = UrlHelper.Current.setUrlParameter("Term", $("#ddlQuarterYear").val(), url);
            }
            window.location = url;
        }
    </script>
    <link href="/SHTracker/Content/Css/Student/MyCourse.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<h2>Build Report <%=Request.QueryString["term"] %></h2>
    <%if (User.IsInRole("CSSP"))
      {
          %>
    <h2>Choose Term : <%=DropDownListHelper.DropDownList("ddlQuarterYear",null, new[]
                              {
                                  new ICStars2_0.Model.Items.SelectListItem
                                      {
                                          Text = "All",
                                          Value = "",
                                          Selected=true
                                      }
                              }.Union(DropDownListHelper.BuildQuarterYearSelectListItems()))%></h2>
    <%
      } %>
<h2>
Choose Course : <%=DropDownListHelper.DropDownList("CourseID", this.CourseNameList)%> &nbsp;&nbsp;<input type="button" value="BuildReport" onclick="buildReport();"/> &nbsp;&nbsp;<input type="button" value="Print" onclick="$('#report').printElement({ leaveOpen: true, printMode: 'popup',overrideElementCSS: ['/SHTracker/Content/Css/Import.css','/SHTracker/Content/Css/Student/MyCourse.css'] });"/> &nbsp;&nbsp;<input type="button" value="Go Back" onclick="window.location='ChooseTerm.aspx';"/>
</h2>
    
<div id="report">
    <% var isCSSP = User.IsInRole("CSSP"); %>
<em><asp:Literal ID="ltlError" runat="server"></asp:Literal></em>
<h1>Service Progress Report <%=Request.QueryString["term"] %></h1>
<h3>Report Generated: <%=DateTime.Now.ToString("MM/dd/yyyy") %></h3>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    
   <tr><th colspan="5" align="center" style="text-align:center;padding:5px;"><span id="course_title"></span></th></tr>
   
   <% foreach (CBO cbo in CurrentCBOList)
      {
          %>
        <tr>
            <td colspan="5" style="background-color: #ccc;">
                <span class="span_cbo">
                    CBO : <b><%=cbo.Name %></b></span>
                <span class="span_slc"><%if(!string.IsNullOrEmpty(cbo.SLC)){%>SLC :
                        <b><%=cbo.SLC %></b><br/>Email : <b><%=cbo.SLC_Email %></b>  Phone : <b><%=cbo.SLC_Phone %></b><br/>
                        Office Hours : <b><%=cbo.SLC_OfficeHours %></b>
                    <%} %>
                                                      </span>
            </td>
        </tr>
        <tr>
            <th>Quarter</th>
   <th>Student Name</th>
   <th>Hours Completed/Hours <%=isCSSP?"Estimated":"Required" %></th>
   <th>Date Updated</th>
   </tr>
   <% IStudentReportCollection src = BuildStudentReportCollection(cbo.ID, Convert.ToInt32(
    Request.QueryString["CourseID"]));
          foreach (StudentReport studentReport in src)
          {
              %>
              <tr>
                  <td><%=studentReport.Quater_Year %></td>
              <td><%=studentReport.FirstName %> <%=studentReport.LastName %></td>
              <td><%=studentReport.HoursCompleted %>/<%=studentReport.RequiredServeHours %></td>
              <td><%=studentReport.LastUpdateTime.ToString("MM/dd/yyyy") %></td>
              </tr>
              <%
          } %>
                                                                
          <%
      } %>
</table>
</div>
</asp:Content>
