using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.CommunityPartnerServices;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_communityPartner")]
    public class CommunityPartnerController : Controller
    {
        //
        // GET: /Admin/CommunityPartner/

        [Dependency]
        public ICommunityPartnerFactory CommunityPartnerFactory { get; set; }

        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateUniqueUrl(string uniqueUrl)
        {
            if (!CommunityPartnerFactory.ExistsUniqueUrl(uniqueUrl))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }


            return Json("[" + uniqueUrl + "] is already in use!", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(CommunityPartner model,string ul)
        {
            if (model.ID > 0)
            {
                model.UniqueUrl = ul;
                ModelState.Remove("UniqueUrl");
            }
            if (ModelState.IsValid)
            {
                if (CommunityPartnerFactory.SaveToDb(model) > 0)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["IsFrontEnd"]))
                    {
                        return RedirectToAction("Index", "CommunityPartner", new { area = "", id = model.UniqueUrl });
                    }
                    return RedirectToAction("List");
                }
                ModelState.AddModelError("Name", "Failed to save CommunityPartner information, please contact the administrator!");
            }
            return View(model);
        }
        public ActionResult Edit(int ID)
        {
            return View("Add", CommunityPartnerFactory.Create(ID));
        }
        public ActionResult Delete(int ID)
        {
            CommunityPartnerFactory.Delete(ID);
            return RedirectToAction("List");
        }
        public ActionResult List(int page = 1)
        {
            return View(CommunityPartnerFactory.CreateList(page, 50));
        }
    }
}
