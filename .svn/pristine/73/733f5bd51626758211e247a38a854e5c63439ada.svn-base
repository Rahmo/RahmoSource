using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;


namespace ICStars2_0.Model
{
     [Table("Storyboards", Schema = Const.Schema)]
   public class Storyboard
    {
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get;  set; }
    [MaxLength(500)]
    [StringLength(500)]
    [DataType(DataType.MultilineText)]
    [AllowHtml]
       public string Thumbnail { get; set; }
       public DateTime PublishDate { get; set; }
       public string Title { get; set; }
       [Required]
       [DataType(DataType.MultilineText)]
       [AllowHtml]
       public string  StoryContent { get; set; }
    }
}
