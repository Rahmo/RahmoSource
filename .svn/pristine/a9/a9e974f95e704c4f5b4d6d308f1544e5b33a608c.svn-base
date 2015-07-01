using System;
using System.IO.Compression;
using System.Web;
using System.Web.Mvc;
using log4net;

namespace ICStars2_0.Mvc.Filter
{
    //public class CompressFilter : ActionFilterAttribute
    //{
    //    private static readonly ILog Logger = LogManager.GetLogger(typeof(CompressFilter));
    //    #region = IsAvailable =

    //    private bool _isavailable = true;

    //    public bool IsAvailable
    //    {
    //        get { return _isavailable; }
    //        set { _isavailable = value; }
    //    }

    //    #endregion
    //    public CompressFilter() { }
    //    public CompressFilter(bool isAvailable)
    //    {
    //        _isavailable = isAvailable;
    //    }
    //    public override void OnActionExecuting(ActionExecutingContext filterContext)
    //    {
    //        if (!IsAvailable)
    //        {
    //            base.OnActionExecuting(filterContext);
    //            return;
    //        }
    //        //当页面在此之前已经被跳转，response将不存在，因此不执行此Filter);
    //        if (filterContext.HttpContext.Response.StatusCode == 302
    //            || !string.IsNullOrEmpty(filterContext.HttpContext.Response.RedirectLocation))
    //        {
    //            base.OnActionExecuting(filterContext);
    //            return;
    //        }
    //        try{
    //        if (filterContext.HttpContext.IsCustomErrorEnabled)
    //        {
    //            HttpRequestBase request = filterContext.HttpContext.Request;

    //            string acceptEncoding = request.Headers["Accept-Encoding"];

    //            if (string.IsNullOrEmpty(acceptEncoding)) return;

    //            acceptEncoding = acceptEncoding.ToUpperInvariant();

    //            HttpResponseBase response = filterContext.HttpContext.Response;

    //            if (acceptEncoding.Contains("GZIP"))
    //            {
    //                response.AppendHeader("Content-encoding", "gzip");
    //                response.Filter = new GZipStream(response.Filter, CompressionMode.Compress);
    //            }
    //            else if (acceptEncoding.Contains("DEFLATE"))
    //            {
    //                response.AppendHeader("Content-encoding", "deflate");
    //                response.Filter = new DeflateStream(response.Filter, CompressionMode.Compress);
    //            }
    //        }
    //        }
    //        catch (Exception exp)
    //        {
    //            Log4NetHelper.WriteLog(exp, Logger);
    //        }
    //    }

    //}
}
