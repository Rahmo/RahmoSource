using System.Web.Optimization;
using ICStars2_0.Mvc;

namespace ICStars2_0.App_Start
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryform").Include(
                        "~/Scripts/jquery.form.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));
            #region =JQueryUI=
            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/JQueryUI2/ui/jquery-ui.custom.js"));
            bundles.Add(new StyleBundle("~/bundles/jqueryuicss").Include("~/Scripts/JqueryUI2/themes/smoothness/jquery-ui.css"));

            #endregion

            bundles.Add(new StyleBundle("~/bundles/css").Include("~/SHTracker/Content/Css/Import.css"));
            bundles.Add(new StyleBundle("~/bundles/layout").Include("~/SHTracker/Content/Css/layout.css"));

            bundles.Add(new StyleBundle("~/bundles/validation").Include(
                        "~/Content/Css/validation.css"));
            bundles.Add(new StyleBundle("~/bundles/Form").Include(
                        "~/Content/Css/Form.css"));
            bundles.Add(new StyleBundle("~/bundles/Site").Include(
                        "~/Content/Css/Form.css",
                        "~/Content/Css/validation.css"));

            bundles.Add(new StyleBundle("~/bundles/website").Include(
                        "~/Content/Css/global.css", "~/Content/Css/a.css"));

            var b = new ScriptBundle("~/bundles/headerfooter").Include(
                "~/Scripts/HeaderFooter.js");
            b.Transforms.Add(new JavascriptObfuscator());
            bundles.Add(b);
            #region =CoinSlider=
            bundles.Add(new ScriptBundle("~/bundles/slider").Include(
                        "~/Scripts/CoinSlider/coin-slider.js"));
            bundles.Add(new StyleBundle("~/bundles/slidercss").Include(
                        "~/Scripts/CoinSlider/coin-slider-styles.css"));
            #endregion
            #region =pageBar=

            bundles.Add(new StyleBundle("~/bundles/pagebar2").Include(
                        "~/Content/Css/PageBar2.css"));
            bundles.Add(new StyleBundle("~/bundles/pagebar3").Include(
                        "~/Content/Css/PageBar3.css"));
            bundles.Add(new StyleBundle("~/bundles/pagebar4").Include(
                        "~/Content/Css/PageBar4.css"));
            #endregion
            #region =CKEditor=
            /*Important! Please use tag <script/> instead of bundles, or errors occure!*/
            bundles.Add(new ScriptBundle("~/bundles/ckeditor").Include(
                        "~/SHTracker/Scripts/CkEditor/ckeditor.js",
                        "~/SHTracker/Scripts/CkEditor/CheckCompatibility.js"));
            bundles.Add(new StyleBundle("~/bundles/ckeditorInlineEditing").Include(
                        "~/Content/Css/CKEditorInlineEditing.css"));
            #endregion
            #region =Admin Editing=
            bundles.Add(new ScriptBundle("~/bundles/AdminEditing").Include(
                        "~/Scripts/AdminEditing.js"));
            #endregion
            #region =Mobile=
            bundles.Add(new ScriptBundle("~/bundles/jquerymobile").Include("~/Scripts/jquery.mobile*"));

            bundles.Add(new StyleBundle("~/bundles/mobilecss").Include("~/Content/Css/jquery.mobile*", "~/Content/Css/MobileSite.css"));
            #endregion
            #region =MCI=
            bundles.Add(new StyleBundle("~/bundles/mci").Include(
                        "~/Content/Css/MCI/global.css"));
            #endregion
            #region =Datetimepicker=
            bundles.Add(new ScriptBundle("~/bundles/js/datetimepicker").Include(
                        "~/Scripts/jquery.datetimepicker.js"));
            bundles.Add(new StyleBundle("~/bundles/css/datetimepicker").Include(
                        "~/Scripts/jquery.datetimepicker.css"));
            #endregion
            #region =Timepicker=
            bundles.Add(new ScriptBundle("~/bundles/js/timepicker").Include(
                        "~/Scripts/jquery.timepicker.js"));
            bundles.Add(new StyleBundle("~/bundles/css/timepicker").Include(
                        "~/Scripts/jquery.timepicker.css"));
            #endregion
            #region =fullcalendar=
            bundles.Add(new ScriptBundle("~/bundles/fullcalendar").Include(
                        "~/Scripts/fullcalendar/fullcalendar.js"));
            bundles.Add(new StyleBundle("~/bundles/fullcalendarcss").Include(
                        "~/Scripts/fullcalendar/fullcalendar.css"));
            #endregion
            #region =Calendar=
            var calendar = new ScriptBundle("~/bundles/calendar").Include(
                "~/Scripts/Calendar/index.js","~/Scripts/moment.js");
            calendar.Transforms.Add(new JavascriptObfuscator());
            bundles.Add(calendar);

            #endregion

#if !DEBUG
            BundleTable.EnableOptimizations = true;
#endif
        }
    }
}