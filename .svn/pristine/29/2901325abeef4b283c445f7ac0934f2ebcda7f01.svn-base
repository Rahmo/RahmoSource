using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer.CategoryServices;
using Commengdpu.BusinessLayer.CommunityPartnerServices;
using Commengdpu.BusinessLayer.IndividualPartnerServices;
using Commengdpu.BusinessLayer.ProjectServices;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Common;
using Microsoft.Practices.Unity;

namespace Commengdpu.Controllers
{
    [Authorize]
    public class SearchController : Controller
    {
        //
        // GET: /Search/

        [Dependency]
        public ICategoryFactory CategoryFactory { get; set; }

        [Dependency]
        public IProjectFactory ProjectFactory { get; set; }
        [Dependency]
        public IIndividualPartnerFactory IndividualPartnerFactory { get; set; }
        [Dependency]
        public ICommunityPartnerFactory CommunityPartnerFactory { get; set; }
        public ActionResult Index()
        {

            return View(CategoryFactory.BuildRootCategoryNodes());
        }
        [HttpPost]
        public ActionResult Index(string[] categories)
        {
            if (categories == null)
                return RedirectToAction("Index");
            return RedirectToAction("List", "Project", new {categories = categories.Aggregate((x, y) => x + "|" + y)});
        }
        public JsonResult GetJsonResultList(string name)
        {
#if !DEBUG
            if (!Request.IsAjaxRequest())
            {
                throw new Exception("Forbidden!");
            }
#endif

            var k = MathHelper.Md5(Const.ENCRYPT_KEY + DateTime.Now.ToString("yyyyMMddHH"));
            var k2 = MathHelper.Md5(Const.ENCRYPT_KEY + DateTime.Now.AddHours(-1).ToString("yyyyMMddHH"));
            if (!Request.QueryString["k"].Equals(k)
                && !Request.QueryString["k"].Equals(k2))
            {
                throw new Exception("Forbidden!");
            }
            if (string.IsNullOrEmpty(name))
            {
                return Json(new ProjectForList[]{}, JsonRequestBehavior.AllowGet);
            }
            return Json(ProjectFactory.TopList(settings:
                new ProjectCollectionSettings() {NameKeywords = name, IsRanked = true})
                .Select(
                    m =>
                        new
                        {
                            Name = m.Name + " (Project)",
                            Link = Url.Action("Index", "Project", new {id = m.ProjectUniqueUrl})
                        })
                .Union(
                    CommunityPartnerFactory.TopList(settings:
                        new CommunityPartnerCollectionSettings() {NameKeywords = name, IsRanked = true})
                        .Select(
                            m =>
                                new
                                {
                                    Name = m.Name + " (Community Partner)",
                                    Link = Url.Action("Index", "CommunityPartner", new {id = m.UniqueUrl})
                                })
                )
                .Union(
                    IndividualPartnerFactory.TopList(settings:
                        new IndividualPartnerCollectionSettings() {NameKeywords = name, IsRanked = true})
                        .Select(
                            m =>
                                new
                                {
                                    Name = m.FirstName + " " + m.LastName + " (Individual Partner)",
                                    Link = Url.Action("Index", "IndividualPartner", new {id = m.UniqueUrl})
                                })
                ), JsonRequestBehavior.AllowGet);
        }
    }
}
