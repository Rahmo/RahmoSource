using System;
using System.Text;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

[assembly: WebResource("ICStars2_0.Common.UI.PageBar.PageBar.css", "text/css", PerformSubstitution = true)]
namespace ICStars2_0.Common.UI.PageBar
{
    public enum PageBarMode
    {
        Get,
        Post
    }

    #region - PageBar -
    /// <summary>
    /// 分页控件
    /// </summary>
    [ToolboxData("<{0}:PageBar runat=\"server\" />")]
    [DefaultEvent("Click")]
    [DefaultProperty("Size")]
    public sealed class PageBar : WebControl, IPostBackEventHandler
    {
        #region - Properties -
        #region = Total =
        /// <summary>
        /// 总共有多少记录集合
        /// </summary>
        /// <value>The total.</value>
        [Category("Data"), DescriptionAttribute("Total Number of Items")]
        public int Total
        {
            get
            {
                object o = this.ViewState["Total"];
                return o == null ? 0 : (int)o;
            }
            set
            {
                this.ViewState["Total"] = value;
            }
        }
        #endregion

        #region = CurrentIndex =
        /// <summary>
        /// 当前使用的页面
        /// </summary>
        /// <value>The index of the current.</value>
        [Category("Data"), DescriptionAttribute("Current Page")]
        public int CurrentIndex
        {
            get
            {
                object o = this.ViewState["CurrentIndex"];
                int _currentindex = ((o == null) ? 0 : (int)o);
                if (_currentindex == 0)
                {
                    _currentindex = 1;

                    if (this.Page.Request.QueryString[this.QueryStringKey] != null)
                    {
                        int.TryParse(this.Page.Request.QueryString[this.QueryStringKey], out _currentindex);
                    }
                }
                return _currentindex;
            }
            set { this.ViewState["CurrentIndex"] = value; }
        }
        #endregion

        #region = Size =
        /// <summary>
        /// 每个页面显示多少记录集合
        /// </summary>
        /// <value>The size.</value>
        [Category("Data"), DescriptionAttribute("Total number of items on one page")]
        public int Size
        {
            get
            {
                object o = this.ViewState["Size"];
                return o == null ? 10 : (int)o;
            }
            set
            {
                this.ViewState["Size"] = value;
            }
        }
        #endregion

        #region = Displaysize =
        /// <summary>
        /// 显示页脚,控件显示多少页面数
        /// </summary>
        /// <value>The displaysize.</value>
        [Category("Data"), DescriptionAttribute("Total number of displayed page numbers")]
        public int Displaysize
        {
            get
            {
                object o = this.ViewState["Displaysize"];
                return o == null ? 10 : (int)o;
            }
            set
            {
                this.ViewState["Displaysize"] = value;
            }
        }
        #endregion

        #region = Unit =
        /// <summary>
        /// 记录的单位
        /// </summary>
        /// <value>The unit.</value>
        [Category("Appearance"), DescriptionAttribute("记录的单位")]
        public string Unit
        {
            get
            {
                object o = this.ViewState["Unit"];
                return o == null ? string.Empty : (string)o;
            }
            set
            {
                this.ViewState["Unit"] = value;
            }
        }
        #endregion

        #region = QueryStringKey =
        /// <summary>
        /// 传递值是使用的关键字
        /// </summary>
        /// <value>The query string key.</value>
        [DescriptionAttribute("传递值是使用的关键字"), DefaultValue("page")]
        public string QueryStringKey
        {
            get
            {
                object o = this.ViewState["QueryStringKey"];
                return o == null ? "page" : (string)o;
            }
            set
            {
                this.ViewState["QueryStringKey"] = value;
            }
        }
        #endregion

        #region = Format =
        /// <summary>
        /// 数字格式化
        /// </summary>
        /// <value>The format.</value>
        [DescriptionAttribute("数字格式化"), DefaultValue("")]
        public string Format
        {
            get
            {
                object o = this.ViewState["Format"];
                return o == null ? string.Empty : (string)o;
            }
            set
            {
                this.ViewState["Format"] = value;
            }
        }
        #endregion

