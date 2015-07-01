﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
    [Table("Article", Schema = Const.Schema)]
    public class Article
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        public string Title { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string ShortTitle { get; set; }
        [Required]
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string Content { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        [DataType(DataType.MultilineText)]
        public string Brief { get; set; }

        [MaxLength(100)]
        [StringLength(100)]
        public string Author { get; set; }

        [MaxLength(500)]
        [StringLength(500)]
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string Thumbnail { get; set; }
        [Required]
        public DateTime PublishDate { get; set; }

        public DateTime CreateDate { get; set; }
        public DateTime? EventDate { get; set; }

        public string CommunitySite { get; set; }

        public bool IsVisible { get; set; }

        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        [RegularExpression("^[a-zA-z0-9_-]+$",ErrorMessage="Only letters, numbers, \"-\" and \"_\" are allowed!")]
        [Remote("ValidateUrlTitle","Article")]
        public string UrlTitle { get; set; }
        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        public string Layout { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string Keywords { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string RedirectUrl { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string Redirect301Url { get; set; }
        [NotMapped]
        public string CategoryName { get; set; }
        public Article()
        {
            CreateDate = DateTime.Now;
            Layout = "~/Views/Shared/_Layout2.cshtml";
        }

      
    }
    [NotMapped]
    [MetadataType(typeof(ArticleMetaDataForUpdate))]
    public class ArticleForUpdate:Article
    {
        
    }


    public class ArticleMetaDataForUpdate
    {
        [HiddenInput(DisplayValue=true)]
        public string UrlTitle { get; set; }
    }
  
}
