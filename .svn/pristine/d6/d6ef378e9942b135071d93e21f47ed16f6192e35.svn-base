using System;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0
{
    public partial class TestEmail : System.Web.UI.Page
    {
        private ISteansSettingsFactory _factory;
        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get { return _factory; }
            set { _factory = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            //MailMessage m_message = new MailMessage();

            ////m_message.From = new MailAddress("reminder.dpu@gmail.com");

            //m_message.To.Add(new MailAddress("lihui_830501@163.com"));

            //m_message.Subject = "You got a new community internship application!";

            //m_message.Body = "You got a new community internship application! Please check it.";

            //SmtpClient m_smtpClient = new SmtpClient();
            //m_smtpClient.EnableSsl = true;
            //m_smtpClient.Send(m_message);
            //try
            //{
            //    int i = Convert.ToInt32("df");

            //}
            //catch(Exception exp)
            //{
            //    Log4NetHelper.WriteLog(exp);
            //}
            //Log4NetHelper.WriteLog(new Exception("test error"));

            CommunityInternshipSettings settings =
                SteansSettingsFactory.CreateBaseSetings<CommunityInternshipSettings>();
            EmailService.SendEmail("", settings.ReceiverEmail, settings.EmailTitle, settings.EmailBody,true);
        }
    }

}