using System;
using System.Threading;

namespace ICStars2_0.Common
{

    /// <summary>
    /// 类型转换
    /// created by lihui 20100716
    /// </summary>
    public static class ConvertHelper
    {
        public static T To<T>(this IConvertible obj)
        {
            Type t = typeof(T);
            Type u = Nullable.GetUnderlyingType(t);

            if (u != null)
            {
                if (obj == null)
                    return default(T);

                return (T)Convert.ChangeType(obj, u);
            }
            else
            {
                return (T)Convert.ChangeType(obj, t);
            }
        }
        #region = ChangeType =
        public static object ChangeType(object obj, Type conversionType)
        {
            return ChangeType(obj, conversionType, Thread.CurrentThread.CurrentCulture);
        }

        public static object ChangeType(object obj, Type conversionType, IFormatProvider provider)
        {

            #region Nullable
            Type nullableType = Nullable.GetUnderlyingType(conversionType);
            if (nullableType != null)
            {
                if (obj == null || string.IsNullOrEmpty(obj.ToString()))
                {
                    return null;
                }
                return Convert.ChangeType(obj, nullableType, provider);
            }
            #endregion
            if (typeof(System.Enum).IsAssignableFrom(conversionType))
            {
                return Enum.Parse(conversionType, obj.ToString());
            }
            return Convert.ChangeType(obj, conversionType, provider);
            
        }
        #endregion

    }
}
