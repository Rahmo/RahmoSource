<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ApplicationDetails.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.CommunityPartner.ApplicationDetails" %>
<%@ Import Namespace="ICStars2_0.Common" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Request for Service Learners Application 
</title>
    <link href="/SHTracker/Content/Css/CommunityPartner/ApplicationDetails.css" rel="stylesheet" />
    <script src="/SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/SHTracker/Scripts/jquery.printElement.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input,textarea").attr("readonly", "true");

        });
    </script>
</head>
<body>
    <div style="float:left;">&nbsp;&nbsp;<input type="button" value="Print" onclick="$('#for_print').printElement({ leaveOpen: true, pageTitle: document.title, printMode: 'popup', overrideElementCSS: ['/SHTracker/Content/Css/CommunityPartner/ApplicationDetails.css'] });"/></div>
    <div id="for_print">
    <h2>
         Request for Service Learners Application</h2>
    <hr />
    <form id="form1" runat="server">
    <div class="textbox"><label>
            <b>Organization Name :</b></label><asp:TextBox ID="txtOrganizationName" runat="server" Width="500"
                CssClass="textbox required"></asp:TextBox></div>
    <div class="textbox">
        <label>
            Region :
        </label>
        <%=CurrentApp.Region %><input type="text" class="textbox" style="width:400px"/>
        Choose Term : <%=CurrentApp.QuarterYear %></div>
<div class="textarea">
        <label style="width: 100%">
            <b>Address :</b></label>
        <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.Address) %></p></div>
            <div class="textarea">
            <label style="width: 100%">
            Which Chicago neighborhoods and/or suburban communities does your organization serve?</label>
        <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.ServeCommunities) %></p></div>
            <div class="textarea">
            <label style="width: 100%">
           <b>Service Address (if different) : </b></label>
       <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.ServiceAddress) %></p></div>
            
            <div><b>Directions : </b></div>
            <div class="textbox"><label class="pl50">
            By Public Transportation  :</label><asp:TextBox ID="txtDirections_PublicTransportation" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
            <div class="textbox"><label class="pl50">
            By Car  :</label><asp:TextBox ID="txtDirections_Car" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
            <div class="textbox"><label class="pl50">
            Street or Lot Parking :</label><asp:TextBox ID="txtDirections_Street_or_Lot_Parking" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label>
            <b>Phone  :</b></label><asp:TextBox ID="txtPhone" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label>
            <b>Fax  :</b></label><asp:TextBox ID="txtFax" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label>
            <b>Website  :</b></label><asp:TextBox ID="txtWebsite" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
               <div><b>Leadership : </b></div>
               <div class="textbox"><label class="pl50">
            Executive Director Name :</label><asp:TextBox ID="txtLeadership_ExecutiveDirectorName" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Work Phone :</label><asp:TextBox ID="txtLeadership_WorkPhone" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Cell Phone :</label><asp:TextBox ID="txtLeadership_CellPhone" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            E-mail :</label><asp:TextBox ID="txtLeadership_Email" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            How long has the ED served in this position ?</label><asp:TextBox ID="txtLeadership_How_long_served" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>

                <div><b>Representative Provided for the Steans Center : </b></div>
                <div class="textbox"><label class="pl50">
            Name : </label><asp:TextBox ID="txtRepresentative_Name" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Title : </label><asp:TextBox ID="txtRepresentative_Title" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Department/Program : </label><asp:TextBox ID="txtRepresentative_Department_Program" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Name of Direct Supervisor : </label><asp:TextBox ID="txtRepresentative_NameofDirectSupervisor" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Address (if different from above) : </label><asp:TextBox ID="txtRepresentative_Address" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Work Phone : </label><asp:TextBox ID="txtRepresentative_workPhone" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Cell Phone : </label><asp:TextBox ID="txtRepresentative_CellPhone" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Email : </label><asp:TextBox ID="txtRepresentative_Email" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>
                <div class="textbox"><label class="pl50">
            Preferred mode of contact : </label><asp:TextBox ID="txtRepresentative_ContactMode" runat="server" Width="300"
                CssClass="textbox"></asp:TextBox></div>

                <div class="textarea">
        <label style="width: 100%">
            <b>Organizational Mission :</b></label>
        <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.OrganizationalMission) %></p></div>


             <div class="">
        <label style="width:100%;float:left">
            <b>Primary Population(s) Served (check or bold all that apply) :</b>
        </label>
        <%=CurrentApp.PrimaryPopulationServed%><br/>
        <%if (!string.IsNullOrEmpty(CurrentApp.PrimaryPopulationServed_EthnicCommunitySpecific))
          {%>
          Ethnic Community :<span class="textbox"><%=CurrentApp.PrimaryPopulationServed_EthnicCommunitySpecific %></span><br/>
        <% } %>
        <%if (!string.IsNullOrEmpty(CurrentApp.PrimaryPopulationServed_Other))
          {%>
          Other :<span class="textbox"><%=CurrentApp.PrimaryPopulationServed_Other%></span>
        <% } %>
    </div>
    <div class="">
        <label style="width:100%">
            <b>Major Programs & Services Provided (check or bold all that apply :</b>
        </label>
        <%=CurrentApp.MajorProgramsServicesProvided%><br/>
        <%if (!string.IsNullOrEmpty(CurrentApp.MajorProgramsServicesProvided_Other))
          {%>
          Other :<span class="textbox"><%=CurrentApp.MajorProgramsServicesProvided_Other%></span>
        <% } %>
    </div>

    <div style="border:solid 1px #000;width:99%;margin-top:20px;text-align:center;"><b>Service Interest and Opportunities</b></div>
    <div>
    <label style="width:100%">
            1.	What mode of service are you looking for from DePaul’s service learning students?
        </label>
        
   <%=CurrentApp.ServiceInterestOpportunities_ServiceMode%>
        
    </div>
    <div>
<label style="width:100%">2.	Would your organization be interested in participating in Community-based Research Projects?</label>
        <%=CurrentApp.ServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects%>
</div>
<div style="width:100%">
3.	Please specify in detail the task(s), number of students and availability needed for each from DePaul’s service learning students.  Also please explain your understanding of each task’s relevance to the Steans Center’s service learning mission.
</div>
<div style="width:98%;border:solid 1px #000;padding:5px;">
<label style="width:99%;border-bottom:solid 1px #000;"><b>Task #1 : </b><%=CurrentApp.ServiceInterestOpportunities_Task1 %></label>

<div class="textarea">
        <label >
            Description :</label>
        <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.ServiceInterestOpportunities_Task1_Description) %></p></div>
            <div class="textbox">
        <label>
            # of Students :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task1_NumberofStudents" runat="server" Width="600" CssClass="textbox required"></asp:TextBox></div>
        <div class="textbox">
        <label>
            Availability needed :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task1_AvailabilityNeeded" runat="server" Width="600" CssClass="textbox required"></asp:TextBox></div>
