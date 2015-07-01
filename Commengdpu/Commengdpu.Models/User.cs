using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("User", Schema = Const.Schema)]
    public class User
    {

        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [StringLength(100)]
        [MaxLength(100)]
        [Required]
        public string UserName { get; set; }
        [StringLength(50)]
        [MaxLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string LastName { get; set; }
        [StringLength(15)]
        [MaxLength(15)]
        public string DPUID { get; set; }
        [DisplayName("Is Activated?")]
        public bool IsActivated { get; set; }

        [StringLength(200)]
        [MaxLength(200)]
        public string Email { get; set; }

        public DateTime? CreateDate { get; set; }
        public DateTime? LastLoginDate { get; set; }
        public string LastLoginIP { get; set; }
        public virtual ICollection<User2Role> User2Roles { get; set; }
        public User()
        {
            CreateDate = DateTime.Now;
        }
    }
}
