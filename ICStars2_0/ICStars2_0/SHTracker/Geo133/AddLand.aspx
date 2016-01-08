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
   <input type="text" style="width:200px;" class="textbox_underline number" id="BuildingAddress" name="BuildingAddress" />&nbsp;&nbsp;
    <label> 
        zip Code: 
    </label>

           <input type="text" style="width:100px;" class="textbox_underline number" id="ZipCode" name="ZipCode" />
    
    <label> 
        Block Number: 
    </label>

           <input type="text" style="width:100px;" class="textbox_underline number" id="BlockNumber" name="BlockNumber" />
    
         <label> 
        PERMANENT INDEX NUMBER (PIN) (14 digit): : 
    </label>

           <input type="text" style="width:100px;" class="textbox_underline number" id="PINNumber" name="PINNumber" />
    
        
         <label> 
       Zoning (e.g. RT-4):  
    </label>

           <input type="text" style="width:100px;" class="textbox_underline number" id="Zoning" name="Zoning" />
      <label> 
       FAR: 
    </label>

           <input type="text" style="width:100px;" class="textbox_underline number" id="FAR" name="FAR" />
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
               <td> <input type="text" style="width:100px;" class="textbox_underline number" id="FirstUse" name="FirstUse" /></td>
              <td><input type="text" style="width:100px;" class="textbox_underline number" id="FirstOccupancy" name="FirstOccupancy" /></td>
        </tr>
           <tr>
         <td>2nd </td>   
                <td> <input type="text" style="width:100px;" class="textbox_underline number" id="SecondUse" name="SecondUse" /></td>
              <td><input type="text" style="width:100px;" class="textbox_underline number" id="SecondOccupancy" name="SecondOccupancy" /></td>
        </tr>
           <tr>
         <td>3rd </td>   
                <td> <input type="text" style="width:100px;" class="textbox_underline number" id="ThirdUse" name="ThirdUse" /></td>
              <td><input type="text" style="width:100px;" class="textbox_underline number" id="ThirdOccupancy" name="ThirdOccupancy" /></td>
        </tr>
           <tr>
         <td>4th </td>   
                 <td> <input type="text" style="width:100px;" class="textbox_underline number" id="FourthUse" name="FourthUse" /></td>
              <td><input type="text" style="width:100px;" class="textbox_underline number" id="FourthOccupancy" name="FourthOccupancy" /></td>
        </tr>
           <tr>
         <td>back/rear </td>  
                 <td> <input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
              <td><input type="text" style="width:100px;" class="textbox_underline number" id="BackOccupancy" name="BackOccupancy" /></td>
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

                        <td style="border:0px"></td><td colspan="2">Assessed Value (newschicgao)</td><td colspan="2">Assessed Value (cookcounty)</td>
                      </tr>
                      <tr><td style="border:0px"></td><td>1999</td><td>2001</td><td>2014</td><td>2015</td></tr>
                      <tr><td>Land (L)</td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                      </tr>
                      <tr><td>Building (B)</td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                      </tr>
                      <tr><td>Total</td>
                              <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                      </tr>
                      <tr><td>Est. Mkt. Value</td><td>n/a</td><td>n/a</td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>
                          <td><input type="text" style="width:100px;" class="textbox_underline number" id=BackUse" name="BackUse" /></td>

                      </tr>
                      

                  </table>
                  
                  <div class="textbox">
        13. Year Built (from newschicago.org)   <input type="text" style="width:100px;" class="textbox_underline number" id="YearBuilt" name="YearBuilt" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
                      14. Census Tract:    <input type="text" style="width:100px;" class="textbox_underline number" id="CensusTract" name="CensusTract" /> </div>
                        <div class="textbox">
       15.  Property Class: <input type="text" style="width:100px;" class="textbox_underline number" id="PropertyClass" name="PropertyClass" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        16.  # Stories: <input type="text" style="width:100px;" class="textbox_underline number" id="Stories" name="Stories" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            17.  Building Sq. Footage: <input type="text" style="width:100px;" class="textbox_underline number" id="BuildingSq" name="BuildingSq" />
                        </div>
                  <div class="textbox">
18.  Land Sq. Footage: <input type="text" style="width:100px;" class="textbox_underline number" id="LandSq" name="LandSq" />
                  </div>
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
20. Age:  <input type="text" style="width:100px;" class="textbox_underline number" id="Age" name="Age" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      21.  Property Tax Exemptions (Assessor site): $<input type="text" style="width:100px;" class="textbox_underline number" id="TaxExemptions" name="TaxExemptions" />
                  </div> 
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
23. What is the 2014 property taxpayer’s name?   <input type="text" style="width:100px;" class="textbox_underline number" id="taxpayerName" name="taxpayerName" />
                      </div>
                    <div class="textbox">
24. What is the 2014 taxpayer’s mailing address?  <input type="text" style="width:100px;" class="textbox_underline number" id="taxpayerMailing" name="taxpayerMailing" />
                      </div>
                    <div class="textbox">
25. What is the 2014 property tax (add 1st and 2nd installments   <input type="text" style="width:100px;" class="textbox_underline number" id="YearPropertyTax" name="YearPropertyTax" />
                      </div>
                  
                   </fieldset>

    </form>
        </div>
</asp:Content>
