using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using DataAnnotationsExtensions;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Model
{

    [Table("Member", Schema = Const.Schema)]
    [DbTable(Name="Member")]
    public abstract class BaseMember
    {

        #region = Properties =

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        
        [DbField(Size = 100)]
        public string CampusConnectID { get; set; }

        /// <summary>
        /// false:unavailable, true:available
        /// </summary>
        public bool Status { get; set; }

        [DbField(Size = 200)]
        [Required]
        public string Email { get; set; }

        [DbField(Size = 200)]
        public string IP { get; set; }

        [DbField(Size = 50)]
        public string Phone { get; set; }

        [DbField(Size = 100)]
        public string OfficeHours { get; set; }

        [DbField(Size = 50)]
        [Required]
        public string FirstName { get; set; }

        [DbField(Size = 50)]
        [Required]
        public string LastName { get; set; }

        [DbField(Size = 50)]
        public string EmplID { get; set; }

        [DbField(Size = 200)]
        [StringLength(200, MinimumLength = 2)]
        public string Department { get; set; }

        [DbField(Size = 200)]
        [StringLength(200, MinimumLength = 2)]
        public string Location { get; set; }

        [DbField(Size = 200)]
        [StringLength(200, MinimumLength = 2)]
        public string JobTitle { get; set; }

        [DbField(Size = 50)]
        public string OfficePhone { get; set; }

        [DbField(Size = 50)]
        public string Fax { get; set; }

        [DbField(Size = 50)]
        [StringLength(50, MinimumLength = 2)]
        public string SupervisorFirstName { get; set; }

        [DbField(Size = 50)]
        [StringLength(50, MinimumLength = 2)]
        public string SupervisorLastName { get; set; }

        [DbField(Size = 200)]
        [StringLength(200,MinimumLength=2)]
        [DataType(DataType.EmailAddress)]
        public string SupervisorEmail { get; set; }

        public DateTime RegisterDate { get; set; }

        public DateTime LastLoginDate { get; set; }










       

        #endregion

        
        
    }

    public class Member : BaseMember
    {
        #region = Constructor =

        public Member()
        {
            RegisterDate = DateTime.Now;
        }


        #endregion
    }

    [MetadataType(typeof(RegisterMetaData))]
    public class MemberForRegister : BaseMember
    {
        public string CampusConnectPassword { get; set; }
        #region = Constructor =

        public MemberForRegister()
        {
            RegisterDate = DateTime.Now;
        }


        #endregion
    }

    public class MemberForEdit : BaseMember
    {
    }
    public class RegisterMetaData
    {
        [Required]
        [Remote("ValidateCCID", "Register")]
        [StringLength(50, MinimumLength = 2)]
        public string CampusConnectID { get; set; }
        [Required]
        [DataType(DataType.Password)]
        [StringLength(50, MinimumLength = 6)]
        public string CampusConnectPassword { get; set; }
        [Digits]
        [Required]
        [StringLength(10, MinimumLength = 2)]
        [Remote("ValidateEmplId", "Register", AdditionalFields = "CampusConnectID,CampusConnectPassword")]
        public string EmplID { get; set; }
        [Required]
        [StringLength(50,MinimumLength=2)]
        [DbField(Size = 50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 2)]
        [DbField(Size = 50)]
        public string LastName { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        [StringLength(200, MinimumLength = 2)]
        [DbField(Size = 200)]
        public string Email { get; set; }

    }
   
    
}
