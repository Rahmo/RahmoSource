using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;
using ICStars2_0.BusinessLayer.GeoServices;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    #region =StudentFactory=
    internal class StudentFactory : IStudentFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_Student DB_Student { get; set; }
        [Dependency]
        public IStudent2CBOFactory Student2CBOFactory { get; set; }
        [Dependency]
        public IStudent2ProgramFactory Student2ProgramFactory { get; set; }
        [Dependency]
        public ICBOFactory CBOFactory { get; set; }

        public IStudentCollection CreateEmptyStudentCollection()
        {
            return CreateStudentCollection(0, 0);
        }

        public IStudentReportCollection CreateStudentReportCollection(StudentReportCollectionSettings settings)
        {
            var i = ICStarsUnityContainer.Current.Resolve<StudentReportCollection>();
            i.Settings = settings;
            return i;
        }

        public IStudentCollection CreateStudentCollection(int pageIndex, int pageSize,StudentCollectionSettings settings)
        {
            var i = ICStarsUnityContainer.Current.Resolve<StudentCollection>();
       
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            i.Settings = settings;
            
            if(settings.IsInitalize)
            {
                i.Initalize();
            }
            return i;
        }

        public IStudentCollection CreateStudentCollection(int pageIndex, int pageSize)
        {
            return CreateStudentCollection(pageIndex, pageSize, null);
        }

        public Student Create(int id)
        {
            Student m = new Student();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_Student.StudentInfo(id), m);
            }
            m.Student2CBOList = Student2CBOFactory.CreateStudent2CBOCollection(id);
            return m;
        }

        public Student Create(string dpu_id,int courseId)
        {
            Student m = new Student();
            if (!string.IsNullOrEmpty(dpu_id) && courseId>0)
            {
                ReflectionHelper.Fill(DB_Student.StudentInfo(dpu_id,courseId), m);
            }
            m.Student2CBOList = Student2CBOFactory.CreateStudent2CBOCollection(m.ID);
            return m;
        }

        public Student Update(Student m)
        {
            if (m.ID > 0)
            {
                //update student information
                DB_Student.Update(m);
                if (m.Student2ProgramList != null)
                {
                    #region =Update Student2Program=
                    //get all programs related to this student
                    var oldS2pList = Student2ProgramFactory.CreateList(m.ID);
                    //identify programs needed to be deleted
                    var s2plistForDelete =
                        oldS2pList.Where(
                            s2p =>
                                m.Student2ProgramList.All(cur => cur.ProgramID != s2p.ProgramID));
                    //Identify programs needed to be updated
                    //Identify programs needed to be added
                    var s2pListForAdd = m.Student2ProgramList.Where(s2p => oldS2pList.All(
                        old => old.ProgramID != s2p.ProgramID));
                    foreach (var s2p in s2plistForDelete)
                    {
                        Student2ProgramFactory.Delete(s2p);
                    }
                    foreach (var s2p in s2pListForAdd)
                    {
                        s2p.StudentID = m.ID;
                        Student2ProgramFactory.Add(s2p);
                    }

                    //no need to update because table Student2PRogram only has premary key "StudentID, ProgramID"
                    //var s2pListForUpdate = m.Student2ProgramList.Where(s2p => oldS2pList.Any(
                    //    old => old.ProgramID == s2p.ProgramID));
                    //foreach (var s2p in s2pListForUpdate)
                    //{
                    //    Student2ProgramFactory.Update(s2p);
                    //}

                    #endregion
                }
                if (m.Student2CBOList == null) return m;
                #region =Update Student2CBO=
                //get all CBOs related to this student
                var oldS2CCollection = Student2CBOFactory.CreateStudent2CBOCollection(m.ID);
                //identify CBOs needed to be deleted
                var listForDelete =
                    oldS2CCollection.Where(
                        s2c =>
                            !m.Student2CBOList.Any(
                                cur => cur.CBOID == s2c.CBOID && cur.Quater_Year.Equals(s2c.Quater_Year)));
                //Identify CBOs needed to be updated
                var listForUpdate = m.Student2CBOList.Where(s2c => oldS2CCollection.Any(
                    old => old.CBOID == s2c.CBOID && old.Quater_Year.Equals(s2c.Quater_Year)));
                //Identify CBOs needed to be added
                var listForAdd = m.Student2CBOList.Where(s2c => !oldS2CCollection.Any(
                    old => old.CBOID == s2c.CBOID && old.Quater_Year.Equals(s2c.Quater_Year)));
                foreach (var student2Cbo in listForDelete)
                {
                    Student2CBOFactory.Delete(student2Cbo.StudentID, student2Cbo.CBOID, student2Cbo.Quater_Year);
                }
                foreach (var student2Cbo in listForAdd)
                {
                    Student2CBOFactory.Add(student2Cbo);
                }
                foreach (Student2CBO student2Cbo in listForUpdate)
                {
                    Student2CBOFactory.Update(student2Cbo);
                }

                #endregion

                #region =Update ServiceHours Status=

                foreach (var sh in m.Student2CBOList.Select(student2Cbo => new ServiceHours()
                {
                    StudentID = student2Cbo.StudentID,
                    CBO_ID = student2Cbo.CBOID,
                    CourseID = m.CourseID,
                    Quater_Year = student2Cbo.Quater_Year
                }))
                {
                    //For each site of a student, update total served hours number
                    UpdateServedHours(sh);
                }
                #endregion
            }
            else
            {
                //Insert student information into database
                m.ID = DB_Student.Add(m);
                if (m.ID > 0 && m.Student2CBOList != null)
                {
                    //insert each site information of this student into the databse
                    foreach (var s2c in m.Student2CBOList)
                    {
                        s2c.StudentID = m.ID;
                        Student2CBOFactory.Add(s2c);
                    }
                }
                if (m.ID > 0 && m.Student2ProgramList != null)
                {
                    foreach (var item in m.Student2ProgramList)
                    {
                        item.StudentID = m.ID;
                        Student2ProgramFactory.Add(item);
                    }
                }
            }
            return m;
        }

        public int UpdateLastUpdateTime(int ID)
        {
            return DB_Student.UpdateLastUpdateTime(ID);
        }

        public int UpdateServedHours(ServiceHours serviceHours)
        {
            return DB_Student.UpdateServedHours(serviceHours);
        }

        public int Delete(int ID)
        {
            var i= DB_Student.Delete(ID);
            if(i>0)
            {
                Student2CBOFactory.DeleteByStudentId(ID);
            }
            return i;
        }
        public int ConvertToCSSP(int ID)
        {
            return DB_Student.ConvertToCSSP(ID);
        }
        public bool Exists(int ID)
        {
            return DB_Student.Exists(ID);
        }

        public bool Exist(int courseId, string dpuId)
        {
            return DB_Student.Exist(courseId, dpuId);
        }

        public bool Exist(int studentId, int courseId, string dpuId)
        {
            if(studentId==0)
            {
                return DB_Student.Exist(courseId, dpuId);
            }
            //if edit a student, and if courseId and dpuId are not changed, then skip checking
            if( DB_Student.Exist(studentId,courseId, dpuId)) return false;


            return DB_Student.Exist(courseId, dpuId);
        }

        public bool ExistDPUID(string dpuId)
        {
            return DB_Student.ExistDPUID(dpuId);
        }
    }
    #endregion
}
