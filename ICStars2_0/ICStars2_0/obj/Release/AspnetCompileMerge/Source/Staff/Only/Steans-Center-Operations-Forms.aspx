<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Steans-Center-Operations-Forms.aspx.cs" Inherits="ICStars2_0.Staff.Only.Steans_Center_Operations_Forms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Steans Center operations Forms</title>
    <script src="/Scripts/jquery-1.8.3.min.js"></script>
    <script src="/Scripts/JQueryUI2/ui/minified/jquery-ui.custom.min.js"></script>
    <link href="/Scripts/JQueryUI2/themes/smoothness/minified/jquery-ui.min.css" rel="stylesheet" />
    <style type="text/css">
        html{ margin: 0;padding: 0;}
        body{ margin: 0 auto;width: 960px;}
        h1{ width: 100%;text-align: center;background: #006AAD;color: white;
            box-shadow: 5px 5px 2px #888;padding-bottom: 5px;margin: 0;}
        
        header
        {
            margin-top: 20px;
            border-bottom: 2px solid #006AAD;
            width: 960px;
            text-align: center;
        }
        nav {
            margin-top: 20px;
            width: 960px;
        }
        nav ul>li{ border-bottom: solid 1px #ccc;}
        nav ul>li:last-child{ border: 0;}
       .ui-menu { width: 330px; }
       footer{text-align: center; width: 100%; font-size: 11px; color: #006AAD;border-top: solid 1px #006AAD;
        height: 20px; line-height: 20px;margin-top: 20px;}
    </style>
    <base target="_blank" />
    <script src="/Scripts/modernizr-2.5.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#menu").menu();
        });
    </script>
</head>
<body>
    <header>
        <h1>Steans Center operations Forms</h1>
    </header>
    
    <nav>
        <ul id="menu">
            <li><a href="#">Distribution Services
</a>
                    <ul>
                        <li>
                            <a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/DistributionServices.pdf")%>" title="Forms/Operations Forms/DistributionServices.pdf">Download</a>

                        </li>
                    </ul>
            </li>
            <li><a href="#">Driver Training Quiz
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Driver Training Quiz.pdf")%>" title="Forms/Operations Forms/Driver
        Training Quiz.pdf">Download</a></li>
                    </ul>
            </li>
            <li><a href="#">Driver Training
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Driver Training.ppt")%>" title="Forms/Operations Forms/Driver
                        Training.ppt">Download</a></li>
                    </ul>

            </li>
            <li><a href="#">Event Request Form
</a>
                <ul>
                    <li><a href="https://steans.depaul.edu/staff/EventRequest.aspx" title="Forms/Operations Forms/Event
                    Request Form">Go To</a></li>
                </ul>
                
            </li>
            <li><a href="#">Project Request Form
</a>
                <ul>
                    <li><a href="https://steans.depaul.edu/steans/projectrequest" title="Forms/Operations Forms/Project
                    Request Form">Go To</a></li>
                </ul>
                
            </li>
            <li><a href="#">Event Sign-In Sheet
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Event Sign-In Sheet.doc")%>" title="Forms/Operations Forms/Event
                    Sign-In Sheet.doc">Download</a></li>
                </ul>
                
            </li>
            <li><a href="#">General Reimbursement Form
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/General Reimbursement Form.pdf")%>" title="Forms/Operations
        Forms/General Reimbursement Form.pdf">Download</a></li>
                </ul></li>
            <li><a href="#">Honorarium Form Agreement
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Honorarium Form Agreement.doc")%>" title="Forms/Operations
        Forms/Honorarium Form Agreement.doc">Download</a></li>
                </ul></li>
            <li><a href="#">International Information Form
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/International Information Form.doc")%>" title="Forms/Operations
                          Forms/International Information Form.doc">Download</a></li>
                </ul>
            </li>
            <li><a href="#">Mileage Reimbursement Rate - January 1, 2012 - 55.5 cents
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Mileage Reimbursement Rate - January 1, 2012 - 55.5 cents.xls")%>" title="Forms/Operations Forms/Mileage Reimbursement Rate - January 1, 2012 - 55.5 cents.xls">Download</a></li>
                </ul></li>
            <li><a href="#">Non-Local Travel Waivers
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Non-Local Travel Waivers.doc")%>" title="Forms/Operations
        Forms/Non-Local Travel Waivers.doc">Download</a></li>
                </ul></li>
            <li><a href="#">Photo Release Form
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Photo Release Form.pdf")%>" title="Forms/Operations Forms/Photo
        Release Form.pdf">Download</a></li>
                </ul></li>
            <li><a href="#">ProfessionalServicesAgreement (protected)
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/ProfessionalServicesAgreement (protected).doc")%>" title="Forms/Operations
        Forms/ProfessionalServicesAgreement (protected).doc">Download</a></li>
                </ul></li>
            <li><a href="#">Student Employment Termination List
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Student Employment Termination List.xlsx")%>" title="Forms/Operations
        Forms/Student Employment Termination List.xlsx">Download</a></li>
                </ul></li>
            <li><a href="#">Travel Release & Waiver
</a>
                <ul>
                    <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Operations Forms/Travel Release & Waiver.pdf") %>" title="Forms/Operations
        Forms/Travel Release & Waiver.pdf">Download</a></li>
                </ul></li>

        </ul>
    </nav>
    <footer>
        CopyRight Depaul Steans Center
    </footer>
</body>
</html>
