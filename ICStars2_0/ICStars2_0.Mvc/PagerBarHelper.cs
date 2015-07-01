using System;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Mvc
{
    [System.Flags]
    public enum PageBarType : int
    {
        /// <summary>
        /// 数字
        /// </summary>
        Number = 00000001,
        /// <summary>
        /// 第一页
        /// </summary>
        First = 00000010,
        /// <summary>
        /// 最后一页
        /// </summary>
        Last = 00000100,
        /// <summary>
        /// 上一页
        /// </summary>
        Previous = 00001000,
        /// <summary>
        /// 下一页
        /// </summary>
        Next = 00010000,
        /// <summary>
        /// 总计
        /// </summary>
        Total = 00100000,
        /// <summary>
        ///  数字,第一页,最后一页
        /// </summary>
        Number_First_Last = Number | First | Last,
        /// <summary>
        /// 数字,上一页,下一页
        /// </summary>
        Number_Previous_Next = Number | Previous | Next,
        /// <summary>
        /// 上一页,下一页
        /// </summary>
        Previous_Next = Previous | Next,
        /// <summary>
        /// 上一页,下一页,第一页,最后一页
        /// </summary>
        Previous_Next_First_Last = Previous | Next | First | Last,
        /// <summary>
        /// 全部显示
        /// </summary>
        Default = Number | Previous | Next | First | Last | Total
    }
    public enum PageBarMethod
    {
        /// <summary>
        /// mvc路由方式
        /// </summary>
        MapRoute,
        /// <summary>
        /// url参数方式
        /// </summary>
        QueryString,
    }
    public struct PageBarSetting
    {
        public PageBarSetting(int totalcount, int pagesize, int displaysize, PageBarMethod method = PageBarMethod.MapRoute)
            : this()
        {
            TotalCount = totalcount;
            PageSize = pagesize;
            DisplaySize = displaysize;
            Method = method;
            Init();
        }
        public void Init()
        {
            First = "[1st]";
            PreviousArea = "&lt;&lt;";
            Previous = "[Previous]";
            Next = "[Next]";
            NextArea = "&gt;&gt;";
            Last = "[Last]";
            RouteName = "page";
            if (PageSize > 0)
            {
                //计算页数
                Pages = TotalCount % PageSize == 0 ? TotalCount / PageSize : TotalCount / PageSize + 1;
            }
        }
        #region = First =
        /// <summary>
        /// 第一页按钮显示内容
        /// </summary>
        public string First { get; set; }

        #endregion
        #region = PreviousArea =
        /// <summary>
        /// 上一区域按钮显示内容
        /// </summary>
        public string PreviousArea { get; set; }

        #endregion
        #region = Previous =
        /// <summary>
        /// 上一页按钮显示内容
        /// </summary>
        public string Previous { get; set; }

        #endregion
        #region = Next =
        /// <summary>
        /// 下一页按钮显示内容
        /// </summary>
        public string Next { get; set; }

        #endregion
        #region = NextArea =
        /// <summary>
        /// 下一区域按钮显示内容
        /// </summary>
        public string NextArea { get; set; }

        #endregion
        #region = Last =
        /// <summary>
        /// 最后一页按钮显示内容
        /// </summary>
        public string Last { get; set; }

        #endregion
        #region = TotalCount =
        /// <summary>
        /// 总记录数
        /// </summary>
        public int TotalCount { get; set; }

        #endregion
        #region = Pages =
        /// <summary>
        /// 总页数
        /// </summary>
        public int Pages { get; set; }

        #endregion
        #region = PageSize =
        /// <summary>
        /// 每页显示数量
        /// </summary>
        public int PageSize { get; set; }

        #endregion
        #region = DisplaySize =
        /// <summary>
        /// 分页数字显示个数
        /// </summary>
        public int DisplaySize { get; set; }

        #endregion
        #region = RouteName =
        /// <summary>
        /// Method为MapRoute时，路由名称
        /// Method为QueryString时，Url分页参数名称
        /// </summary>
        public string RouteName { get; set; }

        #endregion
        #region = Anchor =
        /// <summary>
        /// 锚点
        /// </summary>
        public string Anchor { get; set; }

        #endregion
        /// <summary>
        /// 分页方式
        /// </summary>
        public PageBarMethod Method { get; set; }
        /// <summary>
        /// IIS默认页
        /// 设置此属性会在URL中隐藏IIS默认页
        /// </summary>
        public string IISDefaultPage { get; set; }
    }
    public static class PagerBarHelper
    {
        public static MvcHtmlString PagerBar(this HtmlHelper helper, int totalCount, int pageSize, int displaySize, object htmlAttributes = null)
        {
            return PagerBar(helper, totalCount, pageSize, displaySize,PageBarMethod.MapRoute,PageBarType.Default, htmlAttributes);
        }

        /// <summary>
        /// 分页HTML生成器
        /// </summary>
        /// <param name="helper">待扩展的HtmlHelper</param>
        /// <param name="pagebarType">按钮显示样式</param>
        /// <param name="htmlAttributes">html属性</param>
        /// <param name="totalCount">数据总数</param>
        /// <param name="pageSize">每页显示数量</param>
        /// <param name="displaySize">分页控件允许显示的页数</param>
        /// <param name="method">选择路由参数或者URL参数</param>
        /// <returns></returns>
        public static MvcHtmlString PagerBar(this HtmlHelper helper, int totalCount, int pageSize, int displaySize,PageBarMethod method=PageBarMethod.MapRoute,PageBarType pagebarType=PageBarType.Default,object htmlAttributes=null)
        {
            //if (totalCount <= pageSize) return MvcHtmlString.Empty;
            var pbSetting = new PageBarSetting(totalCount, pageSize, displaySize, method);
            return PagerBar(helper, htmlAttributes, pbSetting,pagebarType);
        }

        public static MvcHtmlString PagerBar(this HtmlHelper helper, object htmlAttributes, PageBarSetting pbSetting,
            PageBarType pbType = PageBarType.Default)
        {
            return PagerBar(helper, pbSetting, pbType, htmlAttributes);
        }

        public static MvcHtmlString PagerBar(this HtmlHelper helper, PageBarSetting pbSetting, PageBarType pbType = PageBarType.Default, object htmlAttributes=null)
        {
            //只有一页数据,不显示分页
            if (pbSetting.Pages < 2) return MvcHtmlString.Empty;
            int currentIndex = 1;
            #region =urlmodel=

            var urlFirst = "";
            var urlmodel = "";
            switch (pbSetting.Method)
            {
                case PageBarMethod.MapRoute:
                    //url参数
                    string query = helper.ViewContext.HttpContext.Request.Url.Query;
                    currentIndex = Convert.ToInt32(helper.ViewContext.RouteData.Values[pbSetting.RouteName.ToLower()]);
                    var route = (System.Web.Routing.Route) helper.ViewContext.RouteData.Route;
                    string urlPattern = route.Url.ToLower();
                    urlFirst = string.Concat("/",
                                             urlPattern.Replace(
                                                 string.Format("/{{{0}}}", pbSetting.RouteName.ToLower()), ""));
                    urlFirst = helper.ViewContext.RouteData.Values.Aggregate(urlFirst,
                                                                             (current, v) =>
                                                                             current.Replace(
                                                                                 string.Format("{{{0}}}",
                                                                                               v.Key.ToLower()),
                                                                                 v.Value.ToString()));
                    urlFirst= string.Concat(urlFirst, query);
                    //将路由形式转化字符串格式化形式,{pageindex}转成{0}
                    urlmodel = string.Concat("/", urlPattern.Replace(pbSetting.RouteName.ToLower(), "0"));
                    urlmodel = helper.ViewContext.RouteData.Values.Aggregate(urlmodel,
                                                                             (current, v) =>
                                                                             current.Replace(
                                                                                 string.Format("{{{0}}}",
                                                                                               v.Key.ToLower()),
                                                                                 v.Value.ToString()));
                    urlmodel= string.Concat(urlmodel, query);
                    break;
                case PageBarMethod.QueryString:
                    int.TryParse(helper.ViewContext.HttpContext.Request.QueryString[pbSetting.RouteName],
                                 out currentIndex);
                    if (currentIndex < 1) currentIndex = 1;
                    #region = 获取和解析当前的url =



                    string localpath = helper.ViewContext.HttpContext.Request.Url.LocalPath;
                    if (!string.IsNullOrEmpty(pbSetting.IISDefaultPage) &&
                        localpath.Equals(string.Concat("/", pbSetting.IISDefaultPage)))
                    {
                        localpath = "/";
                    }
                    var sbFirst = new StringBuilder(localpath);

                    var sbModel = new StringBuilder(localpath);
                    sbModel.Append("?");
                    //url参数
                    var querys = helper.ViewContext.HttpContext.Request.QueryString;

                    if (querys != null)
                    {
                        //当仅有一个Key为RouteName的参数时或两个及两个以上参数时，加入字符'?'
                        if (querys.Count > 1 ||
                            (querys.Count == 1 && querys.Keys[0] != null &&  !querys.Keys[0].Equals(pbSetting.RouteName, StringComparison.CurrentCultureIgnoreCase)))
                        {
                            sbFirst.Append("?");
                        }
                        foreach (string s in querys.Keys)
                        {
                            if (!string.IsNullOrEmpty(s) && s.Equals(pbSetting.RouteName)) continue;
                            var v = helper.ViewContext.HttpContext.Server.UrlEncode(querys[s]);
                            //当key为null时，url参数中仅放不带'='号的值
                            sbFirst.AppendFormat("{0}{1}&",
                                                 string.IsNullOrEmpty(s) ? string.Empty : string.Concat(s, "="), v);
                            sbModel.AppendFormat("{0}{1}&",
                                                 string.IsNullOrEmpty(s) ? string.Empty : string.Concat(s, "="), v);
                        }
                    }
                    urlFirst = System.Text.RegularExpressions.Regex.Replace(sbFirst.ToString(), "&$", string.Empty);

                    sbModel.AppendFormat("{0}={{0}}", pbSetting.RouteName);
                    urlmodel = sbModel.ToString();

                    #endregion)

                    break;
            }

            #region =Anchor=
            
            if(!string.IsNullOrEmpty(pbSetting.Anchor))
            {
                urlmodel = string.Format("{0}#{1}", urlmodel, pbSetting.Anchor);
            }
            #endregion
            #endregion
            var sBuilder = new StringBuilder();
            sBuilder.Append("<span");
            //HTML属性设置
            if (htmlAttributes != null)
            {
                string t = htmlAttributes.GetType().ToString();

                foreach (PropertyInfo pi in htmlAttributes.GetType().GetProperties())
                {
                    sBuilder.AppendFormat(" {0}=\"{1}\"", pi.Name, pi.GetValue(htmlAttributes, null));
                }
            }
            sBuilder.Append(">");
            if ((pbType | PageBarType.Total) == pbType)
            {
                sBuilder.Append("<span>");
                if (pbSetting.TotalCount > 0)
                {
                    sBuilder.AppendFormat("Total <em>{0}</em> Items, ", pbSetting.TotalCount);
                }
                sBuilder.AppendFormat("Page <em>{0}</em>/<em>{1}</em>,", currentIndex, pbSetting.Pages);
                sBuilder.Append("</span>");
            }
            if (currentIndex > 1)
            {
                if ((pbType | PageBarType.First) == pbType)
                {
                    sBuilder.AppendFormat(@"<a href=""{0}"" target=""_self"">{1}</a>", BuildLinkUrl(urlFirst, urlmodel, 1),
                                          pbSetting.First);
                }
                if ((pbType | PageBarType.Previous) == pbType)
                {
                    sBuilder.AppendFormat(@"<a href=""{0}"" target=""_self"">{1}</a>", BuildLinkUrl(urlFirst, urlmodel, currentIndex - 1), pbSetting.Previous);
                }
            }
            #region =页码区域起始点=

            int areaStart = currentIndex % pbSetting.DisplaySize > 0 ? currentIndex / pbSetting.DisplaySize * pbSetting.DisplaySize + 1 : (currentIndex - 1) / pbSetting.DisplaySize * pbSetting.DisplaySize + 1;
            #endregion
            #region =显示上一个页码区间,并往前翻到区间末尾页=
            if (currentIndex > pbSetting.DisplaySize)
            {
                if ((pbType | PageBarType.Number) == pbType)
                {
                    sBuilder.AppendFormat(@"<a href=""{0}"" target=""_self"">{1}</a>", BuildLinkUrl(urlFirst, urlmodel, areaStart - 1), pbSetting.PreviousArea);
                }
            }
            #endregion

            #region =计算分页需要显示的页码区域=
            if ((pbType | PageBarType.Number) == pbType)
            {
                for (int i = areaStart; i < areaStart + pbSetting.DisplaySize; i++)
                {
                    //如果当前页超出总页数范围,则不再生成页码
                    if (i > pbSetting.Pages) break;
                    if (i == currentIndex)
                    {
                        //当前页没有链接,设置标签
                        sBuilder.AppendFormat(@"<span><label>{0}</label></span>", i);
                    }
                    else
                    {
                        sBuilder.AppendFormat(@"<a href=""{0}"" target=""_self"">{1}</a>", BuildLinkUrl(urlFirst, urlmodel, i), i);
                    }
                }
            }
            #endregion
            #region =显示下一个页码区间,并往后翻到区间首页=

            if (areaStart + pbSetting.DisplaySize <= pbSetting.Pages)
            {
                if ((pbType | PageBarType.Number) == pbType)
                {
                    sBuilder.AppendFormat(@"<a href=""{0}"" target=""_self"">{1}</a>", BuildLinkUrl(urlFirst, urlmodel, areaStart + pbSetting.DisplaySize), pbSetting.NextArea);
                }
            }
            #endregion
            if (currentIndex < pbSetting.Pages)
            {
                if ((pbType | PageBarType.Next) == pbType)
                {
                    sBuilder.AppendFormat(@"<a href=""{0}"" target=""_self"">{1}</a>", BuildLinkUrl(urlFirst, urlmodel, currentIndex + 1), pbSetting.Next);
                }
                if ((pbType | PageBarType.Last) == pbType)
                {
                    sBuilder.AppendFormat(@"<a href=""{0}"" target=""_self"">{1}</a>", BuildLinkUrl(urlFirst, urlmodel, pbSetting.Pages), pbSetting.Last);
                }
            }
            sBuilder.Append("</span>");
            return MvcHtmlString.Create(sBuilder.ToString());
        }
        private static string BuildLinkUrl(string urlFirst, string urlModel, int index)
        {
            if(index<2)
            {
                return urlFirst;
            }
            return string.Format(urlModel, index);
        }
    }
}