        #region = NextPageImageUrl =
        /// <summary>
        /// 下一页图片路径
        /// </summary>
        /// <value>The next page image URL.</value>
        [DescriptionAttribute("下一页图片路径"), DefaultValue("")]
        public string NextPageImageUrl
        {
            get
            {
                object o = this.ViewState["NextPageImageUrl"];
                return o == null ? string.Empty : (string)o;
            }
            set
            {
                this.ViewState["NextPageImageUrl"] = value;
            }
        }
        #endregion

        #region = LastPageImageUrl =
        private string _lastimage = string.Empty;
        /// <summary>
        /// 上一页图片路径
        /// </summary>
        /// <value>The last page image URL.</value>
        [DescriptionAttribute("上一页图片路径"), DefaultValue("")]
        public string LastPageImageUrl
        {
            get
            {
                object o = this.ViewState["LastPageImageUrl"];
                return o == null ? string.Empty : (string)o;
            }
            set
            {
                this.ViewState["LastPageImageUrl"] = value;
            }
        }
        #endregion

        #region = Mode =
        [
        Category("Property"),
        Description("Pagebar的模式"),
        DefaultValue("")
        ]
        public PageBarMode Mode
        {
            get
            {
                object o = this.ViewState["Mode"];
                return o == null ? PageBarMode.Get : (PageBarMode)o;
            }
            set
            {
                this.ViewState["Mode"] = value;
            }
        }
        #endregion

        #region = ValidationGroup =
        [Category("Behavior"), DefaultValue(""), Themeable(false), Description("PostBackControl_ValidationGroup")]
        public string ValidationGroup
        {
            get
            {
                string text1 = (string)this.ViewState["ValidationGroup"];
                if (text1 != null)
                {
                    return text1;
                }
                return string.Empty;
            }
            set
            {
                this.ViewState["ValidationGroup"] = value;
            }
        }
        #endregion

        #region = CausesValidation =
        /// <summary>
        /// 获取或设置一个值，该值指示在单击 LinkButton 控件时是否执行验证。 
        /// </summary>
        /// <value><c>true</c> if [causes validation]; otherwise, <c>false</c>.</value>
        [Category("Behavior"), Themeable(false), Description("Button_CausesValidation"), DefaultValue(true)]
        public bool CausesValidation
        {
            get
            {
                object obj1 = this.ViewState["CausesValidation"];
                if (obj1 != null)
                {
                    return (bool)obj1;
                }
                return true;
            }
            set
            {
                this.ViewState["CausesValidation"] = value;
            }
        }
        #endregion

        #region = Target =
        /// <summary>
        /// Gets or sets the target.
        /// </summary>
        /// <value>The target.</value>
        [
        Category("Navigation"),
        TypeConverter(typeof(TargetConverter)),
        DefaultValue(""),
        Description("HyperLink_Target")]
        public string Target
        {
            get
            {
                string text1 = (string)this.ViewState["Target"];
                if (text1 != null)
                {
                    return text1;
                }
                return "_self";
            }
            set
            {
                this.ViewState["Target"] = value;
            }
        } 
        #endregion

        #endregion

        #region - Event -

        #region = OnClick =
        private static readonly object EventClick = new object();
        [Description("PageBar_OnClick"), Category("Action")]
        public event EventHandler Click
        {
            add
            {
                Events.AddHandler(EventClick, value);
            }
            remove
            {
                Events.RemoveHandler(EventClick, value);
            }
        }
        #endregion

        #endregion

        #region = OnPreRender =
        /// <summary>
        /// Raises the <see cref="E:System.Web.UI.Control.PreRender"></see> event.
        /// </summary>
        /// <param name="e">An <see cref="T:System.EventArgs"></see> object that contains the event data.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            string cssKey = "PageBarCss";

