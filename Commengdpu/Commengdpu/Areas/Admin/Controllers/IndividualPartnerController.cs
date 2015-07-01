using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.IndividualPartnerServices;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_individualPartner")]
    public class IndividualPartnerController : Controller
    {
        //
        // GET: /Admin/IndividualPartner/

       


        [Dependency]
        public IIndividualPartnerFactory IndividualPartnerFactory { get; set; }

        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateUniqueUrl(string uniqueUrl)
        {
            if (!IndividualPartnerFactory.ExistsUniqueUrl(uniqueUrl))
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
        public ActionResult Add(IndividualPartner model,string ul)
        {
            if (model.ID > 0)
            {
                model.UniqueUrl = ul;
                ModelState.Remove("UniqueUrl");
            }
            if (ModelState.IsValid)
            {
                #region =Community Partners=

                var communityPartner2IndividualPartners = null as IEnumerable<CommunityPartner2IndividualPartner>;
                var communityPartnerIdString = Request.Form["communityPartnerIds"];
                if (!string.IsNullOrEmpty(communityPartnerIdString))
                {
                    communityPartner2IndividualPartners =
                        communityPartnerIdString.Split(',')
                            .Select(
                                id =>
                                    new CommunityPartner2IndividualPartner()
                                    {
                                        CommunityPartnerID = Convert.ToInt32(id),
                                        IndividualPartnerID = model.ID
                                    });
                }
                #endregion
                if (IndividualPartnerFactory.SaveToDb(model,communityPartner2IndividualPartners) > 0)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["IsFrontEnd"]))
                    {
                        return RedirectToAction("Index", "IndividualPartner", new { area = "", id = model.UniqueUrl });
                    }
                    return RedirectToAction("List");
                }
                ModelState.AddModelError("Name", "Failed to save IndividualPartner information, please contact the administrator!");
            }
            return View(model);
        }
        public ActionResult Edit(int ID)
        {
            return View("Add", IndividualPartnerFactory.Create(ID));
        }
        public ActionResult Delete(int ID)
        {
            IndividualPartnerFactory.Delete(ID);
            return RedirectToAction("List");
        }
        public ActionResult List(int page = 1)
        {
            return View(IndividualPartnerFactory.CreateList(page, 50));
        }
        
    }
}
