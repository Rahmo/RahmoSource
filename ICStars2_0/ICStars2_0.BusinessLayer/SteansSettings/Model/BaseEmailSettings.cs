﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace ICStars2_0.BusinessLayer.SteansSettings.Model
{
    public abstract class BaseEmailSettings
    {
        public string ReceiverEmail { get; set; }
        public string RecieverEmailEvents { get; set; }
        public string EmailTitle { get; set; }
        [DataType(DataType.MultilineText)]
        public string EmailBody { get; set; }
        public bool IsHtmlEmail { get; set; }
        public bool IsSendingEmail { get; set; }
    }
}
