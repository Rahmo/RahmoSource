<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Steans-Center-Staff-Policy-Procedures-Manual.aspx.cs" Inherits="ICStars2_0.Staff.Only.Steans_Center_Staff_Policy_Procedures_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Steans Center Staff Policy Procedures Manual</title>
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
        /*nav ul{ margin: 0 auto;padding: 0;width: 100%;}*/
       .ui-menu { width: 450px; }
        /*nav ul > li {
            z-index: 100;
            width: 300px;
            text-align: left;
            overflow: hidden;
            white-space:nowrap; 
            text-overflow: ellipsis;
            float: none;
            padding: 5px 20px 5px 10px;
            color: white;
            background: #006aad;
            border: 1px solid #006AAD;
            border-radius: 25px;
            box-shadow: 10px 10px 5px #888;
            height: 30px;
            line-height: 30px;
            font-weight: bold;
            font-family: Arial;
        }
        nav ul li:hover {
            float: none;
            width: inherit;
            height: inherit;
            z-index: 999;
            background-color:green;
            color: white;
        }
        nav ul li ol {
            display: none;
        }
        nav ul li:hover ol {
            float: none;
            display: block;
            margin: 0;
            padding: 0;
        }
        nav ul li:hover ol li:first-child {
            border-top: solid 1px white;
        }
        nav ul li:hover ol li{
            float: none;
            position: static;
            margin: 0;
            display: block;
            width: 100%;
            padding: 5px;
            color:white;
            background-color:darkolivegreen;

            border: 0px;
            border-bottom: solid 1px white;
            border-radius: 0;
            box-shadow: none;
            transition: none;
        }
        nav ul li:hover ol li a {
            color: white;
        }
        nav ul li:hover ol li:hover {
            background-color:darkgreen;
        }*/
        footer{text-align: center; width: 100%; font-size: 11px; color: #006AAD;border-top: solid 1px #006AAD;
        height: 20px; line-height: 20px;margin-top: 20px;}
    </style>
    <base target="_blank"/>
    <script src="/Scripts/modernizr-2.5.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#menu").menu();
        });
    </script>
