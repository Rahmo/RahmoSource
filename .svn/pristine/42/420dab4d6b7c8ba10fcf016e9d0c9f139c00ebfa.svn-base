using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer;
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
    public class ProjectController : Controller
    {
        //
        // GET: /Project/
        [Dependency]
        public IProjectFactory ProjectFactory { get; set; }
        [Dependency]
        public IIndividualPartnerFactory IndividualPartnerFactory { get; set; }
        [Dependency]
        public ICommunityPartnerFactory CommunityPartnerFactory { get; set; }
        [Dependency]
        public IProject2CategoryFactory Project2CategoryFactory { get; set; }
        public ActionResult List(int page=1)
        {
            IPageableCollection<Project> projects = null;
            if (!string.IsNullOrEmpty(Request.QueryString["categories"]))
            {
                var categories = Request.QueryString["categories"].Split('|');
                ViewBag.Title = "Projects By " + categories.ToString(",");
                projects = ProjectFactory.CreateList(page, 20, categories);
            }
            else
            {
                ViewBag.Title = "All Projects";
                projects = ProjectFactory.CreateList(page, 20);
            }
            ViewBag.Project2Categories = Project2CategoryFactory.GetProject2Categories(projects.Select(p => p.ID).ToArray());
            return View(projects);
        }
        /// <summary>
        /// Project profile page
        /// </summary>
        /// <param name="id">ProjectUniqueUrl</param>
        /// <returns></returns>
        public ActionResult Index(string id)
        {
            return View(ProjectFactory.Create(id));
        }
        
    }
}
