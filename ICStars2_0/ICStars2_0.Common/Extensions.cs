using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace ICStars2_0.Common
{
    public static class Extensions
    {
        public static IList<T> Clone<T>(this IList<T> listToClone) where T : ICloneable
        {
            return listToClone.Select(item => (T) item.Clone()).ToList();
        }

        #region = Each =
        public static void Each<TSource>(this IEnumerable<TSource> array, Action<TSource> action)
        {
            IEnumerator<TSource> enumerator = array.GetEnumerator();

            while (enumerator.MoveNext())
            {
                action(enumerator.Current);
            }
        }

        public static void Each<TSource>(this IEnumerable<TSource> array, Action<TSource, int> action)
        {
            IEnumerator<TSource> enumerator = array.GetEnumerator();
            int i = 0;
            while (enumerator.MoveNext())
            {
                action(enumerator.Current, i);
                i++;
            }
        }

        public static void Each<TSource>(this IEnumerable<TSource> array, Func<TSource, bool> action)
        {
            IEnumerator<TSource> enumerator = array.GetEnumerator();

            while (enumerator.MoveNext())
            {
                if (action(enumerator.Current) == false)
                {
                    break;
                }
            }
        }

        public static void Each<TSource>(this IEnumerable<TSource> array, Func<TSource, int, bool> action)
        {
            IEnumerator<TSource> enumerator = array.GetEnumerator();
            int i = 0;
            while (enumerator.MoveNext())
            {
                if (action(enumerator.Current, i) == false)
                {
                    break;
                }

                i++;
            }
        }

        #endregion

        #region = Merger =
        /// <summary>
        /// 合并
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TKey"></typeparam>
        /// <param name="source"></param>
        /// <param name="keySelector"></param>
        /// <param name="operation"></param>
        /// <returns></returns>
        public static IEnumerable<TSource> Merger<TSource, TKey>(this IEnumerable<TSource> source,
        Func<TSource, TKey> keySelector,
        Func<TSource, TSource, TSource> operation
        )
        {
            List<TSource> retVal = new List<TSource>();
            //source = source.OrderBy(keySelector);

            TSource item = source.ElementAt(0);
            for (int i = 0; i < source.Count(); i++)
            {
                TKey current = keySelector(item);
                int j = i + 1;
                if (j < source.Count())
                {
                    TKey next = keySelector(source.ElementAt(j));

                    if (next.Equals(current) == true)
                    {
                        item = operation(item, source.ElementAt(j));
                    }
                    else
                    {
                        retVal.Add(item);
                        item = source.ElementAt(j);
                    }
                }
                else
                {
                    retVal.Add(item);
                }
            }

            return retVal;
        }
        #endregion

        #region = PivotPrint =
        /// <summary>
        /// 交叉表按CSV格式打印输出
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <param name="source">操作的源数据</param>
        /// <param name="Xaxis">X轴</param>
        /// <param name="Yaxis">Y轴</param>
        public static string PivotPrint<TSource>(
            this IEnumerable<TSource> source,
            Func<TSource, string> Xaxis, //Question
            Func<TSource, string> Yaxis, //UserID
            Func<TSource, string> Content //Content
            )
        {
            if (source.Count() == 0)
            {
                return string.Empty;
            }
            StringBuilder str = new StringBuilder();
            string[] allX = source.ToLookup(Xaxis).Select(x => x.Key).ToArray(); //所有X轴的值 Question

            //打出头信息
            str.AppendLine("," + allX.Aggregate((a, b) => a + "," + b));

            source.GroupBy(Yaxis).Each(g =>
            {
                str.AppendFormat("{0},", g.Key);
                foreach (string x in allX)
                {

                    var item = g.Where(p => Xaxis(p) == x);
                    string value = (item.Count() == 0) ? string.Empty :
                        item.Select(Content).Aggregate((a, b) => a + ";" + b);
                    str.AppendFormat("\"{0}\",", value.Replace("\"", "\"\""));
                }
                str.Append(System.Environment.NewLine);
            });
            return str.ToString();
        }
        #endregion

        #region =ToString=
        public static string ToString(this IEnumerable<string> array,  string separateChar)
        {
            var str = new StringBuilder();

            foreach (var s in array)
            {
                str.Append(s);
                str.Append(separateChar);
            }

            return Regex.Replace(str.ToString(), separateChar + "$", string.Empty);
        }
        public static string ToString(this IEnumerable<string> array)
        {
            return ToString(array, ",");
        }

        #endregion


        public static int ToInt32(this string s)
        {
            return Convert.ToInt32(s);
        }
        public static int ToInt32(this string s,int defaultValue) {
            int rv = defaultValue;
            if (Int32.TryParse(s, out rv))
                return rv;
            return rv;
        }
        public static int? ToNullableInt32(this string s, int? defaultValue=null)
        {
            if (string.IsNullOrEmpty(s)) return defaultValue;
            var rv = 0;
            if (Int32.TryParse(s, out rv))
                return rv;
            return null;
        }
        public static double? ToNullableDouble(this string s, double? defaultValue = null)
        {
            if (string.IsNullOrEmpty(s)) return defaultValue;
            var rv = 0.00;
            if (Double.TryParse(s, out rv))
                return rv;
            return null;
        }
        public static int[] ToInt32<T>(this T[] o)
        {
            List<int> list = new List<int>();
            foreach (T s in o)
            {
                list.Add(Convert.ToInt32(s));
            }
            return list.ToArray();
        }
        public static string ToString<T>(this IEnumerable<T> o, string separateChar)
        {
            StringBuilder str = new StringBuilder();

            foreach (T s in o)
            {
                str.Append(s);
                str.Append(separateChar);
            }

            return Regex.Replace(str.ToString(), separateChar + "$", string.Empty);
        }
        public static string ToString<T>(this T[] o, string separateChar)
        {
            StringBuilder str = new StringBuilder();

            foreach (T s in o)
            {
                str.Append(s);
                str.Append(separateChar);
            }

            return Regex.Replace(str.ToString(), separateChar + "$", string.Empty);
        }
        /// <summary>
        /// 判断两个数组值对等
        /// </summary>
        /// <typeparam name="T">数组元素类型</typeparam>
        /// <param name="array1">原数组</param>
        /// <param name="array2">目标数组</param>
        /// <returns>对等 true 不对等 false</returns>
        public static bool IsEquals<T>(this T[] array1, T[] array2)
        {
            //比较类型是否一样
            //if (!Object.ReferenceEquals(array1.GetType(), array2.GetType()))
            //{
            //    return false;
            //}
            if (array1 == null && array2 == null) return true;
            if (array1 == null && array2 != null) return false;
            if (array1 != null && array2 == null) return false;

            //比较长度是否一样
            if (array1.Length != array2.Length) return false;
            //if (array1.GetLength(0) != array2.GetLength(0))
            //{
            //    return false;
            //}

            //比较成员是否对应相等
            for (int i = 0; i < array1.GetLength(0); i++)
            {
                if (array1.GetValue(i).Equals(array2.GetValue(i)) == false)
                {
                    return false;
                }
            }
            return true;
        }
        public static bool Remove<T>(this T[] source, T t)
        {
            List<T> array = new List<T>((T[])source.Clone());
            array.Remove(t);
            source = array.ToArray();
            return true;
        }
        public static T[] Slice<T>(this T[] source, int index, int count)
        {
            if (index < 0 || count < 0 || source.Length - index < count)
                throw new ArgumentException();
            T[] result = new T[count];
            Array.Copy(source, index, result, 0, count);
            return result;
        }
        /// <summary>
        /// 泛型集合方法扩展
        /// </summary>
        /// <typeparam name="T">类型</typeparam>
        /// <param name="source">待扩展的泛型集合</param>
        /// <param name="comparison">自定义比较委托</param>
        /// <returns>符合自定义委托条件的结果(T)</returns>
        public static T Find<T>(this List<T> source, Comparison<T> comparison)
        {
            T t = default(T);
            for (int i = 0; i < source.Count; i++)
            {
                if (comparison(source[i], t) > 0)
                {
                    t = source[i];
                }
            }
            return t;
        }
    }
}
