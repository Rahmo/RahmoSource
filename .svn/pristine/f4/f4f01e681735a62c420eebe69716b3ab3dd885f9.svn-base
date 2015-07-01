using System;
using System.IO;
using System.Web;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Rectangle = System.Drawing.Rectangle;

namespace ICStars2_0
{
    /// <summary>
    /// Summary description for pdf
    /// </summary>
    public class pdf : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string bmpPath = context.Request.QueryString["path"];
            string key = context.Request.QueryString["k"];
            if (!ICStars2_0.Common.EncryptDecryptHelper.Encrypt(bmpPath, DateTime.Now.ToString("yyyyMMddhh") + "UpdateSteansWeb").Equals(key))
            {

                context.Response.Clear();
                context.Response.Write("Request is expired! <a href=\"javascript:window.close();\">Close</a>");
                context.Response.End();
                return;
            }
            context.Response.Clear();
            context.Response.AddHeader("Content-Type", "application/pdf");
            context.Response.AddHeader("Cache-Control", "no-cache");
            context.Response.AddHeader("Accept-Ranges", "none");
            context.Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}.pdf",
                                                                            context.Request.QueryString["name"]));

            //context.Response.Output.Write(Common.WebHelper.GetWebPage(""));
            //HtmlToPdfOptions v = new HtmlToPdfOptions();
            //v.AutoBookmark = false;
            //HtmlToPdf.ConvertUrl(context.Request.QueryString["url"], context.Response.OutputStream,v);
           
            
            #region =ITextSharp=

            //Document is inbuilt class, available in iTextSharp
            string strPDFpath = context.Server.MapPath(string.Format("/pdf/{0}_{1}.pdf", context.Request.QueryString["id"],
                                           DateTime.Now.ToString("yyyyMMddhhmmssffftt")));
          
            
            using (Document document = new Document(PageSize.A4,0,0,0,0))
            {
             
                    PdfWriter.GetInstance(document,
                                          new FileStream(strPDFpath, FileMode.Create));
                    
                        document.Open();

                        #region =build pdf=

                        using (
                            System.Drawing.Bitmap bitmap =
                                new System.Drawing.Bitmap(context.Server.MapPath(bmpPath))
                            )
                        {
                            int pHeight = 1370;
                            int pages = bitmap.Height%pHeight == 0
                                            ? bitmap.Height/pHeight
                                            : bitmap.Height/pHeight + 1;
                            for (int i = 0; i < pages; i++)
                            {
                                int h = bitmap.Height - i*pHeight >= pHeight
                                            ? pHeight
                                            : bitmap.Height - i*pHeight;
                                Rectangle cloneRect = new Rectangle(0, i*pHeight, bitmap.Width, h);
                                System.Drawing.Bitmap bmp = bitmap.Clone(cloneRect, bitmap.PixelFormat); //复制小块图
                                iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(bmp,
                                                                                              System.Drawing.Imaging.
                                                                                                  ImageFormat
                                                                                                  .Png);
                                img.ScalePercent(58); //pdf分辨率要大一些，需要缩小以恢复正常PDF是96DPI，IE是72DPI
                                img.SetAbsolutePosition(40, i == pages - 1 ? 40 : i == 0 ? 40 : 20);
                                
                                document.Add(img);

                                bmp.Dispose();
                                document.NewPage();
                                document.SetMargins(0, 0, 0, 0);
                            }
                        }

                        #endregion
                    
                
            }
            
                //context.Response.ContentType = "application/octet-stream";
                context.Response.WriteFile(strPDFpath);
                context.Response.Flush();
                context.Response.End();
                context.Response.Close();
                if (File.Exists(strPDFpath))
                {
                    File.Delete(strPDFpath);
                }
                if (File.Exists(context.Server.MapPath(bmpPath)))
                {
                    File.Delete(context.Server.MapPath(bmpPath));
                }

            #endregion

        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}