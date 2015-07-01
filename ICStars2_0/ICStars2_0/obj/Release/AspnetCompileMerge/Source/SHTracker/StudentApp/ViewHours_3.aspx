<%@ Page Title="Student Hours Reporting" Language="C#" MasterPageFile="~/SHTracker/StudentApp/StudentApp.Master" AutoEventWireup="true" CodeBehind="ViewHours_3.aspx.cs" Inherits="ICStars2_0.SHTracker.StudentApp.ViewHours_3" %>

<%@ Import Namespace="ICStars2_0.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <link href="../Content/Css/Student/Search.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .box {
            margin: 0 auto;
            margin-top: 20px;
            background-color: #f4f4f4;
            width: 835px;
            border: 1px solid #006AAD;
            padding: 5px;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        th {
            background-image: url(/SHTracker/images/barbg3.jpg);
            height: 28px;
            text-align: center;
            font-weight: bold;
            border: solid 1px #CCC;
        }

        fieldset table td {
            border: solid 1px #ccc;
            text-align: center;
        }

        input {
            border: 1px solid #999;
        }

        fieldset {
            padding: 10px;
            margin-top: 10px;
        }

        .fieldset label {
            display: inline-block;
        }

        .regist {
            width: 835px;
        }

        div.fieldset, div#for_print {
            margin-top: 10px;
            float: left;
            display: block;
        }

        table.print {
            float: left;
            width: 100%;
        }

            table.print td {
                border: 0;
            }

                table.print td.label {
                    width: 150px;
                    text-align: right;
                    padding: 0 5px;
                }
                table.print td.field {
                    border-bottom: solid 1px #000;
                }
                table.print tr.last td {
                    border-top: solid 1px #000;
                    
                }

        div.bot {
            width: 100%;
            display: block;
            float: left;
            margin-top: 20px;
        }

            div.bot input {
                margin-right: 10px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

    <div style="" class="fieldset">
        <div id="for_print">
            <%if (CurrentStudent != null)
              {
            %>
            <fieldset>
                <legend>View Hours
            <%=Request.QueryString["QuaterYear"]%></legend>
                <div>
                    <label>
                        DPU ID :</label>
                    <%=CurrentStudent.DPU_ID %><br />
                    <label>
                        Course Name :
                    </label>
                    <%=CurrentStudent.CourseSubject %>--<%=CurrentStudent.CourseCatalogNumber %>--<%=CurrentStudent.CourseInstructorName %><br />
                </div>
                <div>
                    <label>
                        Orientation :
                    </label>
                    <%=CurrentStudent.Orientation %><br />
                    <label>
                        SLC :
                    </label>
                    <%=CurrentStudent.SLC %>
                </div>
            </fieldset>
            <%
      } %>
            <%if (CurrentServiceHoursCollection != null)
              {
                  foreach (Student2CBO student2Cbo in CBOList)
                  {
            %>
            <fieldset>
                <legend>
                    <label>CBO: </label>
                    <%=student2Cbo.CBOName %>  --<%=student2Cbo.Quater_Year %></legend>
                <label>Service Hours Total/Required Hours : </label>
                <%=string.Format("{0:0.00}", student2Cbo.ServedTotalHours) %>/<%=string.Format("{0:0.00}",student2Cbo.RequiredHours) %><br />
                <table id="hours_list" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="float: left; margin: 10px 2% 10px 2%;">
                    <tr>
                        <th>Quarter Year</th>
                        <th>Date</th>
                        <th>Hours Served</th>
                        <th>Contact Type</th>
                        <th>Notes</th>
                    </tr>
                    <%
                foreach (ServiceHours serviceHours in CurrentServiceHoursCollection.Where(h => h.CBO_ID == student2Cbo.CBOID && h.Quater_Year.Equals(student2Cbo.Quater_Year)))
                {
                    %>
                    <tr>
                        <td><%=serviceHours.Quater_Year %></td>
                        <td><%= serviceHours.ServiceDate.ToString("MM/dd/yyyy") %></td>
                        <td><%= string.Format("{0:0.000}",serviceHours.HoursServed) %></td>
                        <td><%= serviceHours.ContactType %></td>
                        <td><%= serviceHours.ContactType.Equals("StudentApp")? serviceHours.Notes:"" %></td>
                    </tr>
                    <%
            }
                    %>
                </table>
            </fieldset>
            <%
            }
        } %>
            <fieldset>
                <legend>Student needs to fill out</legend>
                <table class="print">
                    <tr>
                        <td class="label">Name:</td>
                        <td class="field"></td>
                        <td class="label">Course:</td>
                        <td class="field"></td>
                    </tr>
                    <tr>
                        <td class="label">Quarter:</td>
                        <td class="field"></td>
                        <td class="label">Organization:</td>
                        <td class="field"></td>
                    </tr>
                    <tr>
                        <td class="label">Total hours served:</td>
                        <td class="field"></td>
                        <td class="label">Supervisor:</td>
                        <td class="field"></td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr class="last">
                        <td>Student's Signature</td>
                        <td>date</td>
                        <td>Supervisor's Signature</td>
                        <td>date</td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div class="bot">
            <input type="button" value="Print" onclick="$(this).parent().hide(); window.print(); $(this).parent().show();" /><a href="Default.aspx">Return</a></div>
    </div>
</asp:Content>
