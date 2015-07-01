using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Xml.Serialization;

namespace Commengdpu.BusinessLayer.Settings.Models
{
    public abstract class BasePageSettings
    {
        [AllowHtml]
        [DataType(DataType.MultilineText)]
        public string Content { get; set; }

        public string Keywords { get; set; }
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
        public string[] ContentHistory { get; set; }

        public string LastEditor { get; set; }
        public DateTime LastModifyDate { get; set; }
    }
}
