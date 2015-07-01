using System;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Common;
using log4net;

namespace ICStars2_0.Mvc.Filter
{
    public class AnchorFilter : ActionFilterAttribute
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(AnchorFilter));
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                //当页面在此之前已经被跳转，response将不存在，因此不执行此Filter);
                if (filterContext.HttpContext.Response.StatusCode == 302
                    || !string.IsNullOrEmpty(filterContext.HttpContext.Response.RedirectLocation))
                {
                    base.OnActionExecuting(filterContext);
                    return;
                }
                if (!string.IsNullOrEmpty(filterContext.HttpContext.Request.QueryString["r_Anchor"]))
                {
                    filterContext.Result = new RedirectResult(string.Format("{0}#{1}",
                                                                              filterContext.HttpContext.Request.Url.
                                                                                  AbsolutePath,
                                                                              filterContext.HttpContext.Request.
                                                                                  QueryString["r_Anchor"]));
                    //filterContext.HttpContext.Response.Redirect(string.Format("{0}#{1}",
                    //                                                          filterContext.HttpContext.Request.Url.
                    //                                                              AbsolutePath,
                    //                                                          filterContext.HttpContext.Request.
                    //                                                              QueryString["r_Anchor"]));
                    return;
                }
            }
            catch (Exception exp)
            {

                string useragent = string.Empty;
                string url = string.Empty;
                string urlReferrer = string.Empty;
                if (HttpContext.Current != null)
                {
                    useragent = HttpContext.Current.Request.UserAgent;
                    url = string.Format("{0}", HttpContext.Current.Request.Url);

                    urlReferrer = string.Format("{0}", HttpContext.Current.Request.UrlReferrer);
                }
                Logger.Error(
                    string.Format(
                        "UserName:{0}\r\nIP:{1}\r\nUserAgent:{2}\r\nURL:{3}\r\nURLReferrer:{4}\r\nMessage:{5}\r\nSource:{6}",
                        HttpContext.Current != null ? HttpContext.Current.User.Identity.Name : "",
                        BrowserInfo.GetIp(), useragent,
                        url, urlReferrer, exp.Message,
                        exp.StackTrace), exp);
            }
           
            base.OnActionExecuting(filterContext);
        }
    }
}
