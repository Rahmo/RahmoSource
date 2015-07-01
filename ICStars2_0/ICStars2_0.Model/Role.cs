using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
{

    #region = Role =

    [Table("Role", Schema = Const.Schema)]
    public class Role
    {

        #region = Properties =

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [DbField(Size = 100)]
        public string Name { get; set; }
        public string RoleType { get; set; }
        [NotMapped]
        public RoleType RoleEnumType
        {
            get { return string.IsNullOrEmpty(RoleType)?Enum.RoleType.Role: (RoleType) System.Enum.Parse(typeof (RoleType), RoleType); }
            set { RoleType = value.ToString(); }
        }

        #endregion

        
        
    }

    #endregion
            
}
