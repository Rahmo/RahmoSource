using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Items;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Components
{

    public static class DropDownListHelper
    {
        public static IEnumerable<SelectListItem> BuildCSSPTermSelectListItems()
        {
            var isBindValue = false;
            return Enum.GetValues(typeof(CSSP_TermType)).Cast<Enum>().Where(EnumHelper.GetIsShow).Select
                (
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

        public static IEnumerable<SelectListItem> BuildQuarterYearSelectListItems()
        {
            var steansSettingsFactory =
                ICStarsUnityContainer.Current.Resolve<ISteansSettingsFactory>();

            var settings = steansSettingsFactory.CreateStandardSetings<QuarterListSettings>();
            return settings.QuarterList.Select(q => new SelectListItem { Text = q, Value = q });
        }
        public static string DropDownList(string name, object value)
        {
            return DropDownList(name, value, null);
        }

        public static string DropDownList(string name, object value, IEnumerable<SelectListItem> list,
                                          string htmlAttributes)
        {
            return DropDownList(name, value, list, htmlAttributes, 50);
        }

        public static string DropDownList(string name, object value, IEnumerable<SelectListItem> list, string htmlAttributes, int length)
        {
            
            StringBuilder sBuilder = new StringBuilder();
            sBuilder.AppendFormat(
                !string.IsNullOrEmpty(htmlAttributes) &&
                htmlAttributes.IndexOf(" name=", StringComparison.InvariantCultureIgnoreCase) > -1
                    ? @"<select id=""{0}"" {1}>"
                    : @"<select id=""{0}"" name=""{0}"" {1}>", name, htmlAttributes);
            if (list != null)
            {
                foreach (SelectListItem item in list)
                {
                    string selected = "";
                    if (value != null && item.Value.Equals(value.ToString()))
                    {
                        selected = "selected=\"selected\"";
                    }
                    else
                    {
                        if (item.Selected) selected = "selected=\"selected\"";
                    }
                    sBuilder.AppendFormat(@"<option title=""{0}"" value=""{1}"" {2}>{3}</option>", item.Text, item.Value, selected,Common.CharHelper.Truncate(item.Text,length));
                }
            }
            sBuilder.Append("</select>");
            return sBuilder.ToString();
        }
        public static string DropDownList(string name, object value, IEnumerable<SelectListItem> list)
        {
            return DropDownList(name, value, list, string.Empty);
        }

        public static string DropDownList(string name, IEnumerable<SelectListItem> list)
        {
            return DropDownList(name, null, list, null);
        }
        public static string DropDownList(string name, Type enumType)
        {
            return DropDownList(name, enumType, true);
        }
        public static string DropDownList(string name, Type enumType, bool isBindValue)
        {
            return DropDownList(name, null, enumType, isBindValue, null, null);
        }
        public static string DropDownList(string name, object value, Type enumType, bool isBindValue)
        {
            return DropDownList(name, value, enumType, isBindValue, null, string.Empty);
        }
        public static string DropDownList(string name, object value, Type enumType, bool isBindValue, string htmlAttributes)
        {
            return DropDownList(name, value, enumType, isBindValue, null, htmlAttributes);
        }

        public static string DropDownList(string name, object value, Type enumType, bool isBindValue,
                                          IEnumerable<SelectListItem> extraList)
        {
            return DropDownList(name, value, enumType, isBindValue, extraList, string.Empty);
        }

        public static string DropDownList(string name, object value, Type enumType, bool isBindValue, IEnumerable<SelectListItem> extraList, string htmlAttributes)
        {
            IEnumerable<SelectListItem> items = Enum.GetValues(enumType).Cast<Enum>().Where(EnumHelper.GetIsShow).Select
                (
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

            if (extraList != null)
            {
                items = extraList.Union(items);
            }
            return DropDownList(name, value,items,htmlAttributes);
        }
    }
}