            if (this.Page == null || this.Page.Header == null)
            {
                return;
            }
            if (string.IsNullOrEmpty(this.CssClass) == true)
            {
                this.CssClass = "PageBar";
            }
            if (this.Page.Header.FindControl(cssKey) == null && this.CssClass == "PageBar")
            {
                string css = this.Page.ClientScript.GetWebResourceUrl(this.GetType(), "ICStars2_0.Common.UI.PageBar.PageBar.css");

                HtmlLink hl = new HtmlLink();
                hl.ID = cssKey;
                hl.Href = css;
                hl.Attributes["type"] = "text/css";
                hl.Attributes["rel"] = "stylesheet";

                this.Page.Header.Controls.Add(hl);

                this.CssClass = "PageBar";
            }
        }
        #endregion

        #region = RenderContents =
        /// <summary>
        /// Renders the contents of the control to the specified writer. This method is used primarily by control developers.
        /// </summary>
        /// <param name="writer">A <see cref="T:System.Web.UI.HtmlTextWriter"></see> that represents the output stream to render HTML content on the client.</param>
        protected override void RenderContents(HtmlTextWriter writer)
        {
            base.RenderContents(writer);

            #region - Valid -
            if (this.IsEnabled == false)
            {
                return;
            }

            if (this.Size == 0 || this.Displaysize == 0)
            {
                return;
            }
            #endregion

            if (this.Total > 0 && this.CurrentIndex > 0)
            {
                double dPageCount = 1.0 * this.Total / this.Size;
                int PageCount = Convert.ToInt32(Math.Ceiling(dPageCount)); //共多少页

                if (this.CurrentIndex > PageCount)
                {
                    this.CurrentIndex = PageCount;
                }

                //writer.Write(PageBarResource.Total);
                writer.Write("Total");
                writer.Write(" ");
                writer.RenderBeginTag(HtmlTextWriterTag.Label);
                writer.Write(this.Total.ToString(this.Format));
                writer.RenderEndTag();
                writer.Write(this.Unit);
                writer.Write(" Items, ");

                //writer.Write(PageBarResource.Page);
                writer.Write("Page");
                writer.Write(" ");
                writer.RenderBeginTag(HtmlTextWriterTag.Label);
                writer.Write(this.CurrentIndex.ToString(this.Format));
                writer.RenderEndTag();
                writer.Write("/");
                writer.RenderBeginTag(HtmlTextWriterTag.Label);
                writer.Write(PageCount.ToString(this.Format));
                writer.RenderEndTag();

                if (PageCount > 1)
                {
                    writer.Write(",");
                    int PagerGroup = Convert.ToInt32(Math.Ceiling(1.0 * PageCount / this.Displaysize)); //共多少页组
                    int CurrentGroup = (this.CurrentIndex - 1) / this.Displaysize + 1; //当前页组

                    int displaystart = (CurrentGroup - 1) * this.Displaysize + 1;
                    int displayend = displaystart + this.Displaysize;

                    if (displayend > (PageCount + 1))
                    {
                        displayend = PageCount + 1;
                    }


                    //上一页
                    if (this.CurrentIndex > 1)
                    {
                        if (string.IsNullOrEmpty(this.LastPageImageUrl) == true)
                        {
                            //LinkText(PageBarResource.Previous, this.CurrentIndex - 1,writer);
                            LinkText("[Previous Page]", this.CurrentIndex - 1, writer);
                        }
                        else
                        {
                            //LinkText("<img alt=\"" + PageBarResource.Previous + "\" src=\"" + this.LastPageImageUrl + "\" />", this.CurrentIndex - 1, writer);
                            LinkText("<img alt=\"" +"[Previous Page]" + "\" src=\"" + this.LastPageImageUrl + "\" />", this.CurrentIndex - 1, writer);
                        }

                    }

                    //上一组
                    if (CurrentGroup > 1)
                    {
                        LinkText("&lt;&lt;", displaystart - 1, writer);
                    }
                    string attr = string.Empty;

                    //显示数字
                    for (int i = displaystart; i < displayend; i++)
                    {
                        writer.RenderBeginTag(HtmlTextWriterTag.Span);
                        if (i != this.CurrentIndex)
                        {
                            
                            LinkText(i.ToString(), i, writer);
                            
                        }
                        else
                        {
                            //当前页
                            writer.RenderBeginTag(HtmlTextWriterTag.Label);
                            writer.Write(i);
                            writer.RenderEndTag();
                            
                        }
                        writer.RenderEndTag();
                    }

                    //下一组
                    if (CurrentGroup < PagerGroup)
                    {

                        LinkText("&gt;&gt;", displayend, writer);
                    }

                    //下一页
                    if (this.CurrentIndex < PageCount)
                    {
                        if (string.IsNullOrEmpty(this.NextPageImageUrl) == true)
                        {
                            //LinkText(PageBarResource.Next, this.CurrentIndex + 1, writer);
                            LinkText("[Next Page]", this.CurrentIndex + 1, writer);
                        }
                        else
                        {
                            //LinkText("<img alt=\"" + PageBarResource.Next + "\" src=\"" + this.NextPageImageUrl + "\" />", this.CurrentIndex + 1, writer);
                            LinkText("<img alt=\"" + "[Next Page]" + "\" src=\"" + this.NextPageImageUrl + "\" />", this.CurrentIndex + 1, writer);
                        }

                    }
                }
            }
            else
            {
                this.Visible = false;
            }
        }
        #endregion

