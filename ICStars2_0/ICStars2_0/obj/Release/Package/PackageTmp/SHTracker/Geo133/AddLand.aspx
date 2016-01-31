<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLand.aspx.cs" MasterPageFile="~/SHTracker/_SheetLayout.Master"
    Inherits="ICStars2_0.SHTracker.Geo133.AddLand" %>





<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
       <script src="/SHTracker/Scripts/jquery.validate-1.10.0.min.js" type="text/javascript"></script>

    <style type="text/css">
        html, label, input, textarea
        {
            background-color: #ffe175;
        }
        textarea.textarea
        {
            background: #fff url(/SHTracker/Images/textbox_bg_029485.png) repeat 0 0;
        }
        
        form div.textarea
        {
            scrollbar-base-color: #808080;
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
        .auto-style1 {
            width: 116px;
        }
        .auto-style2 {
            height: 30px;
        }
        .auto-style3 {
            height: 28px;
        }
        .auto-style4 {
            width: 116px;
            height: 28px;
        }
    </style>
    
   
   
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div id="content" style="width:1000px; margin:0 auto ">

    <h2>
        building Information Sheet</h2>
    <form id="form1" runat="server">
        </br> 

        <div style=" width: 900px ;margin-left:50px" ><%-- Change this for responsive design--%>
   <label> Building Address :   </label>
             
<asp:TextBox ID="txtBuildingAddress" runat="server" Width="250" CssClass="textbox required"></asp:TextBox>
    <label> 
        zip Code: 
    </label>
            <asp:TextBox ID="txtZipCode" runat="server" Width="250" CssClass="textbox_underline number"></asp:TextBox>
<%--           <input type="text" style="width:100px;" class="textbox_underline number" id="ZipCode" name="ZipCode" />--%>
    
    <label> 
        Block Number: 
    </label>
                        <asp:TextBox ID="txtBlockNumber" runat="server" Width="250" CssClass="textbox_underline number"></asp:TextBox>
           <%--<input type="text" style="width:100px;" class="textbox_underline number" id="BlockNumber" name="BlockNumber" />--%>
    
         <label> 
        PERMANENT INDEX NUMBER (PIN) (14 digit): : 
    </label>
  <asp:TextBox ID="txtPINNumber" runat="server" Width="250" CssClass="textbox_underline number"></asp:TextBox>
          
    
        
         <label> 
       Zoning (e.g. RT-4):  
    </label>
  <asp:TextBox ID="txtZoning" runat="server" Width="250" CssClass="textbox_underline number"></asp:TextBox>

          
      <label> 
       FAR: 
    </label>
  <asp:TextBox ID="txtFAR" runat="server" Width="250" CssClass="textbox_underline number"></asp:TextBox>

   <br/>
             <b>Zoning data and #42 information available from: https://gisapps.cityofchicago.org/zoning/ </b>
   <br/>
            <hr />
             </div>

          <div style=" width: 900px ;margin-left:50px" ><%-- Change this for responsive design--%>
   <label>Part 1. Site Visit Data.  Please circle your assessments.    </label> 
<fieldset>
        <legend>Visit Data</legend>

      <div class="textbox">
            <label>
              1.	Main Street-front Façade (facing the main street) </label>
            <input type="radio" name="StreetFront" value="Good" />
            Good
            <input type="radio" name="StreetFront" value="Fair" />
            Fair
           <input type="radio" name="StreetFront" value="Poor" />
            Poor
           <input type="radio" name="StreetFront" value="Vacant" />
            Vacant
      </div>
       <div class="textbox">
            <label>
             2.	Exterior (except the main façade): Walls/Doors/Windows </label>
            <input type="radio" name="Exterior" value="Good" />
            Good
            <input type="radio" name="Exterior" value="Fair" />
            Fair
           <input type="radio" name="Exterior" value="Poor" />
            Poor
           <input type="radio" name="Exterior" value="Vacant" />
            Vacant
      </div>
      
    <div class="textbox">
            3. Overall Viability<input type="radio" name="StreetFront" value="Good" />
            Good
            <input type="radio" name="Viability" value="Fair" />
            Fair
           <input type="radio" name="Viability" value="Poor" />
            Poor
           <input type="radio" name="Viability" value="Vacant" />
            Vacant
      </div>
    <div class="textbox">
        4.    Number (#) of Stories  :  <input type="text" style="width:100px;" class="textbox_underline number" id="NumOfStories" name="NumOfStories" />
      </div>
     <div class="textbox">
           5.   Façade Type:<input type="radio" name="StreetFront" value="A " />
            Brick 
            <input type="radio" name="FaçadeType" value="B" />
            Frame/Siding	
           <input type="radio" name="FaçadeType" value="C" />
            Grey stone
           <input type="radio" name="FaçadeType" value="D" />
            Mixed (e.g. Frame and Brick)
         <input type="radio" name="FaçadeType" value="E" />
            Other
         <input type="radio" name="FaçadeType" value="F" />
            Vacant
      </div>
      <div class="textbox">
            <label>
             6. Are there bare patches of exposed soil on the property?   </label>
            <input type="radio" name="patches" value="Yes" />
            Yes
            <input type="radio" name="patches" value="No" />
            No
      </div>
      <div class="textbox">
            <label>
             7. Is there any evidence of a garden or gardening activity on the 
    property?  
   </label>
            <input type="radio" name="evidenceActivity" value="Yes" />
            Yes
            <input type="radio" name="evidenceActivity" value="No" />
            No
      </div>

    <div class="textbox">
            <label>
            8. If there is evidence of a garden on the property, is it mainly: 
   </label>
            <input type="radio" name="evidence" value="A" />
            Raised beds
            <input type="radio" name="evidence" value="B " />
            In the ground 
            <input type="radio" name="evidence" value="C" />
            Plant pots
      </div>
      
        <div class="textbox">
            <label>
             9. Signs posted on building
   </label>
            <input type="radio" name="Signs" value="A" />
            Red and white sign indicating zoning change request 
            <input type="radio" name="Signs" value="B" />
            For sale sign
             <input type="radio" name="Signs" value="C" />
             For rent/lease sign
            <input type="radio" name="Signs" value="D" />
            None
      </div>
    <table border="1px" width="500px">
        <tr>
          <td></td>  <td>USe</td> <td>Occupancy</td>
        </tr>
           <tr>
          <td>1st </td> 
  <td><asp:TextBox ID="txtFirstUse" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
 <td> <asp:TextBox ID="txtFirstOccupancy" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
                
        </tr>
           <tr>
         <td>2nd </td>  
 <td> <asp:TextBox ID="txtSecondUse" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
 <td> <asp:TextBox ID="txtSecondOccupancy" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
                
        </tr>
           <tr>
         <td>3rd </td> 
 <td> <asp:TextBox ID="txtThirdUse" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>

<td>  <asp:TextBox ID="txtThirdOccupancy" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
                 

        </tr>
           <tr>
         <td>4th </td> 
 <td> <asp:TextBox ID="txtFourthUse" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>

 <td> <asp:TextBox ID="txtFourthOccupancy" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
                 
                
        </tr>
           <tr>
         <td>back/rear </td>  
      <td>  <asp:TextBox ID="txtBackUse" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>

 <td> <asp:TextBox ID="txtBackOccupancy" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
                 
          
        </tr>
    </table>

    <b>
    USE CODES:			
C- Commercial/Retail			
R-	Residential 			
I-	Industrial			
O-	Office				
VL - Vacant lot, no building
G - Garage
D-	Cannot Determine 

    </b>
    <br />
    <b>OCCUPANCY CODES:
        OF-Occupied floor
        VF- Vacant floor
        VL-Vacant lot, no building
        G- Garage
        D- Cannot determine

    </b>


    <div class="textbox">
            <label>
           11.  Structure classification:   
   </label>
            <input type="radio" name="Structure" value="A" />
            One residential unit- single-family dwelling
            <input type="radio" name="Structure" value="B " />
           2-4 residential units  
            <input type="radio" name="Structure" value="C" />
            5 or more residential units
         <input type="radio" name="Structure" value="D" />
            Mixed use.  
            <input type="radio" name="Structure" value="E " />
            Commercial only 
            <input type="radio" name="Structure" value="F" />
           Cannot determine
        <input type="radio" name="Structure" value="VL" />
            Vacant lot, no building
      </div>
    


    </fieldset>
              <fieldset>
                   <legend>Part 2.  On-Line Information </legend>
                  Some of this information can be found on multiple web-sites. For questions #12, #15-21, #42-43 go to www.cookcountyassessor.com; #12-14 go to ww.newschicago.org;  #22-27 - http://www.cookcountytreasurer.com (add ‘0000’ to the end of the PIN number to access this data); #28-33 go to: http://www.cookcountyclerk.com/tsd/tifs/Pages/tifpropertysearch.aspx#12694822780391&56; #34-37 go to http://chicagotribune.public-record.com/realestate/search/cook (search by date 1/01/2015 – 12/31-2015 and zip code); #38-40 go to http://chicago.blockshopper.com/, www.realestate.yahoo.com, http://www.urbanrealestate.com/ and http://www.trulia.com (search by zip code); #41 is visible on the map at: https://gisapps.cityofchicago.org/zoning/.  Some of this information is also available at: http://www.cookcountypropertyinfo.com/Pages/pin-search.aspx  and http://cookviewer1.cookcountyil.gov/jsviewer/index.html.
             
                  <table border="1px" width="600px">

                      <tr>

                        <td style="border:0px" class="auto-style2"></td><td colspan="2" class="auto-style2">Assessed Value (newschicgao)</td><td colspan="2" class="auto-style2">Assessed Value (cookcounty)</td>
                      </tr>
                      <tr><td style="border:0px"></td><td class="auto-style1">1999</td><td>2001</td><td>2014</td><td>2015</td></tr>
                      <tr><td class="auto-style3">Land (L)</td>
             <td class="auto-style4"> <asp:TextBox ID="txtOldestLand" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  <td class="auto-style4"> <asp:TextBox ID="txtOldLand" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
   <td class="auto-style4"><asp:TextBox ID="txtCurrentLand" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  <td class="auto-style4"> <asp:TextBox ID="txtNextLand" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  

                      </tr>
                      <tr><td>Building (B)</td>
     <td class="auto-style4"> <asp:TextBox ID="txtOldestBuilding" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  <td class="auto-style4"> <asp:TextBox ID="txtOldBuilding" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
   <td class="auto-style4"><asp:TextBox ID="txtCurrentBuilding" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  <td class="auto-style4"> <asp:TextBox ID="txtNextBuilding" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
                      </tr>
                      <tr><td>Total</td>
     <td class="auto-style4"> <asp:TextBox ID="txtTotalOldest" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  <td class="auto-style4"> <asp:TextBox ID="txtTotalOld" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
   <td class="auto-style4"><asp:TextBox ID="txtTotalCurrent" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  <td class="auto-style4"> <asp:TextBox ID="txtTotalNext" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
                      </tr>
                      <tr><td>Est. Mkt. Value</td><td class="auto-style1">n/a</td><td>n/a</td>
                         <td class="auto-style4"><asp:TextBox ID="txtEstCurrent" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>
  <td class="auto-style4"> <asp:TextBox ID="txtEstNext" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox></td>

                      </tr>
                      

                  </table>
                  
                  <div class="textbox">
        13. Year Built (from newschicago.org)   <asp:TextBox ID="txtYearBuilt" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
                      14. Census Tract:    <asp:TextBox ID="txtCensusTract" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                        <div class="textbox">
       15.  Property Class: <asp:TextBox ID="txtPropertyClass" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        16.  # Stories: <asp:TextBox ID="txtStories" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            17.  Building Sq. Footage: <asp:TextBox ID="txtBuildingSqaure" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                  <div class="textbox">
18.  Land Sq. Footage: <asp:TextBox ID="txtLandSq" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                  <div class="textbox">
            <label>
          19.  Property Description:    
   </label>
            <input type="radio" name="PropertyDescription" value="A" />
            Residential
            <input type="radio" name="PropertyDescription" value="B " />
          Industrial
            <input type="radio" name="PropertyDescription" value="C" />
           Commercial
         <input type="radio" name="PropertyDescription" value="D" />
            Vacant 
            <input type="radio" name="PropertyDescription" value="E " />
            Exempt 
            <input type="radio" name="PropertyDescription" value="F" />
           Mixed Use
        <input type="radio" name="PropertyDescription" value="G" />
            Other
      </div>
             
                  <div class="textbox">
20. Age:  <asp:TextBox ID="txtAge" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      21.  Property Tax Exemptions (Assessor site): $<asp:TextBox ID="txtPropertyTaxEx" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div> 
                   <div class="textbox">
            <label>
         In the year the Property Tax Exemption was:     
   </label>
            <input type="radio" name="PropertyTax" value="E" />
            (Exemption given) 
            <input type="radio" name="PropertyTax" value="NE " />
          Not Entitled
            <input type="radio" name="PropertyTax" value="NF" />
           None filed/applied
        
         
      </div>    
                  <div class="textbox">
                      <label>22. the year Property Tax Exemptions from Treasurer Site:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Homeowner
                      </label>
                     
            <input type="radio" name="Homeowner" value="Yes" />
            Yes
            <input type="radio" name="Homeowner" value="No" />
            No
                     <label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Senior Citizen:  
   </label>
            <input type="radio" name="SeniorCitizen" value="Yes" />
            Yes
            <input type="radio" name="SeniorCitizen" value="No" />
            No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             
                      <label>  Senior Freeze</label> 
  
            <input type="radio" name="SeniorFreeze" value="Yes" />
            Yes
            <input type="radio" name="SeniorFreeze" value="No" />
            No
     </div>
                  
                  <div class="textbox">
23. What is the 2014 property taxpayer’s name?   <asp:TextBox ID="txtPropTaxpayerName" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                    <div class="textbox">
24. What is the 2014 taxpayer’s mailing address?  <asp:TextBox ID="txtTaxpayerMailing" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                    <div class="textbox">
25. What is the 2014 property tax (add 1st and 2nd installments   <asp:TextBox ID="txtPropertytaxOldest" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                    <div class="textbox">
26. What amount of 2014 taxes are still owed (balance due)?    <asp:TextBox ID="txtTaxDue" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>

                  <div class="textbox">
                      <label>27. Is the 2015 property taxpayer’s name and address the same as 2014?  
                      </label>
                     
            <input type="radio" name="TaxPayerCurrent" value="Yes" />
            Yes
            <input type="radio" name="TaxPayerCurrent" value="No" />
            No
                    
                         </div> 
                  <div class="textbox">
What is the 2015 taxpayer’s name  <asp:TextBox ID="txtNextTaxpayerName" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             Address       <asp:TextBox ID="txtTaxpayerAddressN" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                   </label>

                  <b>Tax Increment Financing (TIF)</b>
                  
                   <div class="textbox">
                      <label> 28. Was this property in a TIF district in 2014? 
                      </label>
                     
            <input type="radio" name="InTIFdistrict" value="Yes" />
            Yes
            <input type="radio" name="InTIFdistrict" value="No" />
            No
                If NO then enter N/A for #29-33 If YES then note the exact percentage of the property taxes that go into:
                       

                         </div> 
                  
                    <div class="textbox">
                        29. TIF-City of Chicago Pilsen Area:    <asp:TextBox ID="txtPilsenArea" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;%
                      </div>
                    <div class="textbox">
30. Board of Education:    <asp:TextBox ID="txtBoardofEducation" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>%
                      </div>
                    <div class="textbox">
31. City of Chicago School Building and Improvement:   <asp:TextBox ID="txtBuildingAndImporovments" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>%
                      </div>
                    <div class="textbox">
32. City of Chicago Park District:   <asp:TextBox ID="txtParkDistrict" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>%
                      </div>
                    <div class="textbox">
33. City of Chicago Library Fund:   <asp:TextBox ID="txtLibraryFund" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>%
                      </div>
                  
                  <div
                     class="textbox">
                   <b>  Sales  </b> 

                  </div>
                 
                      <div class="textbox">
                      <label> 34.  Was the property sold in 2015?  
                      </label>
                     
            <input type="radio" name="propertySold" value="Yes" />
            Yes
            <input type="radio" name="propertySold" value="No" />
            No
If NO then enter N/A for #29-33
If YES then note the exact percentage of the property taxes that go into:

                  </div>
                  
  <div class="textbox">If YES then:
35.  What was the sale date of the property?    <asp:TextBox ID="txtSaledDate" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                    <div class="textbox">
36.  What was the sale price of the property?   <asp:TextBox ID="txtSalePrice" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                    <div class="textbox">
37. If it was a condominium unit, what was the unit number?    <asp:TextBox ID="txtUnitNumber" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>


                  <div class="textbox">
                      <label> 38. Is property currently for sale?  
                      </label>
                     
            <input type="radio" name="currentlyForSale" value="Yes" />
            Yes
            <input type="radio" name="currentlyForSale" value="No" />
            No
                      

                      </div>
                                <div class="textbox">
                                    39. What is the listed price&nbsp; ?<asp:TextBox ID="txtListedPrice" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                                <div class="textbox">
                                    40. How many bedrooms ?    <asp:TextBox ID="txtBedrooms" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                  <div class="textbox">
                      <label> 41. Is the building rated as Orange:  
                      </label>
                     
            <input type="radio" name="ratedOrange" value="Yes" />
            Yes
            <input type="radio" name="ratedOrange" value="No" />
            No
                      

                      </div>
                    <div class="textbox">
                      <label>42. Assessor’s Office photo downloaded  
                      </label>
                     
            <input type="radio" name="OfficePhotoDownloaded" value="Yes" />
            Yes
            <input type="radio" name="OfficePhotoDownloaded" value="No" />
            No
                         <input type="radio" name="OfficePhotoDownloaded" value="NA" />
            N/A
                      

                      </div>
                                <div class="textbox">
43. Assessor’s Office photo date     <asp:TextBox ID="txtPhotoDate" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>
                    <div class="textbox">
                        44. Next Year photo taken
                     
            <input type="radio" name="NextyPhotoTaken" value="Yes" />
            Yes
            <input type="radio" name="NextyPhotoTaken" value="No" />
            No
                      

                      </div>
                   <div class="textbox">
45. Your Photo Date           <asp:TextBox ID="txtUserPhotoDate" runat="server" Width="100px" CssClass="textbox_underline number"></asp:TextBox>&nbsp;</div>

                   </fieldset>
              <div class="textbox">
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit"  CssClass="button" />
              </div>
    </form>
        </div>
</asp:Content>
