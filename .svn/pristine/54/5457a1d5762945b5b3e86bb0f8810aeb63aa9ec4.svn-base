using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.CategoryServices;
using Commengdpu.BusinessLayer.ProjectServices;
using Commengdpu.BusinessLayer.ProjectTypeServices;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;
using ICStars2_0.Common;
namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_project")]
    public class ProjectController : Controller
    {
        //
        // GET: /Admin/Project/
        [Dependency]
        public IProjectFactory ProjectFactory { get; set; }

        [Dependency]
        public ICategoryFactory CategoryFactory { get; set; }
        [Dependency]
        public IProjectTypeFactory ProjectTypeFactory { get; set; }

        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateProjectUniqueUrl(string projectUniqueUrl)
        {
            if (!ProjectFactory.ExistsUniqueUrl(projectUniqueUrl))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }


            return Json("[" + projectUniqueUrl + "] is already in use!", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Add()
        {
            ViewBag.CagegoryNodes = CategoryFactory.BuildRootCategoryNodes();
            ViewBag.ProjectTypes = ProjectTypeFactory.CreateList().OrderBy(t => t.OrderByID);
            return View();
        }
        [HttpPost]
        public ActionResult Add(Project model,string ul)
        {
            if (model.ID > 0)
            {
                model.ProjectUniqueUrl = ul;
                ModelState.Remove("ProjectUniqueUrl");
            }
            if (ModelState.IsValid)
            {

                #region =Categories=

                var categoryIdString = Request.Form["categories"];
                var project2Categories = null as IEnumerable<Project2Category>;
                if (!string.IsNullOrEmpty(categoryIdString))
                {
                    var impactAmountString = Request.Form["categoryImpactAmounts"];
                    var id2ImpactAmount = new Hashtable();
                    foreach (var s in impactAmountString.Split(','))
                    {
                        id2ImpactAmount.Add(s.Split('_')[0], string.IsNullOrEmpty(s.Split('_')[1]) ? "0" : s.Split('_')[1]);
                    }
                    project2Categories = categoryIdString.Split(',')
                        .Where(c => !string.IsNullOrEmpty(c))
                        .Select(
                            c =>
                                new Project2Category()
                                {
                                    ProjectID = model.ID,
                                    CategoryID = Convert.ToInt32(c),
                                    ImpactAmount = Convert.ToInt32(id2ImpactAmount[c])
                                });
                }
                #endregion
                #region =Community Partners=

                var project2CommunityPartners = null as IEnumerable<Project2CommunityPartner>;
                var communityPartnerIdString = Request.Form["communityPartnerIds"];
                if (!string.IsNullOrEmpty(communityPartnerIdString))
                {
                    project2CommunityPartners =
                        communityPartnerIdString.Split(',')
                            .Select(
                                id =>
                                    new Project2CommunityPartner()
                                    {
                                        CommunityPartnerID = Convert.ToInt32(id),
                                        ProjectID = model.ID
                                    });
                }
                #endregion

                #region =Individual Partners=
                var project2IndividualPartners = null as IEnumerable<Project2IndividualPartner>;
                var individualPartnerIdString = Request.Form["individualPartnerIds"];
                if (!string.IsNullOrEmpty(individualPartnerIdString))
                {
                    project2IndividualPartners =
                        individualPartnerIdString.Split(',')
                            .Select(
                                id =>
                                    new Project2IndividualPartner()
                                    {
                                        IndividualPartnerID = Convert.ToInt32(id),
                                        ProjectID = model.ID
                                    });
                }
                #endregion

                #region =Project Types=
                var project2Types = null as IEnumerable<Project2Type>;
                var project2TypeIdString = Request.Form["project2TypeIds"];
                var numberofParticipatingTargetsArray =
                    string.IsNullOrEmpty(Request.Form["NumberofParticipatingTargets"])
                        ? null
                        : Request.Form["NumberofParticipatingTargets"].Split(',').Select(s => s.ToNullableInt32()).ToArray();
                var numberofHoursServedArray = string.IsNullOrEmpty(Request.Form["NumberofHoursServed"])
                    ? null
                    : Request.Form["NumberofHoursServed"].Split(',').Select(s => s.ToNullableDouble()).ToArray();

                #region IsTrackingAll

                var numberofParticipatingFacultyArray =
                    string.IsNullOrEmpty(Request.Form["NumberofParticipatingFaculty"])
                        ? null
                        : Request.Form["NumberofParticipatingFaculty"].Split(',').Select(s => s.ToNullableInt32()).ToArray();
                var numberofFacultyHoursServedArray = string.IsNullOrEmpty(Request.Form["NumberofFacultyHoursServed"])
                    ? null
                    : Request.Form["NumberofFacultyHoursServed"].Split(',').Select(s => s.ToNullableDouble()).ToArray();
                var numberofParticipatingStaffArray =
                    string.IsNullOrEmpty(Request.Form["NumberofParticipatingStaff"])
                        ? null
                        : Request.Form["NumberofParticipatingStaff"].Split(',').Select(s => s.ToNullableInt32()).ToArray();
                var numberofStaffHoursServedArray = string.IsNullOrEmpty(Request.Form["NumberofStaffHoursServed"])
                    ? null
                    : Request.Form["NumberofStaffHoursServed"].Split(',').Select(s => s.ToNullableDouble()).ToArray();
                #endregion

                if (!string.IsNullOrEmpty(project2TypeIdString))
                {
                    project2Types =
                        project2TypeIdString.Split(',')
                            .Select(
                                id_index =>
                                {
                                    var id_index_array = id_index.Split(' ');
                                    var id = id_index_array[0].ToInt32();
                                    var index = id_index_array[1].ToInt32();
                                    return
                                        new Project2Type()
                                        {
                                            ProjectTypeID = id,
                                            ProjectID = model.ID,
                                            NumberofParticipatingTargets =
                                                numberofParticipatingTargetsArray != null &&
                                                numberofParticipatingTargetsArray.Length > index
                                                    ? numberofParticipatingTargetsArray[index]
                                                    : (int?) null,
                                            NumberofHoursServed =
                                                numberofHoursServedArray != null &&
                                                numberofHoursServedArray.Length > index
                                                    ? numberofHoursServedArray[index]
                                                    : (double?) null,
                                            NumberofParticipatingFaculty =
                                                numberofParticipatingFacultyArray != null &&
                                                numberofParticipatingFacultyArray.Length > index
                                                    ? numberofParticipatingFacultyArray[index]
                                                    : (int?) null,
                                            NumberofFacultyHoursServed =
                                                numberofFacultyHoursServedArray != null &&
                                                numberofFacultyHoursServedArray.Length > index
                                                    ? numberofFacultyHoursServedArray[index]
                                                    : (double?) null,
                                            NumberofParticipatingStaff =
                                                numberofParticipatingStaffArray != null &&
                                                numberofParticipatingStaffArray.Length > index
                                                    ? numberofParticipatingStaffArray[index]
                                                    : (int?) null,
                                            NumberofStaffHoursServed =
                                                numberofStaffHoursServedArray != null &&
                                                numberofStaffHoursServedArray.Length > index
                                                    ? numberofStaffHoursServedArray[index]
                                                    : (double?) null
                                        };
                                });
                }
                #endregion
                if (ProjectFactory.SaveToDb(model, project2Categories,project2CommunityPartners,project2IndividualPartners,project2Types) > 0)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["IsFrontEnd"]))
                    {
                        return RedirectToAction("Index", "Project", new {area = "", id = model.ProjectUniqueUrl});
                    }
                    return RedirectToAction("List");
                }

                ModelState.AddModelError("Name", "Failed to save project information, please contact the administrator!");
            }
            ViewBag.ProjectTypes = ProjectTypeFactory.CreateList().OrderBy(t => t.OrderByID);
            ViewBag.CagegoryNodes = CategoryFactory.BuildRootCategoryNodes();
            return View(model);
        }
        public ActionResult Edit(int ID)
        {
            var project = ProjectFactory.Create(ID);
            
            ViewBag.CagegoryNodes = CategoryFactory.BuildRootCategoryNodes(project.Project2Categories);
            var typeArray = ProjectTypeFactory.CreateList().OrderBy(t => t.OrderByID).ToArray();
            for (int i = 0; i < typeArray.Length; i++)
            {
                var project2Type = project.Project2Types.FirstOrDefault(p2t => p2t.ProjectTypeID == typeArray[i].ID);
                if (project2Type == null) continue;
                typeArray[i].IsChecked = true;

                typeArray[i].NumberofHoursServed = project2Type.NumberofHoursServed;
                typeArray[i].NumberofParticipatingTargets = project2Type.NumberofParticipatingTargets;

                typeArray[i].NumberofParticipatingFaculty = project2Type.NumberofParticipatingFaculty;
                typeArray[i].NumberofFacultyHoursServed = project2Type.NumberofFacultyHoursServed;
                typeArray[i].NumberofParticipatingStaff = project2Type.NumberofParticipatingStaff;
                typeArray[i].NumberofStaffHoursServed = project2Type.NumberofStaffHoursServed;

            }
            ViewBag.ProjectTypes = typeArray;
            return View("Add",project);
        }
        public ActionResult Delete(int ID)
        {
            ProjectFactory.Delete(ID);
            if (!string.IsNullOrEmpty(Request.QueryString["IsFrontEnd"]))
            {
                return RedirectToAction("List", "Project", new {area = ""});
            }
            return RedirectToAction("List");
        }
        public ActionResult List(int page = 1)
        {
            return View(ProjectFactory.CreateList(page, 50,new ProjectCollectionSettings(){IsShowCreatorEditor=true}));
        }
    }
}
