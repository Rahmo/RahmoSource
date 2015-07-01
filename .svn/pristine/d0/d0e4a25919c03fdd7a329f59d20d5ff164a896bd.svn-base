using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Threading;
using System.Web.Mail;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using MailMessage = System.Net.Mail.MailMessage;

namespace ICStars2_0.BusinessLayer
{
    class GmailSmtpClient:SmtpClient
    {
        public string From { get; set; }
        public GmailSmtpClient()
        {
            base.Host = "smtp.gmail.com";
            From = "reminder.dpu@gmail.com";
            base.EnableSsl = true;
            base.UseDefaultCredentials = false;
            base.Port = 587;
            base.Credentials = new NetworkCredential("reminder.dpu@gmail.com", "dpu@2012");
        }
    }
    public class EmailService
    {
        public static log4net.ILog Logger = log4net.LogManager.GetLogger(typeof(EmailService));
        #region = From =

        private string _from;

        public string From
        {
            get { return _from; }
            set { _from = value; }
        }

        #endregion
        #region = To =

        private string _to;

        public string To
        {
            get { return _to; }
            set { _to = value; }
        }

        #endregion
        #region = Subject =

        private string _subject;

        public string Subject
        {
            get { return _subject; }
            set { _subject = value; }
        }

        #endregion
        #region = Body =

        private string _body;

        public string Body
        {
            get { return _body; }
            set { _body = value; }
        }

        #endregion

        public Attachment[] Attachments { get; set; }
        public AlternateView[] AlternateViews { get; set; }
        public SmtpClient CurrentSmtpClient { get; set; }
        public bool IsHtml { get; set; }
        public EmailService(string from, string to, string subject, string body, bool isHtml, Attachment[] attachments,AlternateView[] alternateViews)
        {
            _from = from;
            _to = to;
            _subject = subject;
            _body = body;
            IsHtml = isHtml;
            Attachments = attachments;
            AlternateViews = alternateViews;
        }
        public EmailService(string from, string to, string subject, string body, bool isHtml, Attachment[] attachments)
        {
            _from = from;
            _to = to;
            _subject = subject;
            _body = body;
            IsHtml = isHtml;
            Attachments = attachments;
        }
        public EmailService(string from, string to, string subject, string body, bool isHtml)
        {
            _from = from;
            _to = to;
            _subject = subject;
            _body = body;
            IsHtml = isHtml;
        }
        public EmailService(string from, string to, string subject, string body)
        {
            _from = from;
            _to = to;
            _subject = subject;
            _body = body;
        }
        public void Send()
        {
            MailMessage m_message = new MailMessage();
            try
            {

                if (!string.IsNullOrEmpty(this.From))
                {
                    m_message.From = new MailAddress(From);
                }

                string[] emailList = To.Split(',');
                foreach (string email in emailList)
                {
                    if (string.IsNullOrEmpty(email)) continue;
                    m_message.To.Add(new MailAddress(email));
                }

                m_message.Subject = Subject;
                if (Attachments != null)
                {
                    foreach (var attachment in Attachments)
                    {
                        m_message.Attachments.Add(attachment);
                    }
                }
                m_message.Body = Body;
                m_message.IsBodyHtml = IsHtml;
                if (AlternateViews != null)
                {
                    foreach (var alternateView in AlternateViews)
                    {
                        m_message.AlternateViews.Add(alternateView);
                    }
                }
                SmtpClient m_smtpClient = CurrentSmtpClient ?? new SmtpClient();
                m_smtpClient.Send(m_message);
            }
            catch (Exception exp)
            {
#if DEBUG
                throw;
#endif
                Logger.Error(
                string.Format(
                    "Errors occured during sending an email! \r\nMessage:{0}\r\nSource:{1}",
                    exp.Message,
                    exp.StackTrace), null);
            }
            finally
            {
                m_message.Dispose();
            }
        }

        public static void SendEmail(string from, IEmailSettings settings)
        {
            EmailService es = new EmailService(from, settings.ReceiverEmail, settings.EmailTitle, settings.EmailBody, settings.IsHtmlEmail);
            new Thread(new ThreadStart(es.Send)).Start();
        }
        public static void SendEmail(string from, string to, string subject, string body, bool isHtml, Attachment[] attachments,AlternateView[] alternateViews)
        {
            EmailService es = new EmailService(from, to, subject, body, isHtml, attachments,alternateViews);
            new Thread(new ThreadStart(es.Send)).Start();
        }

        public static void SendEmailByGmailSmtp(string to, string subject, string body, bool isHtml, Attachment[] attachments, AlternateView[] alternateViews)
        {
            var smtp = new GmailSmtpClient();
            EmailService es = new EmailService(smtp.From, to, subject, body, isHtml, attachments, alternateViews);
            es.CurrentSmtpClient=smtp;
            new Thread(new ThreadStart(es.Send)).Start();
        }
        public static void SendEmail(string from, string to, string subject, string body, bool isHtml, Attachment[] attachments)
        {
            EmailService es = new EmailService(from, to, subject, body, isHtml,attachments);
            new Thread(new ThreadStart(es.Send)).Start();
        }
        public static void SendEmail(string from, string to, string subject, string body, bool isHtml)
        {
            EmailService es = new EmailService(from, to, subject, body, isHtml);
            new Thread(new ThreadStart(es.Send)).Start();
        }
        public static void SendEmail(string from, string to, string subject, string body)
        {
            EmailService es = new EmailService(from, to, subject, body);
            new Thread(new ThreadStart(es.Send)).Start();
        }
    }
}
