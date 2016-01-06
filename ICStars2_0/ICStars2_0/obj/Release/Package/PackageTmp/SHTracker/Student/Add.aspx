<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_SheetLayout.Master"
    AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="ICStars2_0.SHTracker.Student.Add" %>

<%@ Import Namespace="ICStars2_0.BusinessLayer" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<%@ Import Namespace="ICStars2_0.Model.Enum" %>
<%@ Import Namespace="ICStars2_0.Model.Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="/SHTracker/Scripts/jquery.validate-1.10.0.min.js" type="text/javascript"></script>

    <style type="text/css">
        html, label, input, textarea
        {
            background-color: #029485;
        }
        textarea.textarea
        {
            background: #fff url(/SHTracker/Images/textbox_bg_029485.png) repeat 0 0;
        }
        
        form div.textarea
        {
            scrollbar-base-color: #029485;
        }
        select
        {
            background-color: #029485;
            scrollbar-base-color: #029485;
            scrollbar-arrow-color: #029485;
            border-color: #000;
            scrollbar-face-color: #029485;
            scrollbar-highlight-color: #029485;
            scrollbar-3dlight-color: #029485;
            scrollbar-darkshadow-color: #029485;
            scrollbar-shadow-color: #029485;
            scrollbar-track-color: #029485;
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
                .required{}
                .site_model{ width: 100%;}
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
                /*check unique constraint*/
                $.ajax({
                    type: "GET",
                    url: "<%=Config.SHTrackerRoot %>/Student/CheckCourseDPUID.ashx?cid=" + $("#CourseID").val() + "&dpuid=" + $("#<%=txtDPUID.ClientID %>").val(),
                    dataType: "script",
                    async: false,
                    success: function(data) {
                        if (data == "true") {
                            $('#<%=btnSubmit.ClientID %>').before("<span class='error'>the combination of Course and DPU ID exists! See more details, <a href=\"List.aspx?SearchType=3&SearchText="+$("#<%=txtDPUID.ClientID %>").val()+"\">Click Me</a>.</span><br />");
                            r = false;
                        }
                    }
                });
            } else {
                r = false;
            }
            if (r == true) return true;
            /*show each error warning box*/
            $("label.error,label.error2").each(function () {
                var target = $("#" + $(this).attr("for"));

                var targetOffset = target.offset();

                var tHeight = (target.outerHeight() + $(this).outerHeight()) / 2;
                var tWidth = target.outerWidth();
                $(this).css({ left: targetOffset.left + (tWidth < 120 ? tWidth : (tWidth / 2)), top: targetOffset.top + (tHeight > 30 ? tHeight / 2 : (target.outerHeight() - $(this).outerHeight())) });
                
            });
            /*Focus on the first error element*/
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
            var newid = "MoreSites" + totalCount;
            siteClone.find("select:eq(0)").attr("name", "MoreSites").attr("id", newid);
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
    <h2>
        Student Information Sheet</h2>
    <form id="form1" runat="server">
           <h3 style="text-align: right;">SLC : <%if(User.IsInRole("admin") || User.IsInRole("Staff") || User.IsInRole("SLC")){%>
            <%=DropDownListHelper.DropDownList("SLC",SLCList) %>
            <%}else{%>
            <%--<asp:Literal ID="ltlSLC" runat="server"></asp:Literal>--%>
            <%} %>
        </h3>
    <div class="site_model" id="default_site">
        <label>
            Service Site :
        </label>
        <span class="span_cbo"><%=DropDownListHelper.DropDownList("MoreSites",null, this.CBONameList,"class=\"\"")%></span><label>
            Quarter/Year :</label>
        <%=DropDownListHelper.DropDownList("MoreQuarters",null, UserData.QuarterYears==null? new[]
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
                                      }))%>
        <label>RequiredServeHours :</label>
        <input type="text" style="width:50px;" class="textbox_underline number" id="MoreRequiredHours" name="MoreRequiredHours" />
       
    </div>
        <div><input type="button" value="Add Site" onclick="addSite(this);"/></div>
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
            <asp:TextBox ID="txtLastname" runat="server" Width="250" CssClass="textbox required"></asp:TextBox><label>
                DPU ID #(Required) :</label><asp:TextBox ID="txtDPUID" runat="server" Width="200"
                    CssClass="textbox required number"></asp:TextBox></div>
        <div class="textbox">
            <label>
                First Name :
            </label>
            <asp:TextBox ID="txtFirstName" runat="server" Width="250" CssClass="textbox required"></asp:TextBox><label>
                Email :</label><asp:TextBox ID="txtEmail" runat="server" Width="350" CssClass="textbox required email"></asp:TextBox></div>
        <div class="textbox">
            <label>
                Primary Phone :
            </label>
            <asp:TextBox ID="txtPrimaryPhone" runat="server" Width="374" CssClass="textbox required"></asp:TextBox><label>
                Alternate Phone :</label><asp:TextBox ID="txtAlternatePhone" runat="server" Width="300" CssClass="textbox"></asp:TextBox></div>
        <div class="textbox">
            <label>
                Gender :
            </label>
            <input type="radio" name="Gender" value="Male" />
            M
            <input type="radio" name="Gender" value="Female" />
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
                State :</label><%=DropDownListHelper.DropDownList("State", null, typeof(StateType), false, new ICStars2_0.Model.Items.SelectListItem[]
                                  {
                                      new ICStars2_0.Model.Items.SelectListItem("Select State","",true)
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
            <%=DropDownListHelper.DropDownList("CourseID", null, this.CourseNameList, "class=\"required\"")%></div>
 <div class="textbox">
            <label>
                I'm a Community Service Studies :</label>
            <asp:TextBox ID="TextBox18" runat="server" Width="80" CssClass="textbox"></asp:TextBox><label>
                
            <input type="checkbox" name="CommunityServiceStudies" value="Minor" />Minor :</label><asp:TextBox ID="TextBox19" runat="server" Width="80"
                    CssClass="textbox"></asp:TextBox><label><input type="checkbox" name="CommunityServiceStudies" value="Scholar" />Scholar</label></div>
<div class="textbox">
            <label>
                I've taken a Service Learning course in the past (Check all that applies) :
            <input type="checkbox" name="ServiceLearningcourse" value="High school" />
            High school
            <input type="checkbox" name="ServiceLearningcourse" value="DePaul University" />
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
            <input type="radio" name="YesNo" value="True" />
            Yes
            <input type="radio" name="YesNo" value="False" />
            No
        </div>
        
            <div class="textbox">
            <label>
                Orientation :</label><asp:DropDownList ID="ddlOrientation" runat="server" CssClass="required">
                <asp:ListItem Value="" Selected="true">Select(yes/no)</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="Dropped">Dropped</asp:ListItem>
                </asp:DropDownList><label>
                &nbsp;&nbsp;Is This a Project ? </label><asp:DropDownList ID="ddlIsProject" runat="server" CssClass="required">
                <asp:ListItem Value="" Selected="true">Select(yes/no)</asp:ListItem>
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
