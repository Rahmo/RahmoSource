using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;
using System.Text;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
{
    public enum CalendarEventType
    {
        None=0,
        Van=1,
        RoomLl106=2,
        Room101=3,
        SteansEvent=4
    }
    [Serializable]
    [Table("CalendarEvent", Schema = Const.Schema)]
    public class CalendarEvent
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int UserID { get; set; }
        public bool IsApproved { get; set; }
        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        public string Title { get; set; }
        public bool Allday { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string Url { get; set; }

        [MaxLength(100)]
        [StringLength(100)]
        public string ClassName { get; set; }
        public bool Editable { get; set; }
        public bool StartEditable { get; set; }
        public bool DurationEditable { get; set; }

        [MaxLength(50)]
        [StringLength(50)]
        public string Color { get; set; }
        [MaxLength(50)]
        [StringLength(50)]
        public string BackgroundColor { get; set; }
        [MaxLength(50)]
        [StringLength(50)]
        public string BorderColor { get; set; }
        [MaxLength(50)]
        [StringLength(50)]
        public string TextColor { get; set; }
        [Display(Name="Resources")]
        public int EventType { get; set; }
        [NotMapped]
        public CalendarEventType EventTypeEnum
        {
            get { return (CalendarEventType)EventType; }
            set { EventType = (int)value; }
        }
        [DataType(DataType.MultilineText)]
        [MaxLength(1000)]
        [StringLength(1000)]
        public string Notes { get; set; }

        [DataType(DataType.MultilineText)]
        [MaxLength(1000)]
        [StringLength(1000)]
        [Display(Name = "Authorized Driver Information")]
        public string DriverInfo { get; set; }
        [DataType(DataType.MultilineText)]
        [MaxLength(1000)]
        [StringLength(1000)]
        [Display(Name = "Authorized event Information")]
        public string EventInfo { get; set; }
        public virtual CalendarEventRepeatSettings CalendarEventRepeatSettings { get; set; }

        #region =Owner=
        [NotMapped]
        public string OwnerFirstName { get; set; }
        [NotMapped]
        public string OwnerLastName { get; set; }
        [NotMapped]
        public string OwnerCampusConnectID { get; set; }
        #endregion
        [NotMapped]
        public int OriginalID { get; set; }      
        public CalendarEvent() { }

        public CalendarEvent(CalendarEventAdapter adapter)
        {
            ID = adapter.ID;
            Title = adapter.Title;
            EventType = adapter.EventType;
            Start = Convert.ToDateTime(string.Format("{0} {1}", adapter.StartDate, adapter.StartTime));
            End = Convert.ToDateTime(string.Format("{0} {1}", adapter.StartDate, adapter.EndTime));
            Notes = adapter.Notes;
            DriverInfo = string.Join("|$#$|",
                new[] {adapter.DriverName, adapter.DriverPhone, adapter.DriverDPUID, adapter.DriverNotes});
            EventInfo = string.Join("|$#$|",
                new[] {adapter.Sponsor, adapter.Location});
        }
    }
}