</head>
<body>
        <header><h1>Steans Center Staff Policy and Procedures Manual</h1></header>
        
        <nav>
            <ul id="menu">
                <li><a href="#">Invoices - Voucher Check Payments</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/13.) Invoices - Voucher Check Payments/Policy & Procedures - Invoice Payments.doc")%>" target="_blank" title="Invoices - Voucher Check Payments/Policy & Procedures - Invoice Payments.doc">Invoice Payments - Download</a></li>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/13.) Invoices - Voucher Check Payments/Policy & Procedures - Voucher Check Request.doc")%>" target="_blank" title="Invoices - Voucher Check Payments/Policy & Procedures - Voucher Check Request.doc">Voucher Check Request - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Attendance Log - Summer Hours Program</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/9.) Attendance Log - Summer Hours Program/Policy & Procedures - Attendance Tracking - Summer Hours Program.doc")%>" target="_blank" title="Attendance Log - Summer Hours Program/Policy & Procedures - Attendance Tracking - Summer Hours Program.doc">Summer Hours Program - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Terminations
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/14.) Terminations/Policy & Procedures - Termination Requests - Staff.doc")%>" title="Terminations/Policy & Procedures - Termination Requests - Staff.doc">Termination Requests - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Honorarium
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/12.) Honorarium/Policy & Procedures - Honorariums.doc")%>" title="Honorarium/Policy & Procedures - Honorariums.doc">Honorariums - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Room Reservations
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/1.) Room Reservations/Policy & Procedures - Room Reservations.doc")%>" title="Room Reservations/Policy & Procedures - Room Reservations.doc">Room Reservations - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Event Request Form
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/2.) Event Request Form/Policy & Procedures - Event Request Form.doc")%>" title="Event Request Form/Policy & Procedures - Event Request Form.doc">Event Request Form - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Steans Center Van
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/3.) Steans Center Van/Policy & Procedures - Steans Center Van.doc")%>" title="Steans Center Van/Policy & Procedures - Steans Center Van.doc">Steans Center Van - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Driver's Certification
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/4.) Driver's Certification/Policy & Procedures - Driver's Certification.docx")%>" title="Driver's Certification/Policy & Procedures - Driver's Certification.docx">Driver's Certification - Download</a></li>
                        
                    </ul>
                </li>
                <li><a href="#">Distribution Services
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/6.) Distribution Services/Policy & Procedures - Distribution Services.doc")%>" title="Distribution Services/Policy & Procedures - Distribution Services.doc">Distribution Services - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Project Request Form
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/7.) Project Request Form/Policy & Procedures - Project Request Form.doc")%>" title="Project Request Form/Policy & Procedures - Project Request Form.doc">Project Request Form - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Attendance Log
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/8.) Attendance Log/Policy & Procedures - Attendance Log - Floating Holiday, Sick, Vacation, Comp Time.doc")%>" title="Attendance Log/Policy & Procedures - Attendance Log - Floating Holiday, Sick, Vacation, Comp Time.doc">Floating Holiday, Sick, Vacation, Comp Time - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">General Reimbursements
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/11.) General Reimbursements/Policy & Procedures - General Reimbursements.doc")%>" title="General Reimbursements/Policy & Procedures - General Reimbursements.doc">General Reimbursements - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Incident Reports
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/16.) Incident Reports/Policy & Procedures - Incident Reports.doc")%>" title="Incident Reports/Policy & Procedures - Incident Reports.doc">Incident Reports - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Facility Operations - Work Order System
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/10.) Facility Operations - Work Order System/Policy & Procedures - Facility Operations - Work Order System.doc")%>" title="Facility Operations - Work Order System/Policy & Procedures - Facility Operations - Work Order System.doc">Work Order System - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Forms/Policy & Procedures Introductory Letter
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Policy & Procedures Introductory Letter.doc")%>" title="Forms/Policy & Procedures Introductory Letter.doc">Introductory Letter - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Technology Resources - Digital Camera - Projector - Webcam
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/5.) Technology Resources - Digital Camera - Projector - Webcam/Digital and Web Cameras/Policy & Procedures - Digital and Web Cameras.doc")%>" title="Technology Resources - Digital Camera - Projector - Webcam/Digital and Web Cameras/Policy & Procedures - Digital and Web Cameras.doc" target="_blank">Digital and Web Cameras - Download</a></li>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/5.) Technology Resources - Digital Camera - Projector - Webcam/Projector/Policy & Procedures - Projector.doc")%>" title="Technology Resources - Digital Camera - Projector - Webcam/Projector/Policy & Procedures - Projector.doc" target="_blank">Projector - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Forms/Policy & Procedures Table of Contents
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/Policy & Procedures Table of Contents.doc")%>" title="Forms/Policy & Procedures Table of Contents.doc">Table of Contents - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Fire Alarm Response
</a>
                    <ul>
                        <li><a href="#">Escape Maps
</a>
                            <ul>
                                <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/18.) Fire Alarm Response/Escape Maps/106.jpg")%>" target="_blank">106.jpg - Download</a></li>
                                <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/18.) Fire Alarm Response/Escape Maps/1st Floor.tif")%>" target="_blank">1st Floor.tif - Download</a></li>
                                <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/18.) Fire Alarm Response/Escape Maps/2nd Floor.tif")%>" target="_blank">2nd Floor.tif - Download</a></li>
                                <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/18.) Fire Alarm Response/Escape Maps/3rd Floor.tif")%>" target="_blank">3rd Floor.tif - Download</a></li>
                                <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/18.) Fire Alarm Response/Escape Maps/4th Floor.tif")%>" target="_blank">4th Floor.tif - Download</a></li>
                            </ul>
                        </li>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/18.) Fire Alarm Response/Fire Drill Instructions/Fire Drill.doc")%>" title="Fire Alarm Response/Fire Drill Instructions/Fire Drill.doc" target="_blank">Fire Drill Instructions - Download</a></li>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/18.) Fire Alarm Response/Policy & Procedures - Fire Alarm Response.doc")%>" title="Fire Alarm Response/Policy & Procedures - Fire Alarm Response.doc" target="_blank">Fire Alarm Response - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Gift to Employees
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/15.) Gift to Employees/Policy & Procedures - Gifts to Employees.doc")%>" title="Gift to Employees/Policy & Procedures - Gifts to Employees.doc">Gifts to Employees - Download</a></li>
                    </ul>
                </li>
                <li><a href="#">Departmental Deposits
</a>
                    <ul>
                        <li><a href="/Staff/accessform?p=<%=Server.UrlEncode("Forms/17.) Departmental Deposits/Policy & Procedures - Departmental Deposits.doc")%>" title="Departmental Deposits/Policy & Procedures - Departmental Deposits.doc">Departmental Deposits - Download</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <footer>
            CopyRight Depaul Steans Center
        </footer>
    </body>
</html>
