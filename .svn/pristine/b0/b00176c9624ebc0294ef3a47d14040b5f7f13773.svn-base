using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ICStars2_0.Model
{
    public class ImageGallery
    {
        public ImageGallery()
        {
            ImageList = new List<string>();
        }
         [Key]
        public Guid ID { get; set; }
        public string Name { get; set; }
        public string Caption { get; set; }
        public string ImagePath { get; set; }
        public List<string> ImageList { get; set; }
    }
}