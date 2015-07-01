<%@ Page Title="" Language="C#" MasterPageFile="~/SHTracker/_SheetLayout.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ICStars2_0.SHTracker.CSSP.Edit" %>
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
                .site_model{ width: 100%;}
                .required{}
    </style>
    
    <script type="text/javascript">
        $(function () {
            $("#<%=txtExpectedGraduationDate.ClientID %>").attr("readonly", "true").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $("form").validate({
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
            $("#default_site").find("input,select").change(function () {
                $(this).siblings("label.error2").remove();
            });
            $("input:radio[name=School][value=<%=CurrentStudent.School %>]").get(0).checked = true;
            $("input:radio[name=ClassStanding][value=<%=CurrentStudent.ClassStanding %>]").get(0).checked = true;
            //ClassStanding
        });
        function checkForm() {

            var r = true;
            var focusElement = null;
            $("label.error2").remove();
            var vArray = new Array();
            $("[name='MoreSites']").each(function () {
                for (var i = 0; i < vArray.length; i++) {
                    if (vArray[i].val() == $(this).val()
                    && vArray[i].parent().siblings("select[name='MoreQuarters']").val() == $(this).parent().siblings("select[name='MoreQuarters']").val()) {
                        
                        $(this).after('<label for="' + $(this).attr("id") + '" class="error2">Duplicated CBO and QuarterYear!</label>');
                        r = false;
                        if (focusElement == null) {
                            focusElement = $(this);
                        }
                    }
                }
                vArray.push($(this));
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
            if ($("form").valid()) {
                $.ajax({
                    type: "GET",
                    url: "<%=Config.SHTrackerRoot %>/Student/CheckCourseDPUID.ashx?sid=<%=CurrentStudent.ID %>&cid=" + $("#CourseID").val() + "&dpuid=" + $("#<%=txtDPUID.ClientID %>").val(),
                    dataType: "script",
                    async: false,
                    success: function (data) {
                        if (data == "true") {
                            $('#<%=btnSubmit.ClientID %>').before("<span class='error'>the combination of Course and DPU ID exists! Please Choose another DPU ID or Course.</span><br />");
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
            siteClone.removeAttr("id");
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
    <h2>
        Student Information Sheet</h2>
        <h3 style="text-align: right;">SLC : 
            <asp:Literal ID="ltlSLC" runat="server"></asp:Literal></h3>
    <form id="form1" runat="server">
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
            <%=DropDownListHelper.DropDownList(i>0?"MoreQuarters"+i:"MoreQuarters",student2Cbo.Quater_Year, new[]
                              {
                                  new ICStars2_0.Model.Items.SelectListItem
                                      {
                                          Text = "Select Quarter",
                                          Value = "",
                                          Selected=true
                                      }
                              }.Union(DropDownListHelper.BuildQuarterYearSelectListItems())," name=\"MoreQuarters\"")%>
        <label>RequiredServeHours :</label>
            <input type="text" style="width:50px;" class="textbox_underline number" id='MoreRequiredHours<%=i>0?i.ToString():"" %>' name="MoreRequiredHours" value="<%=student2Cbo.RequiredHours %>" />
             <%if(i>0)
                 {
                     %><input type="button" value="Remove" onclick="removeSite(this);"/><%
                 }%>
    </div>
        <%
            i++;
       } %>
    
        <div><input type="button" value="Add Site" onclick="addSite(this);"/></div>
    
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
                CampusConnect Email :</label><asp:TextBox ID="txtEmail" runat="server" Width="300" CssClass="textbox email"></asp:TextBox></div>
        <div class="textbox">
            <label>
                Primary Phone :
            </label>
            <asp:TextBox ID="txtPrimaryPhone" runat="server" Width="374" CssClass="textbox"></asp:TextBox>
             <label>
                Gender :
            </label>
            <input type="radio" name="Gender" value="Male" <%=CurrentStudent.Gender.Equals("Male")?"checked='checked'":"" %> />
            M
            <input type="radio" name="Gender" value="Female" <%=CurrentStudent.Gender.Equals("Female")?"checked='checked'":"" %> />
            F
            
        </div>
    
        <div class="textbox">
            <label>
                Current Address :
            </label>
            <asp:TextBox ID="txtPermanentAddress" runat="server" Width="345" CssClass="textbox"></asp:TextBox><label>
                City :</label><asp:TextBox ID="txtCity" runat="server" Width="70" CssClass="textbox"></asp:TextBox><label>
                State :</label><%=DropDownListHelper.DropDownList("State",CurrentStudent.State,typeof(StateType),false)%><label>
                Zip Code :</label><asp:TextBox ID="txtZipCode" runat="server" Width="70" CssClass="textbox"></asp:TextBox></div>
                 <div class="textbox">
            <label>
                Name of Emergency Contact :
            </label>
            <asp:TextBox ID="txtNameofEmergencyContact" runat="server" Width="400" CssClass="textbox"></asp:TextBox><label>
                Telephone Number :</label><asp:TextBox ID="txtTelephone" runat="server" Width="200" CssClass="textbox"></asp:TextBox></div>
                </fieldset>
<fieldset>
        <legend>COURSE INFORMATION</legend>
         
        
        
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
                Orientation :</label><asp:DropDownList ID="ddlOrientation" runat="server" CssClass="required">
                <asp:ListItem Value="No">No</asp:ListItem>
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="Dropped">Dropped</asp:ListItem>
                </asp:DropDownList>
        </div>
        


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