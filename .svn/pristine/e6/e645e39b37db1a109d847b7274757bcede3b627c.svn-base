using System.IO;
using System.Web.Mvc;
using System.Linq;
using System.Xml.Serialization;
using System;
using log4net;

namespace Mkt.Mvc.Filter
{
//    public class MktAdminLog : ActionFilterAttribute
//    {
//        public IAdminLogFactory AdminLogFactory = MktUnityContainer.Current.Resolve<IAdminLogFactory>();
//        private static readonly ILog Logger = LogManager.GetLogger(typeof(MktAdminLog));
//        public override void OnResultExecuted(ResultExecutedContext filterContext)
//        {
//            try
//            {
//                var result = filterContext.Result as ViewResult;
//                var urlReferrer = string.Format("{0}", filterContext.HttpContext.Request.UrlReferrer);
//                var url = filterContext.HttpContext.Request.Url.ToString();
//                string locationFormats = "~/Areas/{2}/Views/{1}/{0}.(cshtml|aspx)";

//                string areaName = (string)filterContext.RouteData.DataTokens["area"];
//                string controllerName = (string)filterContext.RouteData.Values["controller"];
//                string actionName = (string)filterContext.RouteData.Values["action"];
//                //在OnActionExecuted中ViewName == null ，所以只能放在OnResultExecuted方法中
//                string viewName = result != null ? result.ViewName : string.Empty;
//                string viewPath = string.Format(locationFormats, viewName, controllerName, areaName);

//                //MVC ActionParams OF POST
//                //在这个地方访问不到POST参数，只能放在OnActionExecuted中的ViewData中
//                string actionParams = (string)filterContext.Controller.ViewData["ActionParams"];
//                ////记录操作日志
//                AdminLogFactory.Add(new AdminLog()
//                                        {
//                                            AreaName = areaName,
//                                            ActionName = actionName,
//                                            ControllerName = controllerName,
//                                            UserName = filterContext.HttpContext.User.Identity.Name,
//                                            Url = url,
//                                            UrlReferrer = urlReferrer,
//                                            ActionParameters = actionParams,
//                                            IP = Mkt.Common.BrowserInfo.GetIp(),
//                                            ViewName = viewPath
//                                        });
//            }
//            catch (Exception exp)
//            {
//#if DEBUG
//                throw exp;
//#endif
//                Log4NetHelper.WriteLog(exp, Logger);
//            }
//            base.OnResultExecuted(filterContext);
//        }
//        private string BuildXml(object o)
//        {
            
//                var xs = new XmlSerializer(o.GetType());
//               using(var s=new StringWriter())
//               {
//                   xs.Serialize(s, o);
//                   return s.ToString();
//               }
//        }
//        public override void OnActionExecuted(ActionExecutedContext filterContext)
//        {
//            try
//            {
//                var postparms = string.Empty;
//                var result = filterContext.Result as ViewResult;
//                if(result!=null)
//                {
//                    var sl = filterContext.ActionDescriptor.GetCustomAttributes(typeof(HttpPostAttribute), true);
//                    if (sl.Length > 0) postparms = BuildXml(result.Model);
//                }
//                var parms = filterContext.ActionDescriptor.GetParameters();
//                var getparams = parms.Length > 0
//                                    ? parms.Select(n =>
//                                                   string.Format("<{0}>{1}</{0}>",
//                                                                 n.ParameterName,
//                                                                 n.DefaultValue == null ? filterContext.RouteData.Values[n.ParameterName] : string.Empty)).
//                                          Aggregate(
//                                              (n1, n2) => string.Concat(n1, n2))
//                                    : string.Empty;


//                filterContext.Controller.ViewData["ActionParams"] = string.IsNullOrEmpty(postparms)
//                                                      ? string.IsNullOrEmpty(getparams)
//                                                            ? string.Empty
//                                                            : string.Format("<root>{0}</root>", getparams)
//                                                      : postparms;
//            }
//            catch (Exception exp)
//            {
//                Log4NetHelper.WriteLog(exp, Logger);
//            }
//            base.OnActionExecuted(filterContext);
//        }
//    }
}
