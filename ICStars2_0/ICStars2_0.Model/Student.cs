using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
{







    #region = Student =

    [Table("Student", Schema = Const.Schema)]
    public class Student
    {

        #region = properties =


        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [DbField]
        public int ID { get; set; }

        [DbField]
        public int CourseID { get; set; }


        [DbField(Size = 100)]
        public string Staff { get; set; }

        [DbField(Size = 100)]
        public string SLC { get; set; }

        [DbField]
        public DateTime? CreateDate { get; set; }


        [DbField(Size = 1000)]
        public string AvailableDateTime { get; set; }

        [DbField(Size = 50)]
        public string FirstName { get; set; }

        [DbField(Size = 50)]
        public string LastName { get; set; }

        [DbField(Size = 50)]
        public string DPU_ID { get; set; }

        [DbField(Size = 200)]
        public string Email { get; set; }

        [DbField(Size = 50)]
        public string PrimaryPhone { get; set; }

        [DbField(Size = 50)]
        public string AlternatePhone { get; set; }

        [DbField(Size = 50)]
        public string ReachMethod { get; set; }

        [DbField(Size = 50)]
        public string Gender { get; set; }

        [DbField(Size = 250)]
        public string PermanentAddress { get; set; }

        [DbField(Size = 50)]
        public string City { get; set; }

        [DbField(Size = 50)]
        public string State { get; set; }

        [DbField(Size = 50)]
        public string ZipCode { get; set; }

        [DbField(Size = 200)]
        public string Name_Of_Emergency_Contact { get; set; }

        [DbField(Size = 200)]
        public string TelephoneNumber { get; set; }

        [DbField(Size = 200)]
        public string School { get; set; }

        [DbField(Size = 200)]
        public string Major { get; set; }

        [DbField]
        public DateTime? Expected_Graduation_Date { get; set; }

        [DbField(Size = 200)]
        public string ClassStanding { get; set; }

        [DbField(Size = 50)]
        public string CommunityServiceStudies { get; set; }

        [DbField(Size = 500)]
        public string I_have_taken_Service_Learning_Course { get; set; }

        [DbField]
        public bool? I_would_like_to_add_my_email_to_Steans_Center_listserv { get; set; }



        [DbField]
        public DateTime LastUpdateTime { get; set; }

        [DbField]
        public bool? IsProject { get; set; }

        [DbField(Size = 50)]
        public string Orientation { get; set; }
        
        [NotMapped]
        public StudentType StudentType
        {
            get { return (StudentType)Type; }
            set { Type = (int)value; }
        }
        [DbField]
        public int Type { get; set; }

        /// <summary>
        /// For Entity Framwork
        /// </summary>
        public virtual ICollection<Student2Program> Student2Programs { get; set; }
        /// <summary>
        /// For Entity Framwork
        /// </summary>
        public virtual ICollection<Student2CBO> Student2Cbos { get; set; }
        /// <summary>
        /// For Entity Framwork
        /// </summary>
        public virtual Course Course { get; set; }
        #region =CBO=

        [NotMapped]
        public int CBOID { get; set; }

        [NotMapped]
        public string CBOName { get; set; }

        #endregion

        #region =Course=

        [NotMapped]
        public string CourseSubject { get; set; }

        [NotMapped]
        public string CourseCatalogNumber { get; set; }

        [NotMapped]
        public string CourseInstructorName { get; set; }

        [NotMapped]
        public string CourseTerm { get; set; }

        [NotMapped]
        public string CourseSection { get; set; }

        [NotMapped]
        public string CourseFullName
        {
            get
            {
                return string.Format("{3} {0}--{1}--{4}--{2}", CourseSubject, CourseCatalogNumber, CourseInstructorName,
                                     CourseTerm, CourseSection);
            }
        }

        #endregion

        #region =Student2CBO=

        [NotMapped]
        public float RequiredServeHours { get; set; }

        [NotMapped]
        public float ServedHours { get; set; }

        [NotMapped]
        public string Quater_Year { get; set; }

        /// <summary>
        /// Updating Student2CBO when adding or editing a student
        /// </summary>
        [NotMapped]
        public IEnumerable<Student2CBO> Student2CBOList { get; set; }

        #endregion

        #region =Student2Program=
        /// <summary>
        /// Updating Student2Program when adding or editing a student
        /// </summary>
        [NotMapped]
        public IEnumerable<Student2Program> Student2ProgramList { get; set; }
        #endregion
        #endregion

        public Student()
        {
            CreateDate = DateTime.Now;
            LastUpdateTime = DateTime.Now;
            Gender = string.Empty;
            Staff = string.Empty;
            SLC = string.Empty;
            StudentType = StudentType.Placement;
            CommunityServiceStudies = string.Empty;
            I_have_taken_Service_Learning_Course = string.Empty;
        }
    }

    #endregion






}
