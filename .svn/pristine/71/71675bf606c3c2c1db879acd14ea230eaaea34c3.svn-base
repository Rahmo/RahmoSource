<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_SheetLayout.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ICStars2_0.SHTracker.Student.Edit" %>
<%@ Import Namespace="ICStars2_0.BusinessLayer" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>
<%@ Import Namespace="ICStars2_0.Model.Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>

    <style type="text/css">
        html, label, input, textarea
        {
            background-color: #baede8;
        }
        textarea.textarea
        {
            background: #fff url(/SHTracker/Images/textbox_bg_029485.png) repeat 0 0;
        }
        
        form div.textarea
        {
            scrollbar-base-color: #baede8;
        }
        select
        {
            background-color: #baede8;
            scrollbar-base-color: #baede8;
            scrollbar-arrow-color: #baede8;
            border-color: #000;
            scrollbar-face-color: #baede8;
            scrollbar-highlight-color: #baede8;
            scrollbar-3dlight-color: #baede8;
            scrollbar-darkshadow-color: #baede8;
            scrollbar-shadow-color: #baede8;
            scrollbar-track-color: #baede8;
        }
       span.span_cbo select
        {
            width:400px;
            }
            label.error,span.error,label.error2
            {
                display:block;
                float:left;
                z-index:9999px;
                position:absolute;
                color:Red;
                font-weight:bold;
                border:1px solid red;
                }
                .site_model{ width: 100%;}
                .required{}
    </style>
    
    <script type="text/javascript">
        $(function () {
            /*Jquery ui, datepicker*/
            $("#<%=txtExpectedGraduationDate.ClientID %>").attr("readonly", "true").datepicker({
                changeMonth: true,
                changeYear: true
            });
            /*jquery.validate, to validate form*/
            $("form").validate({
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
            /*Once value changed, remove error warning box*/
            $("#default_site").find("input,select").change(function () {
                $(this).siblings("label.error2").remove();
            });
            /*Initicate values of School and ClassStanding*/
            $("input:radio[name=School][value=<%=CurrentStudent.School %>]").get(0).checked = true;
            $("input:radio[name=ClassStanding][value=<%=CurrentStudent.ClassStanding %>]").get(0).checked = true;
            
        });
        /*validate form values*/
        function checkForm() {

            var r = true;
            var focusElement = null;
            $("label.error2").remove();
            var vArray = new Array();
            $("[name='MoreSites']").each(function () {
                for (var i = 0; i < vArray.length; i++) {
                    if (vArray[i] == $(this).val()) {
                        $(this).after('<label for="' + $(this).attr("id") + '" class="error2">Duplicated CBO!</label>');
                        r = false;
                        if (focusElement == null) {
                            focusElement = $(this);
                        }
                    }
                }
                vArray.push($(this).val());
            });
            $("[name='MoreSites'],[name='MoreQuarters'],[name='MoreRequiredHours']").each(function () {
                if ($(this).val() == "") {
                    /*$(this).addClass("error");*/
                    $(this).after('<label for="' + $(this).attr("id") + '" class="error2">This field is required!</label>');
                    r = false;
                    if (focusElement == null) {
                        focusElement = $(this);
                    }
                }
            });
            if ($("#fs_programs input:checked").prop("name") == undefined) {
                $("#fs_programs").after('<label for="fs_programs" class="error2">At least select one program!</label>');
                r = false;
                if (focusElement == null) {
                    focusElement = $("#fs_programs");
                }
            }
            if ($("form").valid()) {
                $.ajax({
                    type: "GET",
                    url: "<%=Config.SHTrackerRoot %>/Student/CheckCourseDPUID.ashx?sid=<%=CurrentStudent.ID %>&cid=" + $("#CourseID").val() + "&dpuid=" + $("#<%=txtDPUID.ClientID %>").val(),
                    dataType: "script",
                    async: false,
                    success: function(data) {
                        if (data == "true") {
                            $('#<%=btnSubmit.ClientID %>').before("<span class='error'>the combination of Course and DPU ID exists! See more details, <a href=\"List.aspx?SearchType=3&SearchText=" + $("#<%=txtDPUID.ClientID %>").val() + "\">Click Me</a>.</span><br />");
                            r = false;
                        }
                    }
                });
            } else {
                r = false;
            }
            if (r == true) return true;
            $("label.error,label.error2").each(function () {
                var target = $("#" + $(this).attr("for"));

                var targetOffset = target.offset();

                var tHeight = (target.outerHeight() + $(this).outerHeight()) / 2;
                var tWidth = target.outerWidth();
                $(this).css({ left: targetOffset.left + (tWidth < 120 ? tWidth : (tWidth / 2)), top: targetOffset.top + (tHeight > 30 ? tHeight / 2 : (target.outerHeight() - $(this).outerHeight())) });

            });

            if (focusElement != null) {
                focusElement.focus();
            }
            return false;
        }

        function addSite(sender) {
            var siteClone = $('#default_site').clone();
            var totalCount = $("div.site_model").size();
            siteClone.find("input,select").val("");
            siteClone.find("input,select,div").removeAttr("id").removeAttr("name");
            siteClone.find("select:eq(0)").attr("name", "MoreSites").attr("id", "MoreSites" + totalCount);
            siteClone.find("select:eq(1)").attr("name", "MoreQuarters").attr("id", "MoreQuarters" + totalCount);
            siteClone.find("input").attr("name", "MoreRequiredHours").attr("id", "MoreRequiredHours" + totalCount);
            siteClone.append('<input type="button" value="Remove" onclick="removeSite(this);"/>');
            siteClone.find("input,select").change(function () {
                $(this).siblings("label.error2").remove();
            });
            $(sender).before(siteClone);

        }

        function removeSite(sender) {
            $(sender).parent().remove();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <form id="form1" runat="server">
    <h2>
        Student Information Sheet</h2>
        <h3 style="text-align: right;">SLC : <%if(User.IsInRole("admin") || User.IsInRole("Staff") || User.IsInRole("SLC")){%>
            <%=DropDownListHelper.DropDownList("SLC",CurrentStudent.SLC,SLCList) %>
            <%}else{%>
            <asp:Literal ID="ltlSLC" runat="server"></asp:Literal>
            <%} %>
        </h3>
    <% int i = 0;
        foreach (Student2CBO student2Cbo in CurrentStudent.Student2CBOList)
       {
  %>
        <div class="site_model" <%=i==0?"id=\"default_site\"":"" %>>
        <label>
            Service Site :
        </label>
        <span class="span_cbo"><%=DropDownListHelper.DropDownList(i>0?"MoreSites"+i: "MoreSites",student2Cbo.CBOID, this.CBONameList," name=\"MoreSites\"")%></span><label>
            Quarter/Year :</label>
            <%=DropDownListHelper.DropDownList(i>0?"MoreQuarters"+i:"MoreQuarters",student2Cbo.Quater_Year, UserData.QuarterYears==null? new[]
                              {
                                  new ICStars2_0.Model.Items.SelectListItem
                                      {
                                          Text = UserData.QuarterYear,
                                          Value = UserData.QuarterYear,
                                          Selected=true
                                      }
                              }:UserData.QuarterYears.Select(q=>new ICStars2_0.Model.Items.SelectListItem
                                      {
                                          Text = q,
                                          Value = q
                                      })," name=\"MoreQuarters\"")%>
        <label>RequiredServeHours :</label>
            <input type="text" style="width:50px;" class="textbox_underline number" id="MoreRequiredHours<%=i>0?i.ToString():"" %>" name="MoreRequiredHours" value="<%=student2Cbo.RequiredHours %>" />
             <%if(i>0)
                 {
                     %><input type="button" value="Remove" onclick="removeSite(this);"/><%
                 }%>
    </div>
        <%
            i++;
       } %>
    
        <div><input type="button" value="Add Site" onclick="addSite(this);"/></div>
    <div class="textarea">
        <label style="width: 100%">
            Available Time :</label>
        <asp:TextBox ID="txtAvailableTime" style="background-color:#baede8" runat="server" TextMode="MultiLine" CssClass="textarea"></asp:TextBox></div>
    <fieldset>
        <legend>DEMOGRAPHIC INFORMATION</legend>
        <div class="textbox">
            <label>
                Last Name :
            </label>
            <asp:TextBox ID="txtLastname" runat="server" Width="250" CssClass="textbox"></asp:TextBox><label>
                DPU ID #(Required) :</label><asp:TextBox ID="txtDPUID" runat="server" Width="200"
                    CssClass="textbox required number"></asp:TextBox></div>
        <div class="textbox">
            <label>
                First Name :
            </label>
            <asp:TextBox ID="txtFirstName" runat="server" Width="250" CssClass="textbox"></asp:TextBox><label>
                Email :</label><asp:TextBox ID="txtEmail" runat="server" Width="350" CssClass="textbox email"></asp:TextBox></div>
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
                State :</label><%=DropDownListHelper.DropDownList("State",CurrentStudent.State,typeof(StateType),false, new ICStars2_0.Model.Items.SelectListItem[]
                                  {
                                      new ICStars2_0.Model.Items.SelectListItem("Select State","",false)
                                  })%><label>
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
            <input type="radio" name="YesNo" <%=(CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv!=null && CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv == true)?"checked='checked'":"" %> value="True" />
            Yes
            <input type="radio" name="YesNo" <%=(CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv!=null && CurrentStudent.I_would_like_to_add_my_email_to_Steans_Center_listserv == true)?"checked='checked'":"" %> value="False" />
            No
        </div>
        
            <div class="textbox">
            <label>
                Orientation :</label><asp:DropDownList ID="ddlOrientation" runat="server" CssClass="required">
                <asp:ListItem Value="No">No</asp:ListItem>
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="Dropped">Dropped</asp:ListItem>
                </asp:DropDownList><label>
                &nbsp;&nbsp;Is This a Project ? </label><asp:DropDownList ID="ddlIsProject" runat="server" CssClass="required">
                <asp:ListItem Value="False">No</asp:ListItem>
                <asp:ListItem Value="True">Yes</asp:ListItem>
                </asp:DropDownList></div>


</fieldset>
    <div style="width: 100%; text-align: center; margin-top: 20px;">
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" OnClientClick="return checkForm();" CssClass="button" /><span
            style="color: Red; font-weight: bold;"><asp:Literal ID="ltlError" runat="server"></asp:Literal></span></div>
    <div style="height: 20px;">
        &nbsp;</div>
    <div style="text-align: center; width: 100%; font-size: 11px; color: #FFF; background-color: Gray;
        height: 20px; line-height: 20px;">
        CopyRight Depaul Steans Center</div>
    </form>
</asp:Content>