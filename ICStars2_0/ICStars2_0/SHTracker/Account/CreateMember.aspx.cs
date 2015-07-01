using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Account
{
    [Authorize(Roles = "admin,admin_account,admin_account_slc")]
    public partial class CreateMember : System.Web.UI.Page
    {
        private IMemberFactory _memberFactory;
        
        [Dependency]
        public IMemberFactory MemberFactory
        {
            get { return _memberFactory; }
            set { _memberFactory = value; }
        }

        [Dependency]
        public ICBOFactory CBOFactory { get; set; }

        public IEnumerable<SelectListItem> CBONameList { get; set; }

        [Dependency]
        public ICourseFactory CourseFactory { get; set; }

        public IEnumerable<SelectListItem> CourseNameList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                CBONameList = new[]
                                  {
                                      new SelectListItem
                                          {
                                              Text = "Select CBO",
                                              Value = "",
                                              Selected = true
                                          }
                                  }.Union(CBOFactory.BuildCBOSeleteListItems(0,
                                                                             new CBOCollectionSettings
                                                                                 {IsCheckSLC = true, SLC = ""}));

                CourseNameList = new[]
                                     {
                                         new SelectListItem
                                             {
                                                 Text = "Select Course",
                                                 Value = "",
                                                 Selected = true
                                             }
                                     }.Union(CourseFactory.BuildCourseSeleteListItems(-1));
            }
        }

        public string[] GetNewRole(string roles)
        {
            string[] roleslist = null;
            if (!string.IsNullOrEmpty(roles))
            {
                if (roles.IndexOf(',') > -1)
                {
                    roleslist = roles.Split(',');
                }
                else
                {
                    roleslist = new string[] { roles };
                }
            }
            else
            {
                roleslist = new string[0];
            }
            return roleslist;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Member m = new Member();
            m.CampusConnectID = txtUserName.Text.Trim();
            m.FirstName = txtFirstName.Text.Trim();
            m.LastName = txtLastName.Text.Trim();
            m.EmplID = txtDPUID.Text.Trim();
            m.Email = txtEmail.Text.Trim();
            m.Phone = txtPhone.Text.Trim();
            if (!string.IsNullOrEmpty(txtOfficeHours.Text))
            {
                m.OfficeHours = txtOfficeHours.Text.Trim();
            }

            m.Status = cbxStatus.Checked;
            m.IP = BrowserInfo.GetIp();
            if (m.ID == 0)
            {
                m.LastLoginDate = DateTime.Now;
                m.RegisterDate = DateTime.Now;
            }


            MemberFactory.Update(m);
            try
            {
                #region =Cbo Operation=

                if (Request.Form["CBOIDList"] != null)
                {
                    IEnumerable<int> newCboIdList = Request.Form["CBOIDList"].Split(',').Select(i => Convert.ToInt32(i));
                    IEnumerable<int> userCboIdList =
                        CBOFactory.CreateCBOCollection(1, 1000,
                                                       new CBOCollectionSettings {IsCheckSLC = true, SLC = m.CampusConnectID}).
                            Select(cbo => cbo.ID);

                    IEnumerable<int> cboIdListForAdd = newCboIdList.Except(userCboIdList);
                    IEnumerable<int> cboIdListForDelete = userCboIdList.Except(newCboIdList);

                    foreach (int cboid in cboIdListForAdd)
                    {
                        CBOFactory.UpdateSlc(cboid, m.CampusConnectID);
                        //Member2CboFactory.Create(m.ID, cboid);
                    }
                    foreach (int cboid in cboIdListForDelete)
                    {
                        CBOFactory.UpdateSlc(cboid, "");
                        //Member2CboFactory.Delete(m.ID, cboid);
                    }
                }

                #endregion

                #region =Course Operation=

                if (Request.Form["CourseIDList"] != null)
                {
                    IEnumerable<int> newCourseIdList = Request.Form["CourseIDList"].Split(',').Select(i => Convert.ToInt32(i));
                    IEnumerable<int> userCourseIdList =
                        CourseFactory.CreateCourseCollection(1, 1000,
                                                       new CourseCollectionSettings { IsCheckInstructorName = true, InstructorName = m.CampusConnectID }).
                            Select(course => course.ID);

                    IEnumerable<int> courseIdListForAdd = newCourseIdList.Except(userCourseIdList);
                    IEnumerable<int> courseIdListForDelete = userCourseIdList.Except(newCourseIdList);

                    foreach (int courseid in courseIdListForAdd)
                    {
                        CourseFactory.UpdateInstructorName(courseid, m.CampusConnectID);
                    }
                    foreach (int courseid in courseIdListForDelete)
                    {
                        CourseFactory.UpdateInstructorName(courseid, "");
                    }
                }

                #endregion

                //original user roles
                string[] userRoles = Roles.GetRolesForUser(m.CampusConnectID);
                //new user roles 
                string[] newRolesList = GetNewRole(Request.Form["roles"]);

                #region Roles Operation

                if (userRoles.IsEquals(newRolesList) == false)
                {
                    //if new user roles is empty
                    if (newRolesList != null && newRolesList.Length > 0)
                    {
                        var newRoles = newRolesList.Except(userRoles);
                        var rolesForDelete = userRoles.Except(newRolesList);

                        #region Add

                        if (newRoles.Count() > 0)
                        {
                            Roles.AddUserToRoles(m.CampusConnectID, newRoles.ToArray());
                        }

                        #endregion

                        #region Deleted

                        if (rolesForDelete.Count() > 0)
                        {
                            Roles.RemoveUserFromRoles(m.CampusConnectID, rolesForDelete.ToArray());
                        }

                        #endregion

                    }
                    else
                    {
                        Roles.RemoveUserFromRoles(m.CampusConnectID, newRolesList);
                    }
                }

                #endregion
            }
                catch(Exception exp)
                {
                    MemberFactory.Delete(m.ID);
                    throw (exp);
                }
            Response.Redirect("MemberManagement.aspx");

        }
    }
}