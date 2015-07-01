with newcbo
as
(
select 'Mujeres Latinas en Accion' as Name,'2124 W 21st Pl, Chicago, IL 60608 ' as [address],'Martiza' as FirstName,'Rocha' As LastName,'773-890-7676' AS Phone,'mrocha@mujereslat.org' AS Email union all
select 'Chicago Grassroots Curriculum Taskforce and Chicago Youth Initiating Change','4554 N. Broadway Chicago, Illinois 60640','Anton','Miglietta','773-387-1844','antonmiglietta@sbcglobal.net' union all
select 'Association House of Chicago','1116 North Kedzie Avenue Chicago, IL 60651','Jeanette','Igwe','773-772-7170 X3506.','jigwe@associationhouse.org' union all
select 'Central States SER','3948 W. 26th Street, Suite 213 Chicago, Illinois 60623','Kate','Schedler','503-989-6313','KSchedler@centralstatesser.org' union all
select 'Centro Romero','6216 N Clark St  Chicago, IL 60660','Ieva','Pucinskaite','773-508-5300 ext. 14','IPucinskaite@centroromero.org' union all
select 'Arts of Life','2010 W Carroll Ave  Chicago, IL 60612','LIZ','LONGO','773-573-7362','llongo@artsoflife.org' union all
select 'St. Joseph Services','1501 N Oakley Blvd  Chicago, IL 60622','BEATRICE','JURADO','773-278-0484','BJURADO@STJOSEPHSERVICES.ORG' union all
select 'Vietnamese Association of Illinois','5110 N Broadway St  Chicago, IL 60640','LEPHUONG','TRAN','1-773-728-3700','LEPHUONGTRAN@YAHOO.COM' union all
select 'Gary Comer Youth Center','7200 S Ingleside Ave  Chicago, IL 60619','SENYAH','HAYNES','773-358-4100','SHAYNES@GCYCHOME.ORG' union all
select 'La Casa Norte','3533 W North Ave  Chicago, IL 60647','JESSICA','RODRIGUEZ','1-773-276-4900 x 212','Jessica@lacasanorte.org' union all
select 'Kenwood Oakland Community Organization (KOCO)','4242 S Cottage Grove Ave  Chicago, IL 60653','SHANNON','BENNETT','(773) 548-7500','SBENNETT@KOCONLINE.ORG' union all
select 'St. Joseph Services','1501 N. Oakley Blvd Chicago, IL 60622','BEATRICE','JURADO','773-278-0484','BJURADO@STJOSEPHSERVICES.ORG' union all
select 'Albany Park Community Center','930 E. 50th Street Chicago, IL 60615','MICHELLE','CHAMBERS','1-773-256-2762','MCHAMBERS@RAINBOWPUSH.ORG' union all
select 'Because I Care','5811 W. CHICAGO AVE (FLOOR 2) CHICAGO, IL 60651','ROMAN','MORROW','1-773-261-0555','romanmorrow@yahoo.com' union all
select 'Chicago Lights','126 E. Chestnut St. Chicago, IL, 60611','AARON','MITCHELL','1-312-274-3816','amitchell@fourthchurch.org' union all
select 'Gary Comer Youth Center','7200 S Ingleside Ave  Chicago, IL 60619','SENYAH','HAYNES','1-773-358-4100','SHAYNES@GCYCHOME.ORG' union all
select 'Hamdard Center','1542 W Devon Ave  Chicago, IL 60626','KIRAN','SIDDIQUI',' (773) 465-4600 x.27','ksidd@hamdardcenter.org' union all
select 'Lighthouse Youth Center','4338 S. PRAIRIE, CHICAGO, IL 60653','AMBER','KIRK','1-773-625-8075','ambernh27@yahoo.com' union all
select 'Near West Side Community Development Corporation','216 S. Hoyne Ave. Chicago, IL 60612','OJI','EGGLESTON','1-312-738-2280','oji@nearwestsidecdc.org' union all
select 'Association House of Chicago','1116 N. KEDZIE','ELIZABETH','AGRONT- HOULIHAN','773-772-7170 EXT. 6102','EAGRONT@ASSOCIATIONHOUSE.ORG' union all
select 'Individual Placement','N/A','CHARLOTTE ','PHILLIPS','773-325-4933','CPHILLI3@DEPAUL.EDU' union all
select 'Chicago Alliance Against Racist and Political Repression','1305 S. Wabash Ave, Suite 105 Chicago, Il 60605','Ted','Pearson','312-939-2750','tpearson@naarpr.org' union all
select 'West Suburban PADS (Maywood)','1851 S. 9th Avenue Maywood, Illinois 60153','Theresa','Curran','708.338.1724 x222','tcurran@westsuburbanpads.org' union all
select 'Central States SER - Gang Intervention','3948 W. 26th Street Chicago, Illinois 60623','Pedro','Mendez','(773) 596-6048','pmendez@centralstatesser.org' union all
select '826CHI','1331 N. Milwaukee Avenue, Chicago, IL 60622','Kendra','Curry','773-772-8108','Kendra@826chi.org' union all
select 'Hephzibah Children''s Association (Oak Park)','946 North Boulevard, Oak Park, IL 60301','Gerry','Nekrosius','708-649-7100; 773-558-3435','mamagoose1@comcast.net' union all
select 'La Casa Norte','3533 W. North Avenue, Chicago, IL 60647','Joe','Hankey','773-276-4900 x 223','joe@lascasanorte.org' union all
select 'Faculty Placement','4833 N. Francisco Avenue, Chicago, IL 60625','Jennifer','North','773-334-7245','jnorth@lawrencehall.org' union all
select 'Voices for Creative Nonviolence','1249 W. Argyle St.','Gerald','Paoli','773-878-3815','gerald@vcnv.org' union all
select 'American Friends Service Committee','637 S. Dearborn St. 3rd Floor','Molly','McQueen','312-427-2533','mmcqueen@afsc.org' union all
select 'Fellowship of Reconcilliation (West Chicago)','Various Locations','Rev. Sam','Smith','630-240-5039','forchicago@comcast.net' union all
select 'Su Casa Catholic Worker','5045 S. Laflin St. ','Simone','Denny','773-376-9263','sucasateam@gmail.com' union all
select 'Pan-African Association','6163 N. Broadway St.','Kristen','Little','773-381-9723','klittle@panafricanassociation.org' union all
select 'Chinese Mutual Aid Association (CMAA)','1016 W. Argyle St.','Heather','Turnbull','773-784-2900','heathert@chinesemutualaid.org' union all
select 'A Just Harvest','7653 N. Paulina Street ','Cindy','Bush','773-262-2297','cindy@ajustharvest.org' union all
select 'Peace Corner Youth Center','5022 W. Madison Ave.','Duane','Wilson','773-261-5330','duane.wilson@thepeacecorner.org' union all
select 'Chicago Religious Leadership Network on Latin Am.','4750 N Sheridan rd. Suite 429','Sharon','Hunter-Smith','773-293-2964','shunter-smith@crln.org' union all
select 'Chicago Alliance Against Racist and Political Repression','1305 S. Wabash Ave, Suite 105','Ted','Pearson','312-939-2750','tpearson@naarpr.org' union all
select 'Jane Addams Resource Center','4432 N. Ravenswood','Neha','Chitnavis','773-751-7106','nehac@jane-addams.org' union all
select 'Faculty Placement','TBD','TBD','TBD','TBD','TBD' union all
select 'Baretto Union Boys and Girls Club','1214 N Washtenaw Ave.','Jonathan','Freaney','773-726-4275','jonathanfreaney2013@u.northwestern.edu' union all
select 'Faculty Placement','TBD','TBD','TBD','TBD','TBD' union all
select 'Erie Neighborhood House','4225 W. 25th St.','Rachel','Serra','773-542-7617 ext. 27','tba@blah.com' union all
select 'Faculty Placement','TBD','TBD','TBD','TBD','TBD' union all
select 'Providence Family Services','1540 N. Monticello','Sister','Carolyn','773-235-8264','mbvmhomeworkclub@aol.com' union all
select 'Fathers, Families, and Healthy Communities','3901 South State Street, Chicago, IL 60609﻿','Sequane ','Lawrence','312-252-0460 ext. 120','TBD' union all
select 'Anixter Center','2032 N. Clybourn Ave. Chicago, IL 60614','Melissa','Manak','773-796-5809','mmanak@anixter.org' union all
select 'Chicago Alliance Against Racist and Political Repression','1325 S. Wabash Avenue, Suite 105 Chicago, IL 60605','Ted','Pearson','(312) 939-2750','tpearson@naarpr.org' union all
select 'Safer Foundation Youth Empowerment','611 W Adams St. Chicago, IL 60661','Enid','Johnson','312-575-3275','enid.johnson@saferfoundation.org' union all
select 'Telpochcalli Community Education Project (TCEP)','2832 W. 24th Blvd','Maria','Velasquez','773-534-1402, ext 60865','mdvelazquez8@hotmail.com' union all
select 'Universidad Popular','2801 South Hamlin Ave.','Izabela','Gluszak','773- 733-5055 ext 11','igluszak@universidadpopular.us' union all
select 'Lincoln Park Community Shelter','Lincoln Park','Elli','Krandel','123-456-7890','lpcsinfo@lpcsonline.org' union all
select 'Central States SER - YouthBuild','3948 W. 26th Street, Suite 213 Chicago, IL 60623','Kate','Schedler','503-989-6313','KSchedler@centralstatesser.org' union all
select 'Working Bikes','2434 S. Western Ave. Chicago, IL 60608','Sujith','Kumar','773-325-4516','volunteer@workingbikes.org' union all
select 'Vietnamese Association of Illinois','5110 N Broadway St. Chicago, IL 60640','LePhuong ','Tran','773-728-3700 x23','lephuongtran@yahoo.com ' union all
select 'Alliance for Community Peace (Wayman)','509 West Elm Street Chicago, IL 60610','Anita','Stevenson','312-943-8531','anitastevenson.acp@gmail.com' union all
select 'Supportive Housing Providers Association','212 East Ohio, Suite 500 Chicago, IL60611','Johnna','Lowe','312-202-0256','j.lowe@shpa-il.org' union all
select 'Union League Boys and Girls Club - Club One','2157 West 19th Street Chicago, IL 60608','Margie ','Cepeda-Vargas','312-829-6840','maguecv@yahoo.com' union all
select 'Union League Boys and Girls Club - Club One','2157 West 19th Street Chicago, IL 60608','Margie','Cepeda-Vargas','312-829-6840','maguecv@yahoo.com' union all
select 'Imagine Englewood if...!','1854 W Garfield Blvd. Chicago, IL 60609','Jean','Carter-Hill','773-778-1304','jean@imagineenglewoodif.org' union all
select 'Providence Family Services','1540 N Monticello Ave. Chicago, IL 60651','Sister','Carolyn','773-235-8264','mbvmhomeworkclub@aol.com' union all
select 'Chicago Lights','126 E. Chestnut St. Chicago, IL 60611','Aaron','Mitchell','312-274-3816 ','amitchell@fourthchurch.org' union all
select 'Stateville Correctional Center','2233 N. Kenmore','Sergio','Elahi','773-325-8677','selahi1@depaul.edu' union all
select 'Central States SER','3948 W. 26th Street, Suite 213  Chicago, Illinois 60623','Greg','Martinez','(773)858-8937','g.martinez@centralstatesser.org' union all
select 'Lawrence Hall Youth Services','4833 N. Francisco Avenue, Chicago, IL 60625','Jennifer','North','773-334-7245','jnorth@lawrencehall.org' union all
select 'Hamdard Center','1542 W Devon Ave. Chicago, IL 60626','Tracy','Vega','773-465-4600 x6','tvega@hamdardcenter.org' union all
select 'St. Joseph Services','1501 N. Oakley Blvd. Chicago, IL 60622','Bea','Jurado','773.278.0484 ext. 310','bjurado@stjosephservices.org' union all
select 'St. Leonard''s House - Michael Barlow Center','48 North Hoyne Avenue Chicago, IL 60612','Sister Sharon','Bossler','312-666-0950','volunteer@slministries.org' union all
select 'Westside Health Authority','5816 W. Division Street Chicago, IL. 60651','Roger','Ehmen','773-786-0226 x 2106','rehmen@healthauthority.org' union all
select 'Better Boys Foundation','1512 S Pulaski Rd. Chicago, IL 60623','Sara','Chambers','773-542-7335','schambers@betterboys.org' union all
select 'Erie Neighborhood House','1347 W Erie','Justin','Hochesster','312-432-2254','justinh@eriehouse.org' union all
select 'Sage Community Health Collective','2514 W Armitage','Stacy ','Erenberg','773-582-4458','sagecommunityhealth@gmail.com' union all
select 'Iraqi Student Project','Off-Campus','Elizabeth','Mertic','847-424-0957','emertic@sbcglobal.net' union all
select 'Refugee and Immigrant Community Services (RICS)','4419 N Ravenswood Avenue','Katie','Styer','773-728-5960 x 6314','kstyer@heartlandalliance.org' union all
select 'Metropolitan Tenants Organization','2150 S Canalport Ave','Regina','Rizzo','773-292-4980 ext. 223','regina@tenants-rights.org' union all
select 'Association House of Chicago','1116 North Kedzie Avenue Chicago, IL 60651','Elizabeth','Agrant','773-772-7170 x6102','eagrant@associationhouse.org' union all
select 'Austin Coming Together (ACT)','5049 W. Harrison St. Chicago, IL 60644','Andrew','Born','773-417-8612','aborn@austincomingtogether.org' union all
select 'Jewish Child and Family Services','216 W. Jackson Suite 800 Chicago, IL 60606','Deanna','Shoss','312-673-2777','TBA' union all
select 'La Casa Norte','La Casa Norte','Sol ','Flores','773-276-4900 x 208','sol@lacasanorte.org' union all
select 'Campaign for Better Health Care','1325 S. Wabash Ste. 305 Chicago, IL 60605','Kathleen','Duffy','312-913-9449','kduffy@cbhconline.org' union all
select 'Sarah''s Circle','4750 N. Sheridan Road Suite 220 Chicago, IL 60640','Bianca','Hart','773-728-1991 x303','bhart@sarahs-circle.org'
)
--insert into cbo(name,[address],ContactFristName,ContactLastName,ContactEmail,ContactPhone)
update cbo set [address]=c2.[address] from cbo as c inner join newcbo as c2 on c.name=c2.name
--select name,count(*) from newcbo group by name having count(*)>1 order by name
--select * from cbo where name in (select name from newcbo)