</div>
<div style="width:98%;border:solid 1px #000;padding:5px;margin-top:10px;">
<label style="width:99%;border-bottom:solid 1px #000;"><b>Task #2 : <%=CurrentApp.ServiceInterestOpportunities_Task2 %></b></label>

<div class="textarea">
        <label >
            Description :</label>
        <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.ServiceInterestOpportunities_Task2_Description) %></p></div>
            <div class="textbox">
        <label>
            # of Students :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task2_NumberofStudents" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
        <div class="textbox">
        <label>
            Availability needed :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task2_AvailabilityNeeded" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
</div>
<div style="width:98%;border:solid 1px #000;padding:5px;margin-top:10px;">
<label style="width:99%;border-bottom:solid 1px #000;"><b>Task #3 : <%=CurrentApp.ServiceInterestOpportunities_Task3 %></b></label>

<div class="textarea">
        <label >
            Description :</label>
        <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.ServiceInterestOpportunities_Task3_Description) %></p></div>
            <div class="textbox">
        <label>
            # of Students :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task3_NumberofStudents" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
        <div class="textbox">
        <label>
            Availability needed :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task3_AvailabilityNeeded" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
</div>
<div style="width:98%;border:solid 1px #000;padding:5px;margin-top:10px;">
<label style="width:99%;border-bottom:solid 1px #000;"><b>Task #4 : <%=CurrentApp.ServiceInterestOpportunities_Task4 %></b></label>

<div class="textarea">
        <label >
            Description :</label>
        <p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentApp.ServiceInterestOpportunities_Task4_Description) %></p></div>
            <div class="textbox">
        <label>
            # of Students :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task4_NumberofStudents" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
        <div class="textbox">
        <label>
            Availability needed :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task4_AvailabilityNeeded" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
</div>

<div><b>Background Checks</b></div>
<div style="width:100%">
<label style="width:100%">Does your organization require its volunteers to complete a back ground check?</label>
        <%=CurrentApp.ServiceInterestOpportunities_BackgroundChecks_RequireVolunteers%>

