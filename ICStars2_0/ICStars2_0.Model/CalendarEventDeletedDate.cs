﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("CalendarEventDeletedDates", Schema = "dbo")]
    public class CalendarEventDeletedDate
    {
        [Key, Column(Order = 1)]
        public DateTime DeletedDate { get; set; }
        [Key, Column(Order = 2)]
        public int CalendarEventID { get; set; }
    }
}
