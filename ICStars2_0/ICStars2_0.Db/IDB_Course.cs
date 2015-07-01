using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{

    public interface IDB_Course
    {
        int Count(CourseCollectionSettings settings);
        DataTable List(int pageIndex, int pageSize,CourseCollectionSettings settings);
        DataRow CourseInfo(int ID);
        int Add(Course course);
        int Update(Course course);
        int UpdateInstructorName(int id, string instructorName);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