</div>
<div>
If yes, please specify what type of background check and time needed for approval:
</div>
<table style="width:100%;display:block;">
    <tr><td style="width:250px;"><asp:CheckBox ID="cbxServiceInterestOpportunities_BackgroundChecks_BackgroundCheck" runat="server" />Background Check</td><td>Approval Time  <span class="textbox"><asp:TextBox ID="txtServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime" runat="server" Width="400"
                CssClass="textbox"></asp:TextBox></span></td></tr>
    <tr><td><asp:CheckBox ID="cbxServiceInterestOpportunities_BackgroundChecks_TBTesting" runat="server" />TB Testing</td><td>Approval Time  <span class="textbox"><asp:TextBox ID="txtServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime" runat="server" Width="400"
                CssClass="textbox"></asp:TextBox></span></td></tr>
    <tr><td><asp:CheckBox ID="cbxServiceInterestOpportunities_BackgroundChecks_Fingerprinting" runat="server" />Fingerprinting</td><td>Approval Time  <span class="textbox"><asp:TextBox ID="txtServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime" runat="server" Width="400"
                CssClass="textbox"></asp:TextBox></span></td></tr>

</table>
<div style="text-align:center;width:98%;font-size:18px;border:solid 1px #000;margin-top:10px;padding:5px;"><b>Site Representative Commitment</b></div>
<div style="width:98%;border:solid 1px #000;margin-top:10px;padding:5px;">
<b>Placement Week</b><br/>
<p>Placement of DePaul service learning students at community organizations takes place at the first or second meeting of a course in an academic quarter.</p>
<br/>
<p style="float:left;"><b>Will you or another representative be available to present a 5-minute organizational presentation at DePaul’s city and/or suburban campuses on one or more days during the first week of the academic quarter (Academic Calendar attached)?</b><br/>
    <%=CurrentApp.SiteRepresentativeCommitment_PresentationQuarter%>

</p>
<p style="border-top:solid 1px #000;">
<b>Orientation/Training Week</b><br/>
DePaul service learning students are expected to complete an orientation and training during the second week of the academic quarter and then immediately schedule and begin their service.
<br/>
<b>Are you willing to schedule and facilitate a comprehensive orientation (presenting volunteer policies, community and organization history, the importance of service to the community in conjunction with Steans Center Orientation requirements) for student Service Learners on one or more days during the second week of the academic quarter (Academic Calendar attached)?</b><br/>
<%=CurrentApp.SiteRepresentativeCommitment_ScheduleOrientation%>
</p>
<p style="border-top:solid 1px #000;">
<b>Time Commitment</b><br/>
<b>How many hours per 10-week quarter is your organization willing to commit to supervision of service learning students, correspondence and future service planning with a Service Learning Coordinator:</b><span class="textbox"><asp:TextBox ID="txtSiteRepresentativeCommitment_TimeCommitment" runat="server" Width="40"
                CssClass="textbox"></asp:TextBox></span>
</p><p style="border-top:solid 1px #000;">
<b>Feedback</b><br/>
<b>Are you willing to complete a Program Feedback Form at the end of every 10-week quarter providing thoughtful feedback to the Steans Center regarding the level of its support and the performance of all service learning students supervised?</b><br/>
<%=CurrentApp.SiteRepresentativeCommitment_Feedback%>
</p><p style="border-top:solid 1px #000;">
<b>DePaul Partners Listserv</b><br/>
<b>In order to keep our Community Partners updated regarding new developments and opportunities through the Steans Center we highly encourage participants to sign up on our DePaul Partners listserv and attend our quarterly Community Development Workshops.  Will you be willing to participate in? </b><br/>
<%=CurrentApp.SiteRepresentativeCommitment_DePaulPartnersListserv%>
</p>
</div>
<div class="textbox">
        <label>
            Name :</label>
        <asp:TextBox ID="txtName" runat="server" Width="300" CssClass="textbox"></asp:TextBox><label>
            Date :</label>
        <asp:TextBox ID="txtDate" runat="server" Width="300" CssClass="textbox"></asp:TextBox></div>
<div class="textbox">
        <label>
            Title :</label>
        <asp:TextBox ID="txtTitle" runat="server" Width="300" CssClass="textbox"></asp:TextBox><label>
            Current Steans Center Contact :</label>
        <asp:TextBox ID="txtCurrentSteansCenterContact" runat="server" Width="200" CssClass="textbox"></asp:TextBox></div>
       

            <div style="height:20px;">&nbsp;</div>
            <div style="text-align:center;width:100%;font-size:11px;color:#FFF;background-color:Gray;height:20px;line-height:20px;">CopyRight Depaul Steans Center</div>
    </form>
        </div>
</body>
</html>
