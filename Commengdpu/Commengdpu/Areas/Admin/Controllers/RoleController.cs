using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.RoleServices;
using Commengdpu.Models;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_role")]
    public class RoleController : Controller
    {
        //
        // GET: /Admin/Role/
        [Dependency]
        public IRoleFactory RoleFactory { get; set; }
        public ActionResult List()
        {
            return View(RoleFactory.List());
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(Role role)
        {
            if (ModelState.IsValid)
            {
                RoleFactory.SaveToDb(role);
                return RedirectToAction("List");
            }
            return View();
        }
        public ActionResult Edit(int id)
        {
            return View("Add",RoleFactory.Create(id));
        }
    }
}
