<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceLearnersApplication.aspx.cs" Inherits="ICStars2_0.communityPartners.ServiceLearnersApplication" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request for Service Learners Application 
</title>
    <script src="../SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../SHTracker/Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="../SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../SHTracker/Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <style type="text/css">
        body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, p, blockquote, th, td
        {
            margin: 0;
            padding: 0;
            width: auto;
        }
        body
        {
            margin: 0 auto;
            padding: 0 auto;
            padding-top: 50px;
        }
        html
        {
            text-align: center;
        }
        body
        {
            text-align: center;
            width: 800px;
            line-height: 26px;
            font-family: Georgia;
        }
        input.textbox
        {
            border: 0px;
            height: 20px;
        }
        textarea.textarea
        {
            border: 0px;
            width: 100%;
            height: 104px;
            line-height: 26px;
            background: #fff url(/Images/textbox_bg.png) repeat 0 0;
        }
        input.button
        {
            border: 1px solid #000;
            background-color: grey;
            color: #fff;
        }
        form
        {
            text-align: left;
        }
        label
        {
            height: 27px;
            line-height: 27px;
            background-color: #FFF;
            display: inline-block;
            padding-right: 5px;
        }
        form div,table,p
        {
            float: left;
        }
        form div.textbox
        {
            margin-top: 10px;
            border-bottom: 1px solid #000;
            height: 26px;
            line-height: 26px;
            float: left;
            width: 100%;
        }
        span.textbox
        {
            display:inline-block;
            border-bottom: 1px solid #000;
            height: 20px;
            line-height: 20px;
        }
        form div.textarea
        {
            margin-top: 10px;
            line-height: 26px;
            float: left;
            width: 100%;
        }
         label.error
            {
                display:block;
                float:left;
                z-index:9999px;
                position:absolute;
                color:Red;
                font-weight:bold;
                border:1px solid red;
                }
                .required{}
                .pl50{padding-left:50px;}
    </style>
    <script type="text/javascript">

        $(function () {

            $("#<%=txtDate.ClientID %>,#<%=txtServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime.ClientID %>,#<%=txtServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime.ClientID %>,#<%=txtServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime.ClientID %>").attr("readonly", "true").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $("form").validate({
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
            $.validator.addMethod("AtLeast", function (value, elem, param) {
                if ($(".AtLeast:checkbox:checked").length > 0 || $("input[type='text'].AtLeast").val() != "") {
                    return true;
                } else {
                    return false;
                }
            }, "You must select at least one!");
            $.validator.addClassRules("AtLeast", {
                AtLeast: true
            });
            //            $(".AtLeast:checkbox:").rules("add", {
            //                AtLeast: true,
            //                messages: {
            //                    required: "Required input"
            //                }
            //            });
        });

        function checkForm() {
            if ($("form").valid()) return true;
            $("label.error").each(function () {
                var target = $("#" + $(this).attr("for"));

                var targetOffset = target.offset();

                var tHeight = (target.outerHeight() + $(this).outerHeight()) / 2;
                var tWidth = target.outerWidth();
                $(this).css({ left: targetOffset.left + (tWidth<120?tWidth: (tWidth / 2)), top: targetOffset.top + (tHeight > 30 ? tHeight / 2 : (target.outerHeight() - $(this).outerHeight())) });

            });

            return false;
        }
    </script>
</head>
<body>

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
        <asp:DropDownList ID="ddlRegion" runat="server" CssClass="required">
        <asp:ListItem Value="">Select Region</asp:ListItem>
            <asp:ListItem Value="South">South</asp:ListItem>
            <asp:ListItem Value="North">North</asp:ListItem>
            <asp:ListItem Value="West">West</asp:ListItem>
            <asp:ListItem Value="Loop">Loop</asp:ListItem>
            <asp:ListItem Value="Suburb">Suburb</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList><input type="text" class="textbox" style="width:400px"/>
        Choose Term : <asp:DropDownList ID="ddlQuarterYear" CssClass="required" runat="server">
            <asp:ListItem Value="">Select Term</asp:ListItem>
            <asp:ListItem Value="Spring 2012">Spring 2012</asp:ListItem>
            <asp:ListItem Value="Summer 2012">Summer 2012</asp:ListItem>
            <asp:ListItem Value="Fall 2012">Fall 2012</asp:ListItem>
            <asp:ListItem Value="Winter 2013">Winter 2013</asp:ListItem>
            <asp:ListItem Value="Spring 2013">Spring 2013</asp:ListItem>
            <asp:ListItem Value="Summer 2013">Summer 2013</asp:ListItem>
            <asp:ListItem Value="Fall 2013">Fall 2013</asp:ListItem>
            <asp:ListItem Value="Winter 2014">Winter 2014</asp:ListItem>
            <asp:ListItem Value="Spring 2014">Spring 2014</asp:ListItem>
            <asp:ListItem Value="Summer 2014">Summer 2014</asp:ListItem>
            <asp:ListItem Value="Fall 2014">Fall 2014</asp:ListItem>
            <asp:ListItem Value="Winter 2015">Winter 2015</asp:ListItem>
            <asp:ListItem Value="Spring 2015">Spring 2015</asp:ListItem>
            <asp:ListItem Value="Summer 2015">Summer 2015</asp:ListItem>
            <asp:ListItem Value="Fall 2015">Fall 2015</asp:ListItem>
            <asp:ListItem Value="Winter 2016">Winter 2016</asp:ListItem>
            <asp:ListItem Value="Spring 2016">Spring 2016</asp:ListItem>
            <asp:ListItem Value="Summer 2016">Summer 2016</asp:ListItem>
            <asp:ListItem Value="Fall 2016">Fall 2016</asp:ListItem>
            <asp:ListItem Value="Winter 2017">Winter 2017</asp:ListItem>
            </asp:DropDownList></div>
<div class="textarea">
        <label style="width: 100%">
            <b>Address :</b></label>
        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>
            <div class="textarea">
            <label style="width: 100%">
            Which Chicago neighborhoods and/or suburban communities does your organization serve?</label>
        <asp:TextBox ID="txtServeCommunities" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            <div class="textarea">
            <label style="width: 100%">
           <b>Service Address (if different) : </b></label>
        <asp:TextBox ID="txtServiceAddress" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            
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
        <asp:TextBox ID="txtOrganizationalMission" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>


             <div class="">
        <label style="width:100%">
            <b>Primary Population(s) Served (check or bold all that apply) :</b>
        </label>
        <input type="checkbox" name="PrimaryPopulationServed" value="Artists"/>Artists<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Community Residents"/>Community Residents<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Elderly"/>Elderly<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Ethnic Community "/>Ethnic Community (please specify:<span class="textbox"><asp:TextBox ID="txtPrimaryPopulationServed_EthnicCommunitySpecific" runat="server" Width="400"
                CssClass="textbox"></asp:TextBox></span>)<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Ex-Offenders"/>Ex-Offenders<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Homeless"/>Homeless<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Immigrants"/>Immigrants<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="International"/>International<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="LGBTQ "/>LGBTQ <br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Physically/Mentally Challenged"/>Physically/Mentally Challenged<br/>
        <input type="checkbox" name="PrimaryPopulationServed" value="Youth"/>Youth<br/>
        &nbsp;&nbsp;&nbsp;Other<span class="textbox"><asp:TextBox ID="txtPrimaryPopulationServed_Other" runat="server" Width="600"
                CssClass="textbox"></asp:TextBox></span><br/>
    </div>
    <div class="">
        <label style="width:100%">
            <b>Major Programs & Services Provided (check or bold all that apply :</b>
        </label>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Adult Education"/>Adult Education<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Affordable Housing"/>Affordable Housing<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Animal Rights"/>Animal Rights<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Arts/Music"/>Arts/Music<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Children's Rights"/>Children's Rights<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Cultural Awareness"/>Cultural Awareness<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Digital Training"/>Digital Training<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Domestic Violence Prevention and Awareness"/>Domestic Violence Prevention and Awareness<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="English as a Second Language (ESL) Education"/>English as a Second Language (ESL) Education<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Environmental Advocacy and Services"/>Environmental Advocacy and Services<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Family"/>Family<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Financial Literacy"/>Financial Literacy<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="HIV/Aids Awareness, Prevention"/>HIV/Aids Awareness, Prevention<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Homeless Advocacy"/>Homeless Advocacy<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Human Rights"/>Human Rights<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Immigrant Rights and Services"/>Immigrant Rights and Services<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Job/Employment Training"/>Job/Employment Training<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="LGBTQ Advocacy"/>LGBTQ Advocacy<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Labor Union Advocacy"/>Labor Union Advocacy <br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Neighborhood Associations"/>Neighborhood Associations<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Obesity Prevention"/>Obesity Prevention<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Physical/Mental/Developmental"/>Physical/Mental/Developmental<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Post-Incarceration Transitioning"/>Post-Incarceration Transitioning<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Religious Rights, Advocacy"/>Religious Rights, Advocacy<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Women's Health/Reproductive Rights/Empowerment"/>Women's Health/Reproductive Rights/Empowerment<br/>
        <input type="checkbox" class="AtLeast" name="MajorProgramsServicesProvided" value="Youth Development and Empowerment"/>Youth Development and Empowerment<br/>
   
        &nbsp;&nbsp;&nbsp;Other<span class="textbox"><asp:TextBox ID="txtMajorProgramsServicesProvided_Other" runat="server" Width="600"
                CssClass="textbox AtLeast"></asp:TextBox></span><br/>
    </div>

    <div style="border:solid 1px #000;width:99%;margin-top:20px;text-align:center;"><b>Service Interest and Opportunities</b></div>
    <div>
    <label style="width:100%">
            1.	What mode of service are you looking for from DePaul’s service learning students?
        </label>
        
    <input type="checkbox" value="Direct Service" name="ServiceInterestOpportunities_ServiceMode"/>Direct Service<br/>
    <input type="checkbox" value="Project-based" name="ServiceInterestOpportunities_ServiceMode"/>Project-based<br/>
    <input type="checkbox" value="Research" name="ServiceInterestOpportunities_ServiceMode"/>Research<br/>
    <input type="checkbox" value="Advocacy" name="ServiceInterestOpportunities_ServiceMode"/>Advocacy
        
    </div>
    <div>
<label style="width:100%">2.	Would your organization be interested in participating in Community-based Research Projects?</label>
        <asp:RadioButtonList ID="rblServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects" runat="server">
        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No">No</asp:ListItem>
        </asp:RadioButtonList>
</div>
<div style="width:100%">
3.	Please specify in detail the task(s), number of students and availability needed for each from DePaul’s service learning students.  Also please explain your understanding of each task’s relevance to the Steans Center’s service learning mission.
</div>
<div style="width:99%;border:solid 1px #000;padding:5px;">
<div class="textbox"><label>
            Task #1 : </label><asp:TextBox ID="txtTask1" runat="server" Width="500"
                CssClass="textbox required"></asp:TextBox></div>
<div class="textarea">
        <label >
            Description :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task1_Description" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>
            <div class="textbox">
        <label>
            # of Students :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task1_NumberofStudents" runat="server" Width="600" CssClass="textbox required"></asp:TextBox></div>
        <div class="textbox">
        <label>
            Availability needed :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task1_AvailabilityNeeded" runat="server" Width="600" CssClass="textbox required"></asp:TextBox></div>
</div>
<div style="width:99%;border:solid 1px #000;padding:5px;margin-top:10px;">
<div class="textbox"><label>
            Task #2 : </label><asp:TextBox ID="txtTask2" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>

<div class="textarea">
        <label >
            Description :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task2_Description" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            <div class="textbox">
        <label>
            # of Students :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task2_NumberofStudents" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
        <div class="textbox">
        <label>
            Availability needed :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task2_AvailabilityNeeded" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
</div>
<div style="width:99%;border:solid 1px #000;padding:5px;margin-top:10px;">
<div class="textbox"><label>
            Task #3 : </label><asp:TextBox ID="txtTask3" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>

<div class="textarea">
        <label >
            Description :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task3_Description" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            <div class="textbox">
        <label>
            # of Students :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task3_NumberofStudents" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
        <div class="textbox">
        <label>
            Availability needed :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task3_AvailabilityNeeded" runat="server" Width="600" CssClass="textbox"></asp:TextBox></div>
</div>
<div style="width:99%;border:solid 1px #000;padding:5px;margin-top:10px;">
<div class="textbox"><label>
            Task #4 : </label><asp:TextBox ID="txtTask4" runat="server" Width="500"
                CssClass="textbox"></asp:TextBox></div>

<div class="textarea">
        <label >
            Description :</label>
        <asp:TextBox ID="txtServiceInterestOpportunities_Task4_Description" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
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
        <asp:RadioButtonList ID="cblServiceInterestOpportunities_BackgroundChecks_RequireVolunteers" runat="server">
        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No">No</asp:ListItem>
        </asp:RadioButtonList>

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
<div style="text-align:center;width:99%;font-size:18px;border:solid 1px #000;margin-top:10px;padding:5px;"><b>Site Representative Commitment</b></div>
<div style="width:99%;border:solid 1px #000;margin-top:10px;padding:5px;">
<b>Placement Week</b><br/>
<p>Placement of DePaul service learning students at community organizations takes place at the first or second meeting of a course in an academic quarter.</p>
<br/>
<p style="float:left;"><b>Will you or another representative be available to present a 5-minute organizational presentation at DePaul’s city and/or suburban campuses on one or more days during the first week of the academic quarter (Academic Calendar attached)?</b><br/>
    <input type="checkbox" value="Fall Quarter" name="SiteRepresentativeCommitment_PresentationQuarter"/>Fall Quarter<br/>
    <input type="checkbox" value="Winter Quarter" name="SiteRepresentativeCommitment_PresentationQuarter"/>Winter Quarter<br/>
    <input type="checkbox" value="Spring Quarter" name="SiteRepresentativeCommitment_PresentationQuarter"/>Spring Quarter<br/>
    <input type="checkbox" value="Summer Quarter" name="SiteRepresentativeCommitment_PresentationQuarter"/>Summer Quarter

</p>
<p style="border-top:solid 1px #000;">
<b>Orientation/Training Week</b><br/>
DePaul service learning students are expected to complete an orientation and training during the second week of the academic quarter and then immediately schedule and begin their service.
<br/>
<b>Are you willing to schedule and facilitate a comprehensive orientation (presenting volunteer policies, community and organization history, the importance of service to the community in conjunction with Steans Center Orientation requirements) for student Service Learners on one or more days during the second week of the academic quarter (Academic Calendar attached)?</b><br/>
<asp:RadioButtonList ID="rblSiteRepresentativeCommitment_ScheduleOrientation" RepeatLayout="Flow" RepeatDirection="Horizontal"  runat="server">
        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No">No</asp:ListItem>
        </asp:RadioButtonList>
</p>
<p style="border-top:solid 1px #000;">
<b>Time Commitment</b><br/>
<b>How many hours per 10-week quarter is your organization willing to commit to supervision of service learning students, correspondence and future service planning with a Service Learning Coordinator:</b><span class="textbox"><asp:TextBox ID="txtSiteRepresentativeCommitment_TimeCommitment" runat="server" Width="40"
                CssClass="textbox"></asp:TextBox></span>
</p><p style="border-top:solid 1px #000;">
<b>Feedback</b><br/>
<b>Are you willing to complete a Program Feedback Form at the end of every 10-week quarter providing thoughtful feedback to the Steans Center regarding the level of its support and the performance of all service learning students supervised?</b><br/>
<asp:RadioButtonList ID="rblSiteRepresentativeCommitment_Feedback" RepeatLayout="Flow" RepeatDirection="Horizontal"  runat="server">
        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No">No</asp:ListItem>
        </asp:RadioButtonList>
</p><p style="border-top:solid 1px #000;">
<b>DePaul Partners Listserv</b><br/>
<b>In order to keep our Community Partners updated regarding new developments and opportunities through the Steans Center we highly encourage participants to sign up on our DePaul Partners listserv and attend our quarterly Community Development Workshops.  Will you be willing to participate in? </b><br/>
<asp:RadioButtonList ID="rblSiteRepresentativeCommitment_DePaulPartnersListserv" RepeatLayout="Flow" RepeatDirection="Horizontal"  runat="server">
        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No">No</asp:ListItem>
        </asp:RadioButtonList>
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
       
                <div style="width: 100%; text-align: center; margin-top: 20px;">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
            CssClass="button" OnClientClick="return checkForm();" /><span style="color:Red;font-weight:bold;"><asp:Literal ID="ltlError" runat="server"></asp:Literal></span></div>
            <div style="height:20px;">&nbsp;</div>
            <div style="text-align:center;width:100%;font-size:11px;color:#FFF;background-color:Gray;height:20px;line-height:20px;">CopyRight Depaul Steans Center</div>
    </form>
</body>
</html>
