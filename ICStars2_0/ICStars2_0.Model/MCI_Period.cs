using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
    [Table("MCI_Period", Schema = Const.Schema)]
    public class MCI_Period
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [Remote("ValidateFromDate","MCI",AdditionalFields="ID")]
        public DateTime FromDate { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [Remote("ValidateToDate", "MCI", AdditionalFields = "ID")]
        public DateTime ToDate { get; set; }
    }
    //[NotMapped]
    //[MetadataType(typeof(MCI_PeriodMetaDataForUpdate))]
    //public class MCI_PeriodForUpdate : MCI_Period
    //{

    //}


    //public class MCI_PeriodMetaDataForUpdate
    //{
    //    [Required]
    //    [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
    //    [Remote("ValidatePeriod", "MCI")]
    //    public DateTime FromDate { get; set; }
    //    [Required]
    //    [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
    //    [Remote("ValidatePeriod", "MCI")]
    //    public DateTime ToDate { get; set; }
    //}
}
