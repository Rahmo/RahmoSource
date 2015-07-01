using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.CourseServices
{
    public interface ICourseFactory
    {
        IEnumerable<SelectListItem> BuildCourseSeleteListItems(int seletedCourseID,CourseCollectionSettings settings);
        IEnumerable<SelectListItem> BuildCourseSeleteListItems(int seletedCourseID);
        /// <summary>
        /// Build course list for current quarter
        /// </summary>
        /// <returns></returns>
        IEnumerable<SelectListItem> BuildCourseSeleteListItems();
        ICourseCollection CreateCourseCollection(int pageIndex, int pageSize);
        ICourseCollection CreateCourseCollection(int pageIndex, int pageSize, CourseCollectionSettings settings);
        Course Create(int id);
        Course Update(Course m);
        int UpdateInstructorName(int id, string instructorName);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
