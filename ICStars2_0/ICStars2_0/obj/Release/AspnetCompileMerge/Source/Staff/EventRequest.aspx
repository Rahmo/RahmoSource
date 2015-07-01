<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventRequest.aspx.cs" Inherits="ICStars2_0.Staff.EventRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Request  --DePaul Steans Center</title>
    <script src="../SHTracker/Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../SHTracker/Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="../SHTracker/Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../SHTracker/Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <link href="../SHTracker/Content/Css/layout.css" rel="stylesheet" />
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
            padding-top: 20px;
        }
        html
        {
            text-align: center;
        }
        body
        {
            text-align: center;
            width: 960px;
            line-height: 26px;
            font-family: Arial;
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
            cursor: pointer;
            width: 90px;
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
        form div.textbox, form p.textbox
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
        form div.textarea,form p.textarea
        {
            margin-top: 10px;
            line-height: 26px;
            float: left;
            width: 100%;
        }
         label.error
            {
                z-index:9999px;
                position:absolute;
                color:Red;
                font-weight:bold;
                border:1px solid red;
                }
                .required{}
                .pl50{padding-left:50px;}
                .pl20{padding-left:20px;}
                #top_banner {
                    width: 100%;
                    position: relative;
                    height: 140px;
                }
                #top_banner #depaul_logo {
                    background:#fff url(/Images/depaul_logo.jpg) repeat 0 0;
                    width: 232px;
                    height: 31px;
                    display: block;
                }
                #top_banner #steans_logo {
                    background:#fff url(/Images/steans_logo.jpg) repeat 0 0;
                    width: 637px;
                    height: 78px;
                    display: block;
                }
                #top_banner #text_right {
                    position: absolute;
                    right: 0px;
                    top: 0px;
                    color: #3B8BCB;
                }
                #chartwells_logo {
                    background:#fff url(/Images/Chartwells_logo.jpg) repeat 0 0;
                    width: 123px;
                    height: 53px;
                    display: block;
                }
                #staples_logo{
                    background:#fff url(/Images/Staples_logo.jpg) repeat 0 0;
                    width: 123px;
                    height: 53px;
                    display: block;
                }
                a{color: blue;}
                table{ width: 850px;border: solid 1px #000;margin: 20px 0px 20px 50px;}
                table th,table td {
                    border: solid 1px #000;
                }
                table td input {
                    height: 26px;
                    border: 0px;
                }
                fieldset{ padding-bottom: 10px;}
                legend{ font-weight: bold;font-size: 18px;}
                #photographerOptions{ display: none;}
    </style>
    <script type="text/javascript">

        $(function () {

            $("#<%=txtEventDate.ClientID%>,#<%=txtCopiesNeededBy.ClientID%>").attr("readonly", "true").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $("form").validate({
                invalidHandler: function (form, validator) {
                    validator.invalidElements().first().focus();
                }
            });
            if ($("input[name='RequireAPhotographer']:checked").val() == "Yes") {
                $("#photographerOptions").slideDown();
            }
            $("input[name='RequireAPhotographer']").click(function () {
                if($(this).val()=="Yes") {
                    $("#photographerOptions").slideDown();
                    return;
                }
                $("#photographerOptions input").val("");
                $("#photographerOptions").hide();
                /*No*/
            });
        });
        
        function calculate(sender) {
            var t = 0.00;
            var $table = $(sender).parent().parent().parent();
            $table.find("tr.model").each(function () {
                var $qty = $(this).find("input[name='CateringServicesQty'],input[name='StaplesQty']");
                var $unitPrice = $(this).find("input[name='CateringServicesUnitPrice'],input[name='StaplesUnitPrice']");
                $unitPrice.val(($unitPrice.val()*1.00).toFixed(2));
                var $total = $(this).find("td:last");
                $total.text("$" + ($qty.val() * $unitPrice.val() * 1.00).toFixed(2));
                t += $total.html().replace(/\$/g, "") * 1.00;
            });
            $table.find("tr:last td:last").html("$" + (t * 1.00).toFixed(2));
        }
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
        function deleteItem(sender) {
            if ($(sender).parent().parent().siblings().length < 3) {
                $(sender).parent().parent().find("input[type='text']").val("");
                return;
            }
            $(sender).parent().parent().remove();
        }
        function addItem(sender) {
            var $model = $(sender).parentsUntil("table").find('tr.model:last');
            var $new = $model.clone();
            $new.find("input[type='text']").val("");
            $new.find("td:last").html("");
            $model.after($new);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="top_banner">
    <p id="depaul_logo">&nbsp;</p>
        <p id="steans_logo">&nbsp;</p>
        <p id="text_right">2233 N. Kenmore Ave<br/>
Chicago IL, 60614<br/>
<a href="http://steans.depaul.edu" target="_blank">steans.depaul.edu</a><br/>
T: 773-325-4142<br/>
F: 773-325-7459</p>
    </div>
                <h1>Event Request Form</h1><br/>
        <div class="grid-c3-w9c8e7">
            <div class="west">
                <p>Today's Date: <%=DateTime.Now.ToString("MMMM dd, yyyy") %></p>
                <p class="textbox"><label>
            <b>Contact Name :</b></label><asp:TextBox ID="txtContactName" runat="server" Width="200"
                CssClass="textbox required"></asp:TextBox></p>
                <p class="textbox"><label>
            <b>Supervisors Email :</b></label><asp:TextBox ID="txtSupervisorsEmail" runat="server" Width="200"
                CssClass="textbox required email"></asp:TextBox></p>
                <p class="textbox"><label>
            <b>Program :</b></label><asp:DropDownList ID="ddlProgram" runat="server">
        <asp:ListItem Value="">Select Program</asp:ListItem>
            <asp:ListItem Value="Administration">Administration</asp:ListItem>
            <asp:ListItem Value="CPI">CPI</asp:ListItem>
            <asp:ListItem Value="CSI">CSI</asp:ListItem>
            <asp:ListItem Value="CSS">CSS</asp:ListItem>
            <asp:ListItem Value="EUC">EUC</asp:ListItem>
            <asp:ListItem Value="Intercambio">Intercambio</asp:ListItem>
            <asp:ListItem Value="Jumpstart">Jumpstart</asp:ListItem>
            <asp:ListItem Value="M3C">M3C</asp:ListItem>
            <asp:ListItem Value="McCormick">McCormick</asp:ListItem>
            <asp:ListItem Value="Academic Service Learning">Academic Service Learning</asp:ListItem>
            <asp:ListItem Value="Service Learning Coordinators">Service Learning Coordinators</asp:ListItem>
            <asp:ListItem Value="Vista">Vista</asp:ListItem>
        </asp:DropDownList></p>
            </div>
            <div class="center">
                <div class="pl20">
                <p class="textbox"><label>
            <b>Event Date :</b></label><asp:TextBox ID="txtEventDate" runat="server" Width="200"
                CssClass="textbox required"></asp:TextBox></p>
                <p class="textbox"><label>
            <b>Event Time :</b></label><asp:TextBox ID="txtEventTime" runat="server" Width="180"
                CssClass="textbox required"></asp:TextBox></p>
                <p class="textbox"><label>
            <b>Event Title :</b></label><asp:TextBox ID="txtEventTitle" runat="server" Width="200"
                CssClass="textbox required"></asp:TextBox></p>
                <p class="textbox"><label>
            <b>Event Location :</b></label><asp:TextBox ID="txtEventLocation" runat="server" Width="150"
                CssClass="textbox required"></asp:TextBox></p></div>
            </div>
            <div class="east">
                <div class="pl20">
                    <p><a href="http://steans.depaul.edu/resources.asp" target="_blank">Steans Center resource reservations</a></p>
                    <p><a href="http://euc.depaul.edu/MeetingSpace/index.html" target="_blank">Egan Urban Center resource reservations</a></p>
                    <p class="textbox"><label><b>Number of Attendees :</b></label><asp:TextBox ID="txtNumberofAttendees" runat="server" Width="60"
                CssClass="textbox required digits"></asp:TextBox></p>
                </div>
            </div>
        </div>
        <fieldset style="text-align:center;"><legend>Catering Services</legend>
            <p id="chartwells_logo"></p>
            <p style="text-align:left;"><a href="http://depaulcatering.com/" target="_blank">www.depaulcatering.com</a></p>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th style="width:100px"></th>
                    <th style="width:400px">Item</th>
                    <th style="width:100px">Qty</th>
                    <th style="width:100px">Unit Price($)</th>
                    <th style="width:150px">Extended Price</th>
                </tr>
                <tr class="model">
                    <td><input type="button" value="Delete Item" class="button" onclick="deleteItem(this);"/></td>
                    <td><input type="text" name="CateringServicesItems" style="width:389px;text-align:left;padding: 0px 3px 0px 3px;"/></td>
                    <td><input type="text" name="CateringServicesQty" class="number" style="width:95px;text-align:right;" onblur="calculate(this);" /></td>
                    <td><input type="text" name="CateringServicesUnitPrice" style="width:145px;text-align:right;" class="number" onblur="calculate(this);"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="button" value="Add Item" class="button" onclick="addItem(this);"/></td>
                    <td colspan="2"></td>
                    <td><b>Subtotal : &nbsp;</b></td>
                    <td></td>
                </tr>
            </table>
            <p class="textarea" style="text-align:left;"><label>
            <b>Notes :</b></label><asp:TextBox ID="txtCateringServicesNotes" TextMode="MultiLine" runat="server" Width="950"
                CssClass="textarea"></asp:TextBox></p><br/><br/>
        </fieldset>
        <fieldset style="text-align:center;"><legend>Supplies</legend>
            <p id="staples_logo"></p>
            <p style="text-align:left;"><a href="http://www.staplesadvantage.com/" target="_blank">www.staplesadvantage.com</a></p>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th style="width:100px"></th>
                    <th style="width:100px">Item</th>
                    <th style="width:300px">Description</th>
                    <th style="width:100px">Qty</th>
                    <th style="width:100px">Unit Price($)</th>
                    <th style="width:150px">Extended Price</th>
                </tr>
                <tr class="model">
                    <td><input type="button" value="Delete Item" class="button" onclick="deleteItem(this);"/></td>
                    <td><input type="text" name="StaplesItems" style="width:89px;text-align:left;padding: 0px 3px 0px 3px;"/></td>
                    <td><input type="text" name="StaplesItemDescriptions" style="width:289px;text-align:left;padding: 0px 3px 0px 3px;"/></td>
                    <td><input type="text" name="StaplesQty" class="number" style="width:95px;text-align:right;" onblur="calculate(this);" /></td>
                    <td><input type="text" name="StaplesUnitPrice" style="width:145px;text-align:right;" class="number" onblur="calculate(this);"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="button" value="Add Item" class="button" onclick="addItem(this);"/></td>
                    <td colspan="3"></td>
                    <td><b>Subtotal : &nbsp;</b></td>
                    <td></td>
                </tr>
            </table>
            <p class="textarea" style="text-align:left;"><label>
            <b>Notes :</b></label><asp:TextBox ID="txtStaplesNotes" TextMode="MultiLine" runat="server" Width="950"
                CssClass="textarea"></asp:TextBox></p><br/><br/>
        </fieldset>
        
        <fieldset><legend>Distribution Services</legend>
            <p class="textbox">
                <label><b>Copies Needed By :</b></label><asp:TextBox ID="txtCopiesNeededBy" runat="server" Width="150"
                CssClass="textbox"></asp:TextBox>
             
                 <label><b>Color Copies :</b></label><asp:TextBox ID="txtColorCopies" runat="server" Width="150"
                CssClass="textbox digits"></asp:TextBox>
                <label><b>B & W Copies :</b></label><asp:TextBox ID="txtBWCopies" runat="server" Width="150"
                CssClass="textbox digits"></asp:TextBox>
                </p>
            <p>
                <input type="checkbox" name="cbxSided" value="One Sided"/>&nbsp;<b>One Sided</b>&nbsp;&nbsp;<input type="checkbox" name="cbxSided" value="Double Sided"/>&nbsp;<b>Double Sided</b>
                <span style="width:200px;display:inline-block;">&nbsp;</span><b>Paper Quality : </b><asp:DropDownList ID="ddlPaperQuality" runat="server">
        <asp:ListItem Value="">Select Quality</asp:ListItem>
            <asp:ListItem Value="Regular">Regular</asp:ListItem>
            <asp:ListItem Value="Hard Stock">Hard Stock</asp:ListItem>
            <asp:ListItem Value="Letter Head">Letter Head</asp:ListItem>
            <asp:ListItem Value="Gloss 8x11">Gloss 8x11</asp:ListItem>
        </asp:DropDownList>
            </p>
        </fieldset>
        <div style="text-align:center;width:100%;margin-bottom:20px;margin-top:20px;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnSubmit_Click" OnClientClick="return checkForm();" />
        </div>
    </form>
</body>
</html>
