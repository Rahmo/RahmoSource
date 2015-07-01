using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.ProjectServices;
using Commengdpu.BusinessLayer.RoleServices;
using Commengdpu.BusinessLayer.UserServices;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using Commengdpu.Models.Settings;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_user")]
    public class UserController : Controller
    {
        //
        // GET: /Admin/User/
        [Dependency]
        public IUserFactory UserFactory { get; set; }
        [Dependency]
        public IRoleFactory RoleFactory { get; set; }
        [Dependency]
        public IUser2RoleFactory User2RoleFactory { get; set; }
        public ActionResult List(int page)
        {
            var settings = new UserCollectionSettings();
            if (string.IsNullOrEmpty(Request.QueryString["allRoles"]))
            {
                settings.FilterByRoleName = Request.QueryString["role"];
                if (!string.IsNullOrEmpty(Request.QueryString["noRoles"]))
                {
                    settings.HasNoRole = true;
                }
            }
            return View(UserFactory.CreateList(page, 50, settings));
        }
        public ActionResult Add()
        {
            ViewBag.Roles = RoleFactory.List();
            return View();
        }

        [HttpPost]
        public ActionResult Add(User user)
        {
            if (ModelState.IsValid)
            {
                #region =Roles=
                var user2Roles = null as IEnumerable<User2Role>;
                var roleIdString = Request.Form["roles"];
                if (!string.IsNullOrEmpty(roleIdString))
                {
                    user2Roles = roleIdString.Split(',')
                            .Select(
                                id =>
                                    new User2Role()
                                    {
                                        RoleID = Convert.ToInt32(id),
                                        UserID = user.ID
                                    });
                }
                #endregion
                UserFactory.SaveToDb(user,user2Roles);
                return RedirectToAction("List");

            }
            ViewBag.Roles = RoleFactory.List();
            return View();
        }

        public ActionResult Edit(int id)
        {
            var user = UserFactory.Create(id);
            var roles = RoleFactory.List().ToArray();
            for (int i = 0; i < roles.Length; i++)
            {
                roles[i].IsChecked = user.User2Roles.Any(u2r => u2r.RoleID == roles[i].ID);
            }
            ViewBag.Roles = roles;
            return View("Add", user);
            
        }

        public ActionResult Activate(int userId)
        {
            var user = UserFactory.Create(userId);
            user.IsActivated = true;
            UserFactory.SaveToDb(user);
            return RedirectToAction("List");

        }

        public ActionResult Deactivate(int userId)
        {
            var user = UserFactory.Create(userId);
            user.IsActivated = false;
            UserFactory.SaveToDb(user);
            return RedirectToAction("List");

        }
    }
}
