<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDetails.aspx.cs" Inherits="ICStars2_0.SHTracker.Steans.EventRequest.FormDetails" %>
<%@ Import Namespace="ICStars2_0.Common" %>
<%@ Import Namespace="ICStars2_0.SHTracker.Steans.EventRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%=CurrentEventRequestForm.ContactName %>  <%=CurrentEventRequestForm.EventTitle %>--Event Request</title>
    <script src="../../Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/JqueryUI/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
    <link href="../../Scripts/JqueryUI/themes/smoothness/jquery-ui-1.8.17.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery.validate-1.9.0.min.js" type="text/javascript"></script>
    <link href="../../Content/Css/layout.css" rel="stylesheet" />
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
        p.textarea
        {
            border: 0px;
            width: 100%;
            min-height: 104px;
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
        form div.textarea
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
            
            calculate($("table tr.model input[name='StaplesQty']").get(0));
            calculate($("table tr.model input[name='CateringServicesQty']").get(0));
            if ($("input[name='RequireAPhotographer']:checked").val() == "Yes") {
                $("#photographerOptions").slideDown();
            }
        });

        function calculate(sender) {
            var t = 0.00;
            var $table = $(sender).parent().parent().parent();
            $table.find("tr.model").each(function () {
                var $qty = $(this).find("input[name='CateringServicesQty'],input[name='StaplesQty']");
                var $unitPrice = $(this).find("input[name='CateringServicesUnitPrice'],input[name='StaplesUnitPrice']");
                $unitPrice.val(($unitPrice.val() * 1.00).toFixed(2));
                var $total = $(this).find("td:last");
                $total.text("$" + ($qty.val() * $unitPrice.val() * 1.00).toFixed(2));
                t += $total.html().replace(/\$/g, "") * 1.00;
            });
            $table.find("tr:last td:last").html("$" + (t * 1.00).toFixed(2));
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
    <p id="depaul_logo"><img src="/Images/depaul_logo.jpg" width="232" height="31" />&nbsp;</p>
        <p id="steans_logo"><img src="/Images/steans_logo.jpg" width="637" height="78" />&nbsp;</p>
        <p id="text_right">2233 N. Kenmore Ave<br/>
Chicago IL, 60614<br/>
<a href="http://steans.depaul.edu" target="_blank">steans.depaul.edu</a><br/>
T: 773-325-4142<br/>
F: 773-325-7459</p>
    </div>
                <h1>Event Request Form</h1><br/>
        <div class="grid-c3-w9c8e7">
            <div class="west">
                <p>Today's Date: <%=CurrentEventRequestForm.RequestDate.ToString("MMMM dd, yyyy") %></p>
                <p class="textbox"><label>
            <b>Contact Name :</b></label><%=CurrentEventRequestForm.ContactName %></p>
                <p class="textbox"><label>
            <b>Supervisors Email :</b></label><%=CurrentEventRequestForm.SupervisorEmail %></p>
                <p class="textbox"><label>
            <b>Program :</b></label><%=CurrentEventRequestForm.Program %></p>
            </div>
            <div class="center">
                <div class="pl20">
                <p class="textbox"><label>
            <b>Event Date :</b></label><%=CurrentEventRequestForm.EventDate.ToString("MM/dd/yyyy") %></p>
                <p class="textbox"><label>
            <b>Event Time :</b></label><%=CurrentEventRequestForm.EventTime %></p>
                <p class="textbox"><label>
            <b>Event Title :</b></label><%=CurrentEventRequestForm.EventTitle %></p>
                    <p class="textbox" style="margin-top:0px;padding-top:0px;"></p>
                <p class="textbox"><label>
            <b>Event Location :</b></label><%=CurrentEventRequestForm.EventLocation %></p>
                    <p class="textbox" style="margin-top:0px;padding-top:0px;"></p>

                </div>
            </div>
            <div class="east">
                <div class="pl20">
                    <p><a href="http://steans.depaul.edu/resources.asp" target="_blank">Steans Center resource reservations</a></p>
                    <p><a href="http://euc.depaul.edu/MeetingSpace/index.html" target="_blank">Egan Urban Center resource reservations</a></p>
                    <p class="textbox"><label><b>Number of Attendees :</b></label><%=CurrentEventRequestForm.NumberOfAttendees %></p>
                </div>
            </div>
        </div>
        <fieldset style="text-align:center;"><legend>Catering Services</legend>
            <p id="chartwells_logo"><img src="/Images/Chartwells_logo.jpg" width="123" height="53"/></p>
            <p style="text-align:left;"><a href="http://depaulcatering.com/" target="_blank">www.depaulcatering.com</a></p>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th style="width:400px">Item</th>
                    <th style="width:100px">Qty</th>
                    <th style="width:100px">Unit Price($)</th>
                    <th style="width:150px">Extended Price</th>
                </tr>
                <% foreach (ChartwellItem item in ChartwellItems)
                   {
  %>
                <tr class="model">
                    <td><input type="text" name="CateringServicesItems" style="width:395px;text-align:right;" value="<%=item.Item %>"/></td>
                    <td><input type="text" name="CateringServicesQty" class="number" style="width:95px;text-align:right;" value="<%=item.Qty %>" /></td>
                    <td><input type="text" name="CateringServicesUnitPrice" style="width:145px;text-align:right;" class="number" value="<%=item.UnitPrice %>"/></td>
                    <td></td>
                </tr>
                <%
                   } %>
                <tr>
                    <td colspan="2"></td>
                    <td><b>Subtotal : &nbsp;</b></td>
                    <td></td>
                </tr>
            </table>
            <div class="textarea" style="text-align:left;"><label>
            <b>Notes :</b></label><p class="textarea"><%=ICStars2_0.Common.HtmlHelper.TxtToHtml(CurrentEventRequestForm.ChartwellsNotes) %></p></div><br/><br/>
        </fieldset>
        <fieldset style="text-align:center;"><legend>Supplies</legend>
            <p id="staples_logo"><img src="/Images/Staples_logo.jpg" width="123" height="53"/></p>
            <p style="text-align:left;"><a href="http://www.staples.com" target="_blank">www.staples.com</a></p>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th style="width:100px">Item</th>
                    <th style="width:300px">Description</th>
                    <th style="width:100px">Qty</th>
                    <th style="width:100px">Unit Price($)</th>
                    <th style="width:150px">Extended Price</th>
                </tr>
                <% foreach (StaplesItem item in StaplesItems)
                   {
  %>
                <tr class="model">
                    <td><input type="text" name="StaplesItems" style="width:95px;text-align:right;" value="<%=item.Item %>"/></td>
                    <td><input type="text" name="StaplesItemDescriptions" style="width:295px;text-align:right;" value="<%=item.Description %>"/></td>
                    <td><input type="text" name="StaplesQty" class="number" style="width:95px;text-align:right;" value="<%=item.Qty %>"/></td>
                    <td><input type="text" name="StaplesUnitPrice" style="width:145px;text-align:right;" class="number" value="<%=item.UnitPrice %>" /></td>
                    <td></td>
                </tr>
                <%
                   } %>
                
                <tr>
                    <td colspan="3"></td>
                    <td><b>Subtotal : &nbsp;</b></td>
                    <td></td>
                </tr>
            </table>
            <div class="textarea" style="text-align:left;"><label>
            <b>Notes :</b></label><p class="textarea"><%=CurrentEventRequestForm.StaplesNotes %></p></div><br/><br/>
        </fieldset>
        
        <fieldset><legend>Distribution Services</legend>
            <p class="textbox">
                <label><b>Copies Needed By :</b></label><%=CurrentEventRequestForm.DistributionServicesCopiesNeededBy==DateTime.MinValue?"&nbsp;&nbsp;&nbsp;&nbsp;": CurrentEventRequestForm.DistributionServicesCopiesNeededBy.ToString("MM/dd/yyyy") %>
             
                 <label><b>Color Copies :</b></label><%=CurrentEventRequestForm.DistributionServicesColorCopies %>
                <label><b>B & W Copies :</b></label><%=CurrentEventRequestForm.DistributionServicesBWCopies %>
                </p>
            <p>
                <input type="checkbox" name="cbxSided" value="One Sided" <%=CurrentEventRequestForm.DistributionServicesPaperSidedType.Contains("One Sided")?"checked=\"checked\"":"" %>/>&nbsp;<b>One Sided</b>&nbsp;&nbsp;<input type="checkbox" name="cbxSided" value="Double Sided" <%=CurrentEventRequestForm.DistributionServicesPaperSidedType.Contains("Double Sided")?"checked=\"checked\"":"" %>/>&nbsp;<b>Double Sided</b>
                <span style="width:200px;display:inline-block;">&nbsp;</span><b>Paper Quality : </b><%=CurrentEventRequestForm.DistributionServicesPaperQuality %>
            </p>
        </fieldset>
   
    </form>
    
    <div style="float:left;width:100%;text-align:left;">
    <input type="button" value="print" onclick="$(this).hide(); window.print(); $(this).show();"/></div>
</body>
</html>
