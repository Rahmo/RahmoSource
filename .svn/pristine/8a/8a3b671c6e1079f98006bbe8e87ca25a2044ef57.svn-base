using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer.ProjectServices;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Common;
using Microsoft.Practices.Unity;

namespace Commengdpu.Controllers
{
    [Authorize]
    public class MapController : Controller
    {
        //
        // GET: /Map/

        [Dependency]
        public IProjectFactory ProjectFactory { get; set; }
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetJsonResultList(string addressKeywords)
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
            if (string.IsNullOrEmpty(addressKeywords))
            {
                return Json(new ProjectForList[] { }, JsonRequestBehavior.AllowGet);
            }
            return Json(ProjectFactory.TopList(30,settings:
                new ProjectCollectionSettings() { NameKeywords = addressKeywords, IsRanked = true, FulltextIndexFields = "[Address],City,County,[State],ZipCode,Nation" })
                .Select(
                    m =>
                        new
                        {
                            m.Name,
                            Address = string.Format("{0}, {1} {2} {3}",m.Address,m.City,m.State,m.ZipCode),
                            Link = Url.Action("Index", "Project", new { id = m.ProjectUniqueUrl }),
                            m.Thumbnail,
                            m.Description
                        })
                , JsonRequestBehavior.AllowGet);
        }
    }
}
