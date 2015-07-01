using System.ComponentModel.DataAnnotations;

namespace ICStars2_0.BusinessLayer.SteansSettings.Model
{
    public interface IEmailSettings:ISettings
    {
        string ReceiverEmail { get; set; }
        string EmailTitle { get; set; }
        [DataType(DataType.MultilineText)]
        string EmailBody { get; set; }
        bool IsHtmlEmail { get; set; }
        bool IsSendingEmail { get; set; }
        
    }
}