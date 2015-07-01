<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_SheetLayout.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="ICStars2_0.SHTracker.Student.Details" %>
<%@ Import Namespace="ICStars2_0.BusinessLayer" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>

    <style type="text/css">
        html, label, input, textarea
        {
        }
        body {
            width: 960px;
        }
        textarea.textarea
        {
            background: #fff url(/SHTracker/Images/textbox_bg.png) repeat 0 0;
        }
        
        span#span_cbo
        {
            width:400px;
            display: inline-block;
            }
            label.error,span.error
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
        $(function() {
            $("input,select,textarea").attr("readonly", "true");
            $("input:radio,input:checkbox").prop("disabled", "disabled");
            $("select").each(function () {
                var v = $(this).find("option:selected").text();
                $(this).replaceWith(v);
            });
        
            $("input:radio[name=School][value=<%=CurrentStudent.School %>]").get(0).checked = true;
            $("input:radio[name=ClassStanding][value=<%=CurrentStudent.ClassStanding %>]").get(0).checked = true;
            //ClassStanding
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>
        Student Information Sheet</h2>
        <h3 style="text-align: right;">SLC : 
            <asp:Literal ID="ltlSLC" runat="server"></asp:Literal></h3>
    <form id="form1" runat="server">
    
        <% foreach (Student2CBO student2Cbo in Student2CboCollection)
           {
  %>
        <div class="textbox">
        <label>
            Service Site :
        </label>
        <span id="span_cbo"><%=DropDownListHelper.DropDownList("CBOID",student2Cbo.CBOID,this.CBONameList, "class=\"required\"") %></span><label>
            Quarter/Year :</label><span style="width:100px;display:inline-block;"><%=student2Cbo.Quater_Year %></span><label>RequiredServeHours :</label><span style="width:100px;display:inline-block"><%=student2Cbo.RequiredHours %></span><label>(hours)</label>

        </div>
        <%
           } %>
    <div class="textarea">
        <label style="width: 100%">
            Available Time :</label>
        <asp:TextBox ID="txtAvailableTime" runat="server" TextMode="MultiLine" CssClass="textarea"></asp:TextBox></div>
    <fieldset>
        <legend>DEMOGRAPHIC INFORMATION</legend>
        <div class="textbox">
            <label>
                Last Name :
            </label>
            <asp:TextBox ID="txtLastname" runat="server" Width="400" CssClass="textbox"></asp:TextBox><label>
                DPU ID #(Required) :</label><asp:TextBox ID="txtDPUID" runat="server" Width="200"
                    CssClass="textbox required number"></asp:TextBox></div>
        <div class="textbox">
            <label>
                First Name :
            </label>
            <asp:TextBox ID="txtFirstName" runat="server" Width="400" CssClass="textbox"></asp:TextBox><label>
                Email :</label><asp:TextBox ID="txtEmail" runat="server" Width="300" CssClass="textbox email"></asp:TextBox></div>
        <div class="textbox">
            <label>
                Primary Phone :
            </label>
            <asp:TextBox ID="txtPrimaryPhone" runat="server" Width="374" CssClass="textbox"></asp:TextBox><label>
                Alternate Phone :</label><asp:TextBox ID="txtAlternatePhone" runat="server" Width="300" CssClass="textbox"></asp:TextBox></div>
        <div class="textbox">
            <label>
                Gender :
            </label>
            <input type="radio" name="Gender" value="Male" <%=CurrentStudent.Gender.Equals("Male")?"checked='checked'":"" %> />
            M
            <input type="radio" name="Gender" value="Female" <%=CurrentStudent.Gender.Equals("Female")?"checked='checked'":"" %> />
            F
            <asp:TextBox ID="TextBox9" runat="server" Width="365" CssClass="textbox"></asp:TextBox><label>
                Reach me by :</label><asp:DropDownList ID="ddlReachMethod" runat="server">
                    <asp:ListItem Value="Phone">Phone</asp:ListItem>
                    <asp:ListItem Value="Email">Email</asp:ListItem>
                </asp:DropDownList>
        </div>
        <div class="textbox">
            <label>
                Permanent Address :
            </label>
            <asp:TextBox ID="txtPermanentAddress" runat="server" Width="345" CssClass="textbox"></asp:TextBox><label>
                City :</label><asp:TextBox ID="txtCity" runat="server" Width="70" CssClass="textbox"></asp:TextBox><label>
                State :</label><%=DropDownListHelper.DropDownList("State",CurrentStudent.State,typeof(StateType),false)%><label>
                &nbsp;&nbsp;Zip Code :</label><asp:TextBox ID="txtZipCode" runat="server" Width="70" CssClass="textbox"></asp:TextBox></div>
                 <div class="textbox">
            <label>
                Name of Emergency Contact :
            </label>
            <asp:TextBox ID="txtNameofEmergencyContact" runat="server" Width="400" CssClass="textbox"></asp:TextBox><label>
                Telephone Number :</label><asp:TextBox ID="txtTelephone" runat="server" Width="200" CssClass="textbox"></asp:TextBox></div>
                </fieldset>
        <fieldset id="fs_programs">
            <legend>Programs</legend>
            <asp:CheckBoxList runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" RepeatColumns="5" ID="cbxPrograms"/>
        </fieldset>
<fieldset>
        <legend>COURSE INFORMATION</legend>
         <div class="textbox">
            <label>
                School or College :
            </label>
            <input type="radio" name="School" value="Commerce" />
            Commerce
            <input type="radio" name="School" value="Communication" />
            Communication
            <input type="radio" name="School" value="Computing and Digital Media" />
            Computing and Digital Media
            <input type="radio" name="School" value="Law" />
            Law
            <input type="radio" name="School" value="Education" />
            Education
        </div>
        <div class="textbox">
            <label style="padding-left: 130px;">
                &nbsp;</label>
            <input type="radio" name="School" value="LA&S" />
            LA&S
            <input type="radio" name="School" value="Music" />
            Music
            <input type="radio" name="School" value="Public Service" />
            Public Service</div>
        <div class="textbox">
            <label style="padding-left: 130px;">
                &nbsp;</label>
            <input type="radio" name="School" value="SNL" />
            SNL
            <input type="radio" name="School" value="Theatre" />
            Theatre</div>
            <div class="textbox">
            <label>
                Major :</label>
            <asp:TextBox ID="txtMajor" runat="server" Width="443" CssClass="textbox"></asp:TextBox><label>
                Expected Graduation Date :</label><asp:TextBox ID="txtExpectedGraduationDate" runat="server" Width="200"
                    CssClass="textbox"></asp:TextBox></div>
<div class="textbox">
            <label>
                Class Standing :
            </label>
            <input type="radio" name="ClassStanding" value="Freshman" />
            Freshman
            <input type="radio" name="ClassStanding" value="Sophomore" />
            Sophomore
            <input type="radio" name="ClassStanding" value="Junior" />
            Junior
            <input type="radio" name="ClassStanding" value="Senior" />
            Senior
            <input type="radio" name="ClassStanding" value="Grad" />
            Grad
            <input type="radio" name="ClassStanding" value="Law" />
            Law
        </div>
        
            <div class="textbox">
            <label>
                Course Name and Number and Class Section and Instructor Name :</label>
            <%=DropDownListHelper.DropDownList("CourseID",CurrentStudent.CourseID, this.CourseNameList, "class=\"required\"")%></div>
 <div class="textbox">
            <label>
                I'm a Community Service Studies :</label>
            <asp:TextBox ID="TextBox18" runat="server" Width="80" CssClass="textbox"></asp:TextBox><label>
                
            <input type="checkbox" name="CommunityServiceStudies" <%=CurrentStudent.CommunityServiceStudies.IndexOf("Minor")>-1?"checked='checked'":"" %> value="Minor" />Minor :</label><asp:TextBox ID="TextBox19" runat="server" Width="80"
                    CssClass="textbox"></asp:TextBox><label><input type="checkbox" name="CommunityServiceStudies" <%=CurrentStudent.CommunityServiceStudies.IndexOf("Scholar")>-1?"checked='checked'":"" %> value="Scholar" />Scholar</label></div>
<div class="textbox">
            <label>
                I've taken a Service Learning course in the past (Check all that applies) :
            <input type="checkbox" name="ServiceLearningcourse" <%=CurrentStudent.I_have_taken_Service_Learning_Course.IndexOf("High school")>-1?"checked='checked'":"" %> value="High school" />
            High school
            <input type="checkbox" name="ServiceLearningcourse" <%=CurrentStudent.I_have_taken_Service_Learning_Course.IndexOf("DePaul University")>-1?"checked='checked'":"" %> value="DePaul University" />
            DePaul University
            &nbsp;&nbsp;&nbsp;&nbsp;Other 
            </label>
            <asp:TextBox ID="txtOther" runat="server" Width="100"
                    CssClass="textbox"></asp:TextBox>
        </div>
        <div class="textbox">
            <label>
                I would like to add my email address to the Steans Center listserv for service learning opportunities and updates :
            </label>
            <input type="radio" name="YesNo" <%=CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv!=null && (bool)CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv?"checked='checked'":"" %> value="True" />
            Yes
            <input type="radio" name="YesNo" <%=CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv!=null && (bool)CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv?"":"checked='checked'" %> value="False" />
            No
        </div>
        
            <div class="textbox">
            <label>
                Orientation :</label><asp:DropDownList ID="ddlOrientation" runat="server" CssClass="required">
                <asp:ListItem Value="No">No</asp:ListItem>
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="Dropped">Dropped</asp:ListItem>
                </asp:DropDownList><label>&nbsp;&nbsp;
                Is This a Project ? </label><asp:DropDownList ID="ddlIsProject" runat="server" CssClass="required">
                <asp:ListItem Value="False">No</asp:ListItem>
                <asp:ListItem Value="True">Yes</asp:ListItem>
                </asp:DropDownList></div>


</fieldset>
    <div style="height: 20px;">
        &nbsp;</div>
    <div style="text-align: center; width: 100%; font-size: 11px; color: #FFF; background-color: Gray;
        height: 20px; line-height: 20px;">
        CopyRight Depaul Steans Center</div>
    </form>
    <div style="float:left;width:100%;text-align:left;">
    <input type="button" value="print" onclick="$(this).hide(); window.print(); $(this).show();"/></div>
</asp:Content>