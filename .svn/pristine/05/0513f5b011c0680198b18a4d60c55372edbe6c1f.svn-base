using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.CategoryServices;
using Commengdpu.Models;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_category")]
    public class CategoryController : Controller
    {
        //
        // GET: /Admin/Category/
        [Dependency]
        public ICategoryFactory CategoryFactory { get; set; }
        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateName(string name,int? ID)
        {
            #region =When Updating=

            if (ID > 0)
            {
                var category = CategoryFactory.Create((int)ID);
                if (category.Name.Equals(name, StringComparison.CurrentCultureIgnoreCase))
                {
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }
            #endregion
            if (!CategoryFactory.Exists(name))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }


            return Json("[" + name + "] is already in use!", JsonRequestBehavior.AllowGet);
        }
        public ActionResult Add()
        {
            var sortedList = CategoryFactory.BuildRootCategoryNodes().SelectMany(n => n.BuildNodesForDropDown());
            ViewBag.ParentDropdown =
                sortedList.Select(n => new SelectListItem() { Text = n.Name, Value = n.ID.ToString() });
            return View();
        }
        [HttpPost]
        public ActionResult Add(Category model)
        {
            if (ModelState.IsValid)
            {
                if (CategoryFactory.SaveToDb(model) > 0)
                {
                    return RedirectToAction("List");
                }
                ModelState.AddModelError("Name", "Failed to save Category information, please contact the administrator!");
            }
            return View(model);
        }
        public ActionResult Edit(int ID)
        {

            var sortedList = CategoryFactory.BuildRootCategoryNodes().SelectMany(n => n.BuildNodesForDropDown());
            ViewBag.ParentDropdown =
                sortedList.Select(n => new SelectListItem() { Text = n.Name, Value = n.ID.ToString() });
            return View("Add", CategoryFactory.Create(ID));
        }

        public ActionResult Delete(int ID)
        {
            CategoryFactory.Delete(ID);
            return RedirectToAction("List");
        }
        public ActionResult List(int page = 1)
        {
            return View(CategoryFactory.BuildRootCategoryNodes());
        }
    }
}
