using System;
using System.Collections.Generic;
using System.IO;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Common;
using Microsoft.Practices.Unity;

namespace ICStars2_0
{
    public partial class test : System.Web.UI.Page
    {
        //private ISteansSettingsFactory ssf;
        //[Dependency]
        //public ISteansSettingsFactory SteansSettingsFactory {
        //    get { return ssf; }
        //    set { ssf = value; }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {



            //string key = "SteansCenterConnectionStringKey1234567890!@#$%^&*()";
            //string encrypedKey = Common.EncryptDecryptHelper.Encrypt(key, Common.Const.ENCRYPT_KEY);
            //Response.Write(encrypedKey);
            //Response.Write("<br/>");
            //string decrypedKey =
            //    Common.EncryptDecryptHelper.Decrypt(
            //        "0tQf9RSl2MoLQksaY/keokEiZvzrGptVyEvJlW7c21XuetKe069d0cHMdwArk5PZ/oCO5Llw2x8=",
            //        Common.Const.ENCRYPT_KEY);
            //Response.Write(decrypedKey);
            //Response.Write("<br />");
            //Response.Write(Common.EncryptDecryptHelper.Encrypt("server=127.0.0.1;database=ICStars2_0;uid=sa;pwd=123456;Connect Timeout=60;Max Pool Size=200;MultipleActiveResultSets=True",Common.Const.CONNECTION_ENCRYPTED_KEY));

            //BaseSettings settings = SteansSettingsFactory.CreateBaseSetings<BaseSettings>();
          
            //Response.Write(settings.CommunityInternshipServiceReceiverEmail);
            //settings.CommunityInternshipServiceReceiverEmail = "lihui830501@gmail.com";
            //settings.CommunityPartnersServiceReceiverEmail = "lihui830501@gmail.com";
            //SteansSettingsFactory.SaveSettings(settings);

            //CommunityInternshipSettings settings2 = SteansSettingsFactory.CreateBaseSetings<CommunityInternshipSettings>();
            //Response.Write(settings2.EmailBody);
            //settings2.EmailTitle = "lihui830501@gmail.com";
            //settings2.EmailBody = "lihui830501@gmail.com";
            //SteansSettingsFactory.SaveSettings(settings2);

            //Common.FileHelper.WriteText(Server.MapPath("test.txt"),"test");
            if (!Directory.Exists("c:/EnglishVoice/vocabulary"))
            {
                Directory.CreateDirectory("c:/EnglishVoice/vocabulary");
            }
            WebHelper.DownloadFile("http://dict.youdao.com/dictvoice?audio=tool&type=2", "c:/EnglishVoice/vocabulary/tool.mp3");
        }
    }
}