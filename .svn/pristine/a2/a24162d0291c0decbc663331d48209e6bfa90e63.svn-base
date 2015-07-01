using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace ICStars2_0
{
    public partial class Bitmap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Directory.Exists( Server.MapPath("/pdf")))
            {
                Directory.CreateDirectory(Server.MapPath("/pdf"));
            }
            string url = Request.QueryString["url"];
            string key = Request.QueryString["k"];
            if(!ICStars2_0.Common.EncryptDecryptHelper.Encrypt(url,DateTime.Now.ToString("yyyyMMddhh")+"UpdateSteansWeb").Equals(key))
            {

                Response.Clear();
                Response.Write("Request is expired! <a href=\"javascript:window.close();\">Close</a>");
                Response.End();
                return;
            }
            #region =bitmap=
            string bmpPath = string.Format("/pdf/{0}_{1}.png", Request.QueryString["id"],
                                           DateTime.Now.ToString("yyyyMMddhhmmssffftt"));
            using (WebBrowser wb = new WebBrowser())
            {
                //wb.Width = w;
                //wb.Height = h;
                wb.ScrollBarsEnabled = false;
                Uri uri=new Uri(url);
                string id0 = Regex.Match(url, "id0=(.+)",RegexOptions.IgnoreCase).Groups[1].Value;
                string newUrl = Regex.Replace(url, "id0=.+", string.Format("id0={0}", Server.UrlEncode(id0)),
                                              RegexOptions.IgnoreCase);
                wb.Navigate(newUrl);
                wb.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(wb_DocumentCompleted);
                //确保页面被解析完全
                while (wb.ReadyState != WebBrowserReadyState.Complete)
                {
                    System.Windows.Forms.Application.DoEvents();
                }
                wb.Width = 900;
                wb.Height = wb.Document.Body.ScrollRectangle.Height;
                using (System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(wb.Width, wb.Height))
                {
                    wb.DrawToBitmap(bmp, new Rectangle(0, 0, bmp.Width, bmp.Height));
                    bmp.Save(Server.MapPath(bmpPath), ImageFormat.Png);
                }
                wb.Dispose();
                string k = ICStars2_0.Common.EncryptDecryptHelper.Encrypt(bmpPath,
                                                               DateTime.Now.ToString("yyyyMMddhh") + "UpdateSteansWeb");
                Response.Redirect("/pdf.ashx?name=" + Server.UrlEncode(Request.QueryString["name"])
                                  + "&id=" + Request.QueryString["id"] + "&k=" + Server.UrlEncode(k) + "&path=" +
                                  Server.UrlEncode(bmpPath));
            }
            #endregion
        }
        void wb_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {
        }
    }
}