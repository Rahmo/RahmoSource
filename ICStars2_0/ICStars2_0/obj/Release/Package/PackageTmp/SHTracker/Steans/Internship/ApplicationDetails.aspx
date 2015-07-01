<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationDetails.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.Internship.ApplicationDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/SHTracker/Content/Css/Intership/ApplicationDetails.css" rel="stylesheet" />
    <script src="/SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/SHTracker/Scripts/jquery.printElement.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input,textarea").attr("readonly", "true");

        });
    </script>
</head>
<body>
    <div style="float:left;">&nbsp;&nbsp;<input type="button" value="Print" onclick="$('#for_print').printElement({ leaveOpen: true,pageTitle:document.title, printMode: 'popup', overrideElementCSS: ['/SHTracker/Content/Css/Intership/ApplicationDetails.css'] });"/></div>
    <div id="for_print">
    <h2>
        <asp:Literal ID="ltlName" runat="server"></asp:Literal>'s Application</h2>
    <hr />
    <form id="form1" runat="server">
    <div class="textbox">
        <label>
            Name :
        </label>
        <asp:TextBox ID="txtName" runat="server" Width="500" CssClass="textbox"></asp:TextBox> Term : 
        <asp:Literal ID="ltlTerm" runat="server"></asp:Literal></div>

    <div class="textbox">
        <label>
            Address :</label>
        <asp:TextBox ID="txtAddress" runat="server" Width="700" CssClass="textbox"></asp:TextBox></div>

    <div class="textbox">
        <label>
            DePaul ID number :</label><asp:TextBox ID="txtDepaulID" runat="server" Width="200"
                CssClass="textbox"></asp:TextBox></div>

    <div class="textbox">
        <label>
            Date of Birth :</label>
        <asp:TextBox ID="txtDateOfBirth" runat="server" Width="270" CssClass="textbox"></asp:TextBox><label>
            Gender :
        </label>
        <asp:RadioButton ID="rbtMale" runat="server" Checked="false" GroupName="Gender" />
        M
        <asp:RadioButton ID="rbtFemale" Checked="false" GroupName="Gender" runat="server" />
        F
    </div>

    <div class="textbox">
        <label>
            Home phone number :</label>
        <asp:TextBox ID="txtHomePhoneNumber" runat="server" Width="210" CssClass="textbox"></asp:TextBox><label>
            Cell phone number :</label><asp:TextBox ID="txtCellPhoneNumber" runat="server" Width="200"
                CssClass="textbox"></asp:TextBox></div>

    <div class="textbox">
        <label>
            E-mail address :</label>
        <asp:TextBox ID="txtEmail" runat="server" Width="500" CssClass="textbox"></asp:TextBox></div>

    <div class="textbox">
        <label>
            Racial/Ethnic Background :</label>
        <asp:TextBox ID="txtRacialBackground" runat="server" Width="300" CssClass="textbox"></asp:TextBox></div>

    <div class="textbox">
        <label>
            DePaul Expected Graduation Date :</label>
        <asp:TextBox ID="txtDepaulExpectedGraduationDate" runat="server" Width="300" CssClass="textbox"></asp:TextBox></div>

    <div class="textbox">
        <label>
            School or College :
        </label>
        <asp:Literal ID="ltlCollege" runat="server"></asp:Literal>
    </div>

    <div class="textbox">
        <label>
            Major area of academic focus :</label>
        <asp:TextBox ID="txtMajorAreaOfAcademicFocus" runat="server" Width="300" CssClass="textbox"></asp:TextBox></div>

    <div class="textbox">
        <label>
            Minor area of academic focus :</label>
        <asp:TextBox ID="txtMinorAreaOfAcademicFocus" runat="server" Width="300" CssClass="textbox"></asp:TextBox></div>

    <div class="textarea">
        <label style="width: 100%">
            List all community-based service learning courses previously taken at DePaul :</label>
        <asp:TextBox ID="txtCommunityBasedServiceLearningCourses" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>

    <div class="textarea">
        <label style="width: 100%">
            What types of service and/or community work have you been involved with since your
            enrollment at DePaul :</label>
        <asp:TextBox ID="txtServiceCommunityWorkInvoledAtDepaul" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>


    <div class="textarea">
        <label style="width: 100%">
            Please state how this internship relates to a course, research project or academic
            pursuit :</label>
        <asp:TextBox ID="txtHowInternshipRelatesToACourseProjectPursuit" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>

    <div class="textarea">
        <label style="width: 100%">
            •	How will this experience relate to your personal, academic and career goals? :</label>
        <asp:TextBox ID="txtHowExperienceRelateToGoals" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            
            <div style="width: 100%;margin-top:10px;">Please state at least three specific learning goals for this internship: </div>
            <div class="textarea">
        <label>1. </label>
        <asp:TextBox ID="txtSpecific_learning_goals1" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            <div class="textarea">
        <label>2. </label>
        <asp:TextBox ID="txtSpecific_learning_goals2" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            <div class="textarea">
        <label>3. </label>
        <asp:TextBox ID="txtSpecific_learning_goals3" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>

            <div style="width: 100%;margin-top:10px;">Please list two references, one academic and one other: </div>
            <div class="textarea">
        <label>1. </label>
        <asp:TextBox ID="txtReferences_Academic" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            <div class="textarea">
        <label>2. </label>
        <asp:TextBox ID="txtReferences_Other" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>

            <div style="width: 100%;margin-top:10px;">Please list preferred site/s (optional):</div>
            <div class="textarea">
        <label>1. </label>
        <asp:TextBox ID="txtPreferred_Site1" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>
            <div class="textarea">
        <label>2. </label>
        <asp:TextBox ID="txtPreferred_Site2" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea"></asp:TextBox></div>

            <div style="width: 100%;margin-top:10px;font-style:italic">Please note: This course is “by instructor only”. Filling out the application does not guarantee your enrollment in the course. Preference is given to Community Service Studies minors.</div>
            <div class="textbox">
        <label>
            Intern Sign :</label>
        <asp:TextBox ID="txtInternSign" runat="server" Width="400" CssClass="textbox"></asp:TextBox><label>
            Date :</label><asp:TextBox ID="txtInternSignDate" runat="server" Width="200"
                CssClass="textbox"></asp:TextBox></div>

                <div class="textbox">
        <label>
            Site Supervisor :</label>
        <asp:TextBox ID="txtSiteSupervisor" runat="server" Width="375" CssClass="textbox"></asp:TextBox><label>
            Date :</label><asp:TextBox ID="txtSiteSupervisorDate" runat="server" Width="200"
                CssClass="textbox"></asp:TextBox></div>

                <div class="textbox">
        <label>
            Instructor :</label>
        <asp:TextBox ID="txtInstructor" runat="server" Width="410" CssClass="textbox"></asp:TextBox><label>
            Date :</label><asp:TextBox ID="txtInstructorDate" runat="server" Width="200"
                CssClass="textbox"></asp:TextBox></div>

    <div style="width: 100%; text-align: center; margin-top: 20px;">
        <span style="color:Red;font-weight:bold;"><asp:Literal ID="ltlError" runat="server"></asp:Literal></span></div>

            <div style="height:20px;">&nbsp;</div>
            <div style="text-align:center;width:100%;font-size:11px;color:#FFF;background-color:Gray;height:20px;line-height:20px;">CopyRight Depaul Steans Center</div>
    </form>
        </div>
</body>
    </html>
