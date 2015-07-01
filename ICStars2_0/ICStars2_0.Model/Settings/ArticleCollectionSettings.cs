﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model.Settings
{
    public class ArticleCollectionSettings
    {
        public int? CategoryID { get; set; }
        public string CategoryName { get; set; }
        public bool? IsVisible { get; set; }
        public DateTime? PublishDate { get; set; }
        public DateTime? EventDate { get; set; }
    }
}
