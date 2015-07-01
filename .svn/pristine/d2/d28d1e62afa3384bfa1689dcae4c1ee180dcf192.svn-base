<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InternshipApplication.aspx.cs"
    Inherits="ICStars2_0.Students.ServiceOpportunities.InternshipApplication" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Steans Center for Community-based Service Learning and Community Service Studies
        Internship Application Form </title>
    <script src="../../SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../../SHTracker/Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="../../SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../../SHTracker/Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
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
        form div
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
    </style>
    <script type="text/javascript">
        $(function () {
            $("#<%=txtDateOfBirth.ClientID %>,#<%=txtDepaulExpectedGraduationDate.ClientID %>,#<%=txtInternSignDate.ClientID %>,#<%=txtSiteSupervisorDate.ClientID %>,#<%=txtInstructorDate.ClientID %>").attr("readonly", "true").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $("form").validate({
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
        });

        function checkForm() {
            if ($("form").valid()) return true;
            $("label.error").each(function () {
                var target = $("#" + $(this).attr("for"));

                var targetOffset = target.offset();

                var tHeight = (target.outerHeight() + $(this).outerHeight()) / 2;
                var tWidth = target.outerWidth();
                $(this).css({ left: targetOffset.left + (tWidth < 120 ? tWidth : (tWidth / 2)), top: targetOffset.top + (tHeight > 30 ? tHeight / 2 : (target.outerHeight() - $(this).outerHeight())) });

            });

            return false;
        }
    </script>
</head>
<body>
    <h2>
        Steans Center for Community-based Service Learning and</h2>
    <h2>
        Community Service Studies</h2>
    <h2>
        Internship Application Form</h2>
    <hr />
    <form id="form1" runat="server">
    <div class="textbox">
        <label>
            Name :
        </label>
        <asp:TextBox ID="txtName" runat="server" Width="500" CssClass="textbox required"></asp:TextBox>Choose Term : <asp:DropDownList ID="ddlQuarterYear" CssClass="required" runat="server">
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

    <div class="textbox">
        <label>
            Address :</label>
        <asp:TextBox ID="txtAddress" runat="server" Width="700" CssClass="textbox required"></asp:TextBox></div>

    <div class="textbox"><label>
            DePaul ID number :</label><asp:TextBox ID="txtDepaulID" runat="server" Width="500"
                CssClass="textbox required"></asp:TextBox></div>

    <div class="textbox">
        <label>
            Date of Birth :</label>
        <asp:TextBox ID="txtDateOfBirth" runat="server" Width="270" CssClass="textbox required"></asp:TextBox><label>
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
        <asp:TextBox ID="txtHomePhoneNumber" runat="server" Width="210" CssClass="textbox required"></asp:TextBox><label>
            Cell phone number :</label><asp:TextBox ID="txtCellPhoneNumber" runat="server" Width="200"
                CssClass="textbox required"></asp:TextBox></div>

    <div class="textbox">
        <label>
            E-mail address :</label>
        <asp:TextBox ID="txtEmail" runat="server" Width="500" CssClass="textbox required email"></asp:TextBox></div>

    <div class="textbox">
        <label>
            Racial/Ethnic Background :</label>
        <asp:TextBox ID="txtRacialBackground" runat="server" Width="300" CssClass="textbox required"></asp:TextBox></div>

    <div class="textbox">
        <label>
            DePaul Expected Graduation Date :</label>
        <asp:TextBox ID="txtDepaulExpectedGraduationDate" runat="server" Width="300" CssClass="textbox required"></asp:TextBox></div>

    <div class="textbox">
        <label>
            School or College :
        </label>
        <asp:CheckBox ID="cbxCommerce" runat="server" GroupName="College" />
        Commerce
        <asp:CheckBox ID="cbxCommunication" GroupName="College" runat="server" />
        Communication
        <asp:CheckBox ID="cbxComputingDigitalMedia" GroupName="College" runat="server" />
        Computing and Digital Media
        <asp:CheckBox ID="cbxLaw" GroupName="College" runat="server" />
        Law
        <asp:CheckBox ID="cbxEducation" GroupName="College" runat="server" />
        Education
    </div>
    <div class="textbox"><label style="padding-left:130px;">&nbsp;</label><asp:CheckBox ID="cbxLiberalArtsSocialSciences" GroupName="College" runat="server" />
        Liberal Arts and Social Sciences
        <asp:CheckBox ID="cbxMusic" GroupName="College" runat="server" />
        Music
        <asp:CheckBox ID="cbxScienceHealth" GroupName="College" runat="server" />
        Science and Health</div>
        <div class="textbox"><label style="padding-left:130px;">&nbsp;</label>
        <asp:CheckBox ID="cbxNewLearning" GroupName="College" runat="server" />
        New Learning
        <asp:CheckBox ID="cbxTheatre" GroupName="College" runat="server" />
        Theatre</div>

    <div class="textbox">
        <label>
            Major area of academic focus :</label>
        <asp:TextBox ID="txtMajorAreaOfAcademicFocus" runat="server" Width="300" CssClass="textbox required"></asp:TextBox></div>

    <div class="textbox">
        <label>
            Minor area of academic focus :</label>
        <asp:TextBox ID="txtMinorAreaOfAcademicFocus" runat="server" Width="300" CssClass="textbox required"></asp:TextBox></div>

    <div class="textarea">
        <label style="width: 100%">
            List all community-based service learning courses previously taken at DePaul :</label>
        <asp:TextBox ID="txtCommunityBasedServiceLearningCourses" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>

    <div class="textarea">
        <label style="width: 100%">
            What types of service and/or community work have you been involved with since your
            enrollment at DePaul :</label>
        <asp:TextBox ID="txtServiceCommunityWorkInvoledAtDepaul" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>


    <div class="textarea">
        <label style="width: 100%">
            Please state how this internship relates to a course, research project or academic
            pursuit :</label>
        <asp:TextBox ID="txtHowInternshipRelatesToACourseProjectPursuit" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>

    <div class="textarea">
        <label style="width: 100%">
            •	How will this experience relate to your personal, academic and career goals? :</label>
        <asp:TextBox ID="txtHowExperienceRelateToGoals" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>
            
            <div style="width: 100%;margin-top:10px;">Please state at least three specific learning goals for this internship: </div>
            <div class="textarea">
        <label>1. </label>
        <asp:TextBox ID="txtSpecific_learning_goals1" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>
            <div class="textarea">
        <label>2. </label>
        <asp:TextBox ID="txtSpecific_learning_goals2" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>
            <div class="textarea">
        <label>3. </label>
        <asp:TextBox ID="txtSpecific_learning_goals3" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>

            <div style="width: 100%;margin-top:10px;">Please list two references, one academic and one other: </div>
            <div class="textarea">
        <label>1. </label>
        <asp:TextBox ID="txtReferences_Academic" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>
            <div class="textarea">
        <label>2. </label>
        <asp:TextBox ID="txtReferences_Other" Height="52" runat="server" TextMode="MultiLine"
            CssClass="textarea required"></asp:TextBox></div>

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
        <asp:TextBox ID="txtInternSign" runat="server" Width="400" CssClass="textbox required"></asp:TextBox><label>
            Date :</label><asp:TextBox ID="txtInternSignDate" runat="server" Width="200"
                CssClass="textbox required"></asp:TextBox></div>

                <div class="textbox">
        <label>
            Site Supervisor :</label>
        <asp:TextBox ID="txtSiteSupervisor" runat="server" Width="375" CssClass="textbox required"></asp:TextBox><label>
            Date :</label><asp:TextBox ID="txtSiteSupervisorDate" runat="server" Width="200"
                CssClass="textbox required"></asp:TextBox></div>

                <div class="textbox">
        <label>
            Instructor :</label>
        <asp:TextBox ID="txtInstructor" runat="server" Width="410" CssClass="textbox required"></asp:TextBox><label>
            Date :</label><asp:TextBox ID="txtInstructorDate" runat="server" Width="200"
                CssClass="textbox required"></asp:TextBox></div>

    <div style="width: 100%; text-align: center; margin-top: 20px;">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
            CssClass="button" OnClientClick="return checkForm();" /><span style="color:Red;font-weight:bold;"><asp:Literal ID="ltlError" runat="server"></asp:Literal></span></div>

            <div style="height:20px;">&nbsp;</div>
            <div style="text-align:center;width:100%;font-size:11px;color:#FFF;background-color:Gray;height:20px;line-height:20px;">CopyRight DePaul Steans Center</div>
    </form>
</body>
</html>
