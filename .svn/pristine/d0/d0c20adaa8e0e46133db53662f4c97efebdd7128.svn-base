<%@ Page Title="Steans Center Register" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ICStars2_0.Account.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
          .kuang
        {
            margin-top: 20px;
            background-color: #f4f4f4;
            width: 772px;
            border: 1px solid #006AAD;
            padding: 5px;
        }
           .regist
        {
            height: 25px;
            width: 772px;
            background-color: #006AAD;
        }
    </style>
    <script type="text/javascript">
        function checkForm() {
            var r = true;
            if ($("form").valid() == false) return false;
            $.ajax({
                type: "GET",
                url: "/Account/CheckCampusConnect.ashx?ccid=" + $("#<%=txtCampusConnectID.ClientID%>").val() + "&ccp=" + $("#<%=txtPWD.ClientID %>").val(),
                
                async: false,
                success: function (data) {
                    if (data == "false") {
                        var $txtpwd = $('#<%=txtPWD.ClientID %>');
                        $txtpwd.after("<label class='error'>Failed to login Campus Connect! The Campus Connect ID or Password is not correct.</label>");
                        $('#<%=txtCampusConnectID.ClientID %>').focus();
                        r = false;
                    } else {
                        var $txtEmplId = $("#<%=txtEmplId.ClientID%>");
                        if ($txtEmplId.val() != data) {
                            $txtEmplId.after("<label class='error'>The EmplId you entered does not match the Campus Connect ID.</label>");
                            $txtEmplId.focus();
                            r = false;
                        }
                    }
                }
            });
            return r;
        }
        $(document).ready(function () {

            $("form").validate({
                rules: {
                    <%=txtCampusConnectID.ClientID.Replace('_','$') %>
                    : {
                        remote: { url: "/Account/CheckCampusConnectIDExists.ashx?qk=<%=txtCampusConnectID.ClientID.Replace('_','$') %>",
                    async: false
                }
            }
        },
                messages: {
                    <%=txtCampusConnectID.ClientID.Replace('_','$') %> : {
                    remote: $.format("{0} is already in use")
                }
            },
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
            
            $("#<%=txtOfficePhone.ClientID%>,#<%=txtFax.ClientID%>").keypress(function (event) {
                if (event.which == 8 || event.which == 46 || event.which == 0) return true;
                if (event.which < 48 || event.which > 57) {
                    return false;
                }
                var v = $(this).val().replace(/-/g, "");
                if (v[0] == "1" && v.length == 11) return false;
                if (v[0] != 1 && v.length == 10) return false;
                if (v == "1"
                    ||
                    (v[0] != "1" && v.length == 3)
                    ||
                    (v[0] == "1" && v.length == 4)
                    ||
                    (v[0] == "1" && v.length == 7)
                    ||
                    (v[0] != "1" && v.length == 6)
                ) {
                    $(this).val($(this).val() + '-');
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="regist" align="left">
                    <span class="white">Please Register</span></div>
                <div style="margin-left: 90px" class="fieldset">
                    <br>
                    CampusConnect ID：
                    <label>
                        <asp:TextBox ID="txtCampusConnectID" runat="server" CssClass="required" MaxLength="100"></asp:TextBox>
                    </label>
                    CampusConnect Password：
                    <label>
                        <asp:TextBox ID="txtPWD" TextMode="Password" CssClass="required" MaxLength="50" runat="server"></asp:TextBox>
                    </label>
                    Empl ID：
                    <label>
                        <asp:TextBox ID="txtEmplId" CssClass="required" runat="server" Width="150" MaxLength="50"></asp:TextBox>
                    </label>
                    First Name：
                    <label>
                        <asp:TextBox ID="txtFirstname" CssClass="required"  runat="server" MaxLength="50"></asp:TextBox>
                    </label>
                    Last Name：
                    <label>
                        <asp:TextBox ID="txtLastName" CssClass="required" runat="server" MaxLength="50"></asp:TextBox>
                    </label>
                    Email：
                    <label>
                        <asp:TextBox ID="txtEmail" CssClass="required email" runat="server" MaxLength="200"></asp:TextBox>
                    </label>
                    Department：
                    <label>
                        <asp:TextBox ID="txtDepartment" runat="server" Width="600" MaxLength="200"></asp:TextBox>
                    </label>
                    Location：
                    <label>
                        <asp:TextBox ID="txtLocation" runat="server" Width="600" MaxLength="200"></asp:TextBox>
                    </label>
                     Job Title：
                    <label>
                        <asp:TextBox ID="txtJobTitle" runat="server" MaxLength="200"></asp:TextBox>
                    </label>
                    Office Phone：
                    <label>
                        <asp:TextBox ID="txtOfficePhone" runat="server" MaxLength="50"></asp:TextBox>
                    </label>
                    Fax：
                    <label>
                        <asp:TextBox ID="txtFax" runat="server" MaxLength="50"></asp:TextBox>
                    </label>
                    Supervisor's First Name：
                    <label>
                        <asp:TextBox ID="txtSupervisorFirstName" MaxLength="50" runat="server"></asp:TextBox>
                    </label>
                    Supervisor's Last Name：
                    <label>
                        <asp:TextBox ID="txtSupervisorLastName" MaxLength="50" runat="server"></asp:TextBox>
                    </label>
                    Supervisor's Email：
                    <label>
                        <asp:TextBox ID="txtSupervisorEmail" CssClass="email" MaxLength="50" runat="server"></asp:TextBox>
                    </label>
                    <br/>
                    <br/>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnSubmit_Click"  OnClientClick="return checkForm();" />
                    <span class="red">
                        <asp:Literal ID="ltlError" runat="server"></asp:Literal></span></div>
</asp:Content>
