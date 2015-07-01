using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{
    public interface IDB_Student
    {
        DataTable ReportList(StudentReportCollectionSettings settings);
        int Count(StudentCollectionSettings settings);
        DataTable List(int pageIndex, int pageSize,StudentCollectionSettings settings);
        DataRow StudentInfo(int ID);
        DataRow StudentInfo(string dpu_id,int courseId);
        int Add(Student student);
        int Update(Student student);
        int UpdateLastUpdateTime(int ID);
        int UpdateServedHours(ServiceHours serviceHours);
        int Delete(int ID);
        int ConvertToCSSP(int ID);
        bool Exists(int ID);
        bool Exist(int courseId, string dpuId);
        bool Exist(int studentId, int courseId, string dpuId);
        bool ExistDPUID(string dpuId);
    }
}
