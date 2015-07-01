using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.StudentServices
{

    public interface IStudentFactory
    {
        IStudentCollection CreateEmptyStudentCollection();
        IStudentReportCollection CreateStudentReportCollection(StudentReportCollectionSettings settings);
        IStudentCollection CreateStudentCollection
            (int pageIndex, int pageSize, StudentCollectionSettings settings);

        IStudentCollection CreateStudentCollection(int pageIndex, int pageSize);
        Student Create(int id);
        Student Create(string dpu_id,int courseId);
        Student Update(Student m);
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
