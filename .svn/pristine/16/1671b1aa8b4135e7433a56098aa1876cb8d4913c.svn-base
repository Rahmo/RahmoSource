using System;
using System.IO;
using System.Web.Mvc;
using ICStars2_0.Mvc.Filter;

namespace Commengdpu.Areas.Admin.Controllers
{
    [MvcAuthorize]
    public class CKEditorController : Controller
    {
        //
        // GET: /SHTracker/CKEditor/
        public ActionResult Browse()
        {
            var type = Request.QueryString["Type"];
            var isImage = !string.IsNullOrEmpty(type) && type.Equals("Images", StringComparison.InvariantCultureIgnoreCase);
            ViewBag.IsImg = isImage;
            return View();
        }
        [HttpPost]
        public ActionResult FileUpload()
        {
            var ckEditorFuncNum = Request.QueryString["CKEditorFuncNum"];
            var type = Request.QueryString["Type"];
            var isImage = !string.IsNullOrEmpty(type) && type.Equals("Images", StringComparison.InvariantCultureIgnoreCase);
            var maxContentLength = isImage ? 512*1024 : 1024*1024;
            var file = Request.Files["upload"];
            if (file == null)
            {
                return Content("No file has been chosen!");
            }
            if (file.ContentLength > maxContentLength)
            {
                return Content("The image file size should be no bigger than 512KB! The document file size should be no bigger than 1024KB!");
            }
            var urlpath = string.Empty;
            var datestamp = DateTime.Now.ToString("MMddyyyy");
            var rootfolderpath = isImage ? "/Images/" : "/docs/";
            var folderpath = Server.MapPath(rootfolderpath) + datestamp;
            if (file.ContentLength > 0)
            {
                var filename = Path.GetFileNameWithoutExtension(file.FileName);
                var fileextension = Path.GetExtension(file.FileName);
                var timestamp = DateTime.Now.ToString("MMddyyyyHHmmssfff");
                var filepath = string.Format("{0}/{1}{2}{3}", folderpath, filename, timestamp,
                                                fileextension);
                urlpath = string.Format("{4}{0}/{1}{2}{3}", datestamp, filename, timestamp,
                                                fileextension, rootfolderpath);
                if (!Directory.Exists(folderpath))
                {
                    Directory.CreateDirectory(folderpath);
                }
                file.SaveAs(filepath);
            }
            return
                Content(
                    string.Format(
                        @"<script type=""text/javascript"">window.parent.CKEDITOR.tools.callFunction({0}, ""{1}"");</script>",
                        ckEditorFuncNum, urlpath));
        }

    }
}
