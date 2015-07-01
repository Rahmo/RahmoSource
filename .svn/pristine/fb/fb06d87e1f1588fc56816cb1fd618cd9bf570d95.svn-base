using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
{

    
    
    #region = EventRequestForm =

    public class EventRequestForm
    {

        #region = Properties =

        public int ID { get; set; }

        [DbField(Size = 50)]
        public string ContactName { get; set; }

        [DbField(Size = 250)]
        public string SupervisorEmail { get; set; }

        [DbField(Size = 100)]
        public string Program { get; set; }

        public DateTime EventDate { get; set; }

        [DbField(Size = 100)]
        public string EventTime { get; set; }

        [DbField(Size = 100)]
        public string EventTitle { get; set; }

        [DbField(Size = 100)]
        public string EventLocation { get; set; }

        public int NumberOfAttendees { get; set; }

        [DbField(Size = 2147483647)]
        public string ChartwellsItems { get; set; }

        [DbField(Size = 1000)]
        public string ChartwellsNotes { get; set; }

        [DbField(Size = 2147483647)]
        public string StaplesItems { get; set; }

        [DbField(Size = 1000)]
        public string StaplesNotes { get; set; }

        [DbField(Size = 50)]
        public string PhotographerRequired { get; set; }

        public DateTime PhotographerRequiredDate { get; set; }

        [DbField(Size = 100)]
        public string PhotographerRequiredTime { get; set; }

        [DbField(Size = 100)]
        public string PhotographerRequiredLocation { get; set; }

        public DateTime DistributionServicesCopiesNeededBy { get; set; }

        public int DistributionServicesColorCopies { get; set; }

        public int DistributionServicesBWCopies { get; set; }

        [DbField(Size = 100)]
        public string DistributionServicesPaperSidedType { get; set; }

        [DbField(Size = 50)]
        public string DistributionServicesPaperQuality { get; set; }

        public DateTime RequestDate { get; set; }

        public EventRequestFormStatus Status { get; set; }
        #endregion
        public EventRequestForm()
        {
            RequestDate = DateTime.Now;
            PhotographerRequired = string.Empty;
            DistributionServicesPaperSidedType = string.Empty;
        }
    }

    #endregion

    
   
            
}
