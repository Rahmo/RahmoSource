using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Web;

namespace ICStars2_0.Common
{
    public static class RequestHelper
    {
        public const string XRequestedWithHeaderKey = "X-Requested-With";
        public const string AjaxRequestHeaderValue = "XMLHttpRequest";

        public static bool IsAjaxRequest(HttpRequest request) {
                        if (request == null) {
                                throw new ArgumentNullException("request");
                        }
                        return ((request.QueryString != null && request.QueryString[XRequestedWithHeaderKey] == AjaxRequestHeaderValue) ||
                                (request.Headers != null && request.Headers[XRequestedWithHeaderKey] == AjaxRequestHeaderValue));
                }
        public static bool IsDePaulRequest(HttpRequest request)
        {
            if (request == null)
            {
                throw new ArgumentNullException("request");
            }
            return (request.UrlReferrer != null &&
                    request.UrlReferrer.Host.ToLower().Equals(ConfigurationManager.AppSettings["host"] ?? "www.depaul.edu"));
        }
    }
}