        #region - LinkText -
        private void LinkText(string text, int index, HtmlTextWriter write)
        {
            
            StringBuilder strHtml = new StringBuilder();
            //href
            if (this.Mode == PageBarMode.Get)
            {
                #region = 获取和解析当前的url =
                strHtml.Append(UrlHelper.Current.Path);
                strHtml.Append("?");
                System.Collections.Specialized.NameValueCollection querys = this.Page.Request.QueryString;

                foreach (string s in querys.Keys)
                {
                    if (s != this.QueryStringKey)
                    {
                        strHtml.AppendFormat("{0}={1}&", s, this.Page.Server.UrlEncode(querys[s]));
                    }
                }

                strHtml.AppendFormat("{0}={1}", this.QueryStringKey, index);
                #endregion
            }
            else
            {

                PostBackOptions options = GetPostBackOptions(index);

                string js = null;
                if (options != null)
                {
                    js = this.Page.ClientScript.GetPostBackEventReference(options, true);
                }
                if (string.IsNullOrEmpty(js) == true)
                {
                    js = "javascript:void(0)";
                }
                strHtml.Append(js);
            }

            //text
            write.AddAttribute(HtmlTextWriterAttribute.Href, strHtml.ToString());
            if (this.Mode == PageBarMode.Get)
            {
                write.AddAttribute(HtmlTextWriterAttribute.Target, this.Target);
            }
            write.RenderBeginTag(HtmlTextWriterTag.A);
            write.Write(text);
            write.RenderEndTag();
        }
        #endregion

        #region - GetPostBackOptions -
        private PostBackOptions GetPostBackOptions(int index)
        {
            PostBackOptions options1 = new PostBackOptions(this, index.ToString());
            options1.RequiresJavaScriptProtocol = true;

            if (this.CausesValidation && (this.Page.GetValidators(this.ValidationGroup).Count > 0))
            {
                options1.PerformValidation = true;
                options1.ValidationGroup = this.ValidationGroup;
            }
            return options1;
        }
        #endregion

        #region - OnClick -
        private void OnClick(EventArgs e)
        {
            EventHandler handler1 = (EventHandler)base.Events[EventClick];
            if (handler1 != null)
            {
                handler1(this, e);
            }
        } 
        #endregion

        #region IPostBackEventHandler Members

        public void RaisePostBackEvent(string eventArgument)
        {
            if (this.CausesValidation)
            {
                this.Page.Validate(this.ValidationGroup);
            }

            int _currentindex;
            if (int.TryParse(eventArgument, out _currentindex))
            {
                this.CurrentIndex = _currentindex;
            }
            
            this.OnClick(EventArgs.Empty);
        }

        #endregion
    }
    #endregion
}
