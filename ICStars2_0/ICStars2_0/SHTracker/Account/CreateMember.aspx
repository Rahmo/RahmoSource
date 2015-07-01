<%@ Page Title="Create Member" Language="C#" MasterPageFile="~/SHTracker/_Layout.Master" AutoEventWireup="true" CodeBehind="CreateMember.aspx.cs" Inherits="ICStars2_0.Account.CreateMember" %>

<%@ Import Namespace="ICStars2_0.BusinessLayer" %>
<%@ Import Namespace="ICStars2_0.Components" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>

    <script src="../Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="/SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <link href="../Content/Css/Dialog-Warning.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function checkForm() {
            if ($("form").valid()) {
                submitCbo();
                submitCourse();
                return true;
            }
            return false;
        }
        $(document).ready(function() {
            $("form").validate({
                rules: {
                    <%=txtUserName.ClientID.Replace('_','$') %> : {
                    remote: { url: "<%=Config.SHTrackerRoot %>/Account/CheckAccountExists.ashx?qk=<%=txtUserName.ClientID.Replace('_','$') %>" }
                }
            },
        messages: {
            <%=txtUserName.ClientID.Replace('_','$') %> : {
                    remote: $.format("{0} is already in use")
                }
            },
        invalidHandler: function (form, validator) {
            validator.invalidElements().first().focus();
        }
    });
    /*CBO*/
    $("#btnAddCBO").click(function() {
        if(!checkCboIsSeleted()) {
            alert("Please Selete a Cbo First!");
            return false;
        }
        if(checkCboIsExist()) {
            alert("This cbo exists, please select another one!");
            return false;
        }
        $("#mycbo ul").append("<li><input type=\"checkbox\" name=\"CBOIDList\" value=\"" + $("#CBOID").val() + "\"/>" + $("#CBOID option:selected").text() + "</li>");
    });
    $("#btnDeleteCBO").click(function () {
        if($("#mycbo ul li input:checked").html()==null) {
            
            alert("No Cbo is checked!");
            return false;
        }
        var msg = $("#mycbo ul").clone();
        msg.find("input:not(:checked)").parent().remove();
        msg.find("input:checked").parent().find("input").remove();
        msg.prepend("<li><em>Are you sure to delete this cbo below?</em></li>");
        msg = msg.html();
        $("#dialog-confirm").html(msg);
        $("#dialog-confirm").dialog({
            resizable: false,
            width:400,
            height: 300,
            title: "Warning",
            dialogClass: "warning",
            modal: true,
            buttons: {
                "Delete": function () {
                    $("#mycbo ul li").each(function () {
                        if($(this).find("input:checked").html()!=null) {
                            $(this).remove();
                        }
                    });
                    $(this).dialog("close");
                },
                Cancel: function () {
                    $(this).dialog("close");
                }
            }
        });
        
    });
    $("#btnSubmitCbo").click(function() {
        submitCbo();
    });
    /*CBo end*/
    /*Course*/
    
    $("#btnAddCourse").click(function() {
        if(!checkCourseIsSeleted()) {
            alert("Please Selete a Course First!");
            return false;
        }
        if(checkCourseIsExist()) {
            alert("This course exists, please select another one!");
            return false;
        }
        $("#mycourse ul").append("<li><input type=\"checkbox\" name=\"CourseIDList\" value=\"" + $("#CourseID").val() + "\"/>" + $("#CourseID option:selected").text() + "</li>");
    });
    $("#btnDeleteCourse").click(function () {
        if($("#mycourse ul li input:checked").html()==null) {
            
            alert("No course is checked!");
            return false;
        }
        var msg = $("#mycourse ul").clone();
        msg.find("input:not(:checked)").parent().remove();
        msg.find("input:checked").parent().find("input").remove();
        msg.prepend("<li><em>Are you sure to delete this course below?</em></li>");
        msg = msg.html();
        $("#dialog-confirm").html(msg);
        $("#dialog-confirm").dialog({
            resizable: false,
            width:400,
            height: 300,
            title: "Warning",
            dialogClass: "warning",
            modal: true,
            buttons: {
                "Delete": function () {
                    $("#mycourse ul li").each(function () {
                        if($(this).find("input:checked").html()!=null) {
                            $(this).remove();
                        }
                    });
                    $(this).dialog("close");
                },
                Cancel: function () {
                    $(this).dialog("close");
                }
            }
        });
        
    });
    $("#btnSubmitCourse").click(function() {
        submitCourse();
    });
    /*Course end*/
});
    function submitCbo() {
        $("#mycbo ul li input[type='checkbox']").each(function () {
            $(this).get(0).checked = true;
        });
    }
    function submitCourse() {
        $("#mycourse ul li input[type='checkbox']").each(function () {
            $(this).get(0).checked = true;
        });
    }
    function checkCboIsExist()
    {
        return $("#mycbo ul li input[type='checkbox'][value='" + $("#CBOID").val() + "']").html() != null;
    }
    function checkCourseIsExist()
    {
        return $("#mycourse ul li input[type='checkbox'][value='" + $("#CourseID").val() + "']").html() != null;
    }
    function checkCboIsSeleted()
    {
        return $("#CBOID").val() != "";
    }
    function checkCourseIsSeleted()
    {
        return $("#CourseID").val() != "";
    }
    </script>
    <style type="text/css">
        fieldset {
            float: left;
        }

            fieldset#fleft {
                width: 350px;
            }

        div#mycbo, div#mycourse {
            border: solid 1px #ccc;
            height: 200px;
        }

            div#mycbo ul li input, div#mycourse ul li input {
                margin-right: 20px;
            }

            div#mycbo ul li em, div#mycourse ul li em {
                font-size: 16px;
                color: red;
                font-weight: bold;
            }

        fieldset#fright em, div#fright2 em {
            float: left;
        }

        #dialog-confirm {
            display: none;
        }

            #dialog-confirm em {
                color: red;
                font-size: 16px;
                font-weight: bold;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>CreateMember</h2>

    <fieldset id="fleft">
        <legend>Member</legend>
        <% if (User.IsInRole("admin_account_slc"))
           { %>
        <input type="hidden" value="SLC" name="roles" />
        <% }
           else
           { %>
        <div class="editor-label">
            <label>MemberType</label>
        </div>
        <div class="editor-field">
            <%=RolesCheckBoxHelper.MemberTypeCheckBoxList("roles",null)%>
        </div>
        <div class="warning">Note: the type of "Student" is only for <b>StudentApp</b>! The user in this role cannot login SHTracker!</div>
        <div class="editor-label">
            <label>Role</label>
        </div>
        <div>

            <%=RolesCheckBoxHelper.RolesCheckBoxList("roles",null)%>
        </div>
        <% } %>
        <div class="editor-label">
            <label>CampusConnectID</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtUserName" runat="server" ClientIDMode="AutoID" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>First name</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Last Name</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtLastName" runat="server" CssClass="required"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>DPU ID/EmplId</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtDPUID" runat="server"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Status</label>
        </div>
        <div class="editor-field">
            <asp:CheckBox ID="cbxStatus" runat="server" />
        </div>

        <div class="editor-label">
            <label>Email</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="email"></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Phone</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtPhone" runat="server" CssClass=""></asp:TextBox>
        </div>
        <div class="editor-label">
            <label>Office Hours</label>
        </div>
        <div class="editor-field">
            <asp:TextBox ID="txtOfficeHours" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" OnClientClick="return checkForm();" Text="Create" />
        </p>
    </fieldset>

    <fieldset id="fright">
        <legend>cbo</legend>

        <div class="editor-label">
            <label>CBO</label>
        </div>
        <div class="editor-field">
            <%=DropDownListHelper.DropDownList("CBOID",null, this.CBONameList)%><br />
            <input type="button" value="Add" id="btnAddCBO" />
        </div>
        <div class="editor-label">
            <label>My CBO</label>
        </div>
        <div id="mycbo" class="editor-field">
            <ul>
            </ul>
        </div>
        <em>
            <input type="button" value="Delete" id="btnDeleteCBO" />
            <input type="button" value="Select All" id="btnSubmitCbo" /></em>
    </fieldset>
    <fieldset id="fright2">
        <legend>Course</legend>

        <div class="editor-label">
            <label>Course</label>
        </div>
        <div class="editor-field">
            <%=DropDownListHelper.DropDownList("CourseID",null, this.CourseNameList)%><br />
            <input type="button" value="Add" id="btnAddCourse" />
        </div>
        <div class="editor-label">
            <label>My Course</label>
        </div>
        <div id="mycourse" class="editor-field">
            <ul>
            </ul>
        </div>
        <em>
            <input type="button" value="Delete" id="btnDeleteCourse" />
            <input type="button" value="Select All" id="btnSubmitCourse" /></em>
    </fieldset>
    <div id="dialog-confirm"></div>
</asp:Content>
