using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.Steans.Controllers
{
    public class ProjectRequestController : Controller
    {
        //
        // GET: /Steans/ProjectRequest/

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(ProjectRequestForm model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                    db.ProjectRequestFormProfiles.Add(model);
                    if (db.SaveChanges() > 0)
                    {

                        var view = View(model);
                        view.ViewBag.IsDetails = true;
                        view.ExecuteResult(ControllerContext);
                        var htmlcontent = string.Empty;
                        var urlRoot = Request.Url.GetLeftPart(UriPartial.Authority);
                        using (var writer = new StringWriter())
                        {
                            var context = new ViewContext(ControllerContext, view.View, ViewData, TempData, writer);
                            view.View.Render(context, writer);
                            writer.Flush();
                            htmlcontent = writer.ToString();

                            htmlcontent = Regex.Replace(htmlcontent, @"href=""/", string.Format("href=\"{0}/", urlRoot), RegexOptions.IgnoreCase);
                            htmlcontent = Regex.Replace(htmlcontent, @"src=""/", string.Format("src=\"{0}/", urlRoot), RegexOptions.IgnoreCase);
                            htmlcontent = Regex.Replace(htmlcontent, @"url\(/", string.Format("url({0}/", urlRoot), RegexOptions.IgnoreCase);


                        }
                        ProjectRequestSettings settings =
                            SteansSettingsFactory.CreateBaseSetings<ProjectRequestSettings>();
                        if (settings.IsSendingEmail)
                        {
                            EmailService.SendEmail("reminder@depaul.edu", settings.ReceiverEmail,
                                                              model.Title+"--Project Request Form",
                                                              settings.EmailBody.Replace("#Title#", model.Title).Replace("#Link#", string.Format("<a href=\"{0}/SHTracker/Steans/ProjectRequestDetails/{1}?k={2}\">Go to View</a>", urlRoot, model.ID, Common.MathHelper.Md5(string.Format("{0}{1}", Common.Const.ENCRYPT_KEY, model.ID)))),
                                                              settings.IsHtmlEmail);

                        }
                        return RedirectToAction("Success");
                    }
                }
            }
            ViewBag.Error = "Your action failed! Please retry or contact administrator.";
            return View(model);
        }

        public ActionResult Success()
        {
            ViewBag.Title = "Project Request Form has been submitted!";
            ViewBag.H1 = "Your Project Request Form has been submitted!";
            return View();
        }

        //public ActionResult Test()
        //{
        //    using (var db = new SHTrackerDbContext())
        //    {
        //        var test1 = db.TestEfProfiles.Include("TestEfLists").First(m => m.ID == 1);
        //        var sss = test1.TestEfLists;
        //        return Content(db.TestEfProfiles.Include("TestEfLists").Take(1).ToString());
        //    }
        //    return Content("test");
        //}

    }

}
