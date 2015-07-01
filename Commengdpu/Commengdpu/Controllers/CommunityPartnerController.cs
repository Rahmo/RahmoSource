using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer.CommunityPartnerServices;
using Commengdpu.Models.Settings;
using ICStars2_0.Common;
using Microsoft.Practices.Unity;

namespace Commengdpu.Controllers
{
    [Authorize]
    public class CommunityPartnerController : Controller
    {
        //
        // GET: /CommunityPartner/
        [Dependency]
        public ICommunityPartnerFactory CommunityPartnerFactory { get; set; }
        public ActionResult Index(string id)
        {
            return View(CommunityPartnerFactory.Create(id));
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
            return Json(CommunityPartnerFactory.TopList(settings: new CommunityPartnerCollectionSettings() { NameKeywords = name, IsRanked = true }), JsonRequestBehavior.AllowGet);
        }
    }
}
