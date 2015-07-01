using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
    [Table("WebPage", Schema = Const.Schema)]
    public class WebPage
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        [Remote("ValidateUrl","WebPage")]
        public string Url { get; set; }

        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        public string Title { get; set; }


        [Required]
        [AllowHtml]
        [DataType(DataType.MultilineText)]
        public string Content { get; set; }
        [StringLength(155)]
        [MaxLength(155)]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
        [MaxLength(155)]
        [StringLength(155)]
        public string Keywords { get; set; }
        public DateTime CreateDate { get; set; }
        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        public string Layout { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string RedirectUrl { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string Redirect301Url { get; set; }
        public WebPage()
        {
            CreateDate = DateTime.Now;
            Layout = "~/Views/Shared/_Layout2.cshtml";
        }
    }
}
