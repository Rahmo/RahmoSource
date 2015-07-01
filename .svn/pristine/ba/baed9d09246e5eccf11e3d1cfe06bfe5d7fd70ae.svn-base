using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("Role", Schema = Const.Schema)]
    public class Role
    {

        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [StringLength(100)]
        [MaxLength(100)]
        [Required]
        public string RoleName { get; set; }
        [StringLength(100)]
        [MaxLength(100)]
        public string Description { get; set; }
        [StringLength(100)]
        [MaxLength(100)]
        public string NickName { get; set; }
        public int? CreatorUserID { get; set; }
        public DateTime? CreateDate { get; set; }

        public virtual ICollection<User2Role> User2Roles { get; set; }

        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public bool IsChecked { get; set; }
        public Role()
        {
            CreateDate = DateTime.Now;
        }
    }
}
