using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using ICStars2_0.Common;
using HtmlHelper = System.Web.Mvc.HtmlHelper;

namespace ICStars2_0.Mvc
{
    
    public static class Extension
    {
        public static IEnumerable<SelectListItem> BuildSelectListItemList(this HtmlHelper helper, Type enumType, bool isBindValue=false)
        {
            return Enum.GetValues(enumType).Cast<Enum>().Select(
                e =>
                new
                {
                    Text = EnumHelper.GetDescription(e),
                    Value = e.GetHashCode()
                }).Select(
                        e =>
                        new SelectListItem
                        {
                            Text = e.Text,
                            Value =
                                isBindValue
                                    ? e.Value.ToString()
                                    : e.Text
                        });
        }
        public static IHtmlString Script(this HtmlHelper helper, params string[] urls)
        {
            var bundleDirectory = "~/bundles/" + MakeBundleName("js", urls);
            var bundle = BundleTable.Bundles.GetBundleFor(bundleDirectory);
            if (bundle == null)
            {
                var transform = new JavascriptObfuscator();
                bundle = new ScriptBundle(bundleDirectory).Include(urls);
                bundle.Transforms.Add(transform);
                BundleTable.Bundles.Add(bundle);
            }
            return Scripts.Render(bundleDirectory);
        }

        public static IHtmlString Style(this HtmlHelper helper, params string[] urls)
        {
            var bundleDirectory = "~/bundles/" + MakeBundleName("css", urls);
            var bundle=BundleTable.Bundles.GetBundleFor(bundleDirectory);
            if (bundle == null)
            {
                bundle = new StyleBundle(bundleDirectory).Include(urls);
                BundleTable.Bundles.Add(bundle);
            }
            return Styles.Render(bundleDirectory);
        }

        public static IHtmlString StyleWithMedia(this HtmlHelper helper, string media, params string[] urls)
        {
            var bundleDirectory = "~/bundles/" + MakeBundleName("css", urls);
            var bundle = BundleTable.Bundles.GetBundleFor(bundleDirectory);
            if (bundle == null)
            {
                bundle = new StyleBundle(bundleDirectory).Include(urls);
                BundleTable.Bundles.Add(bundle);
            }
            string bundleUrl;
#if DEBUG
            bundleUrl = BundleTable.Bundles.ResolveBundleUrl(bundleDirectory, false);
#else
            bundleUrl = BundleTable.Bundles.ResolveBundleUrl(bundleDirectory, true);
#endif

            return
                MvcHtmlString.Create(string.Format("<link rel=\"stylesheet\" media=\"{0}\" href=\"{1}\" />", media,
                    bundleUrl));
            return Styles.Render(bundleDirectory);
        }

        private static string MakeBundleName(string type, params string[] urls)
        {
            var array =
                urls.SelectMany(url => url.Split('/'))
                    .SelectMany(url => url.Split('.'))
                    .Distinct()
                    .Except(new[] {"~", type});

            return string.Join("-", array);
        }
    }
}
