﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Reflection;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;

namespace ICStars2_0.Common.Reflection
{
    /// <summary>
    /// 反射工具类
    /// created by lihui 2010016
    /// </summary>
    public static class ReflectionHelper
    {
        /// <summary>
        /// 用对像填充数据行DataRow，反射赋值
        /// </summary>
        /// <param name="item">对像</param>
        /// <param name="r">数据行DataRow</param>
        /// <returns>赋值的数据行DataRow</returns>
        public static DataRow FillDataRow(object item,DataRow r)
        {
            if (item == null) return r;
            Type t = item.GetType();
            foreach (PropertyInfo pi in t.GetProperties())
            {
                if (
                    r.Table.Columns.IndexOf(pi.Name) > -1)
                {
                    r[pi.Name] = pi.GetValue(item, null)?? DBNull.Value;
                }
            }
            return r;
        }
        /// <summary>
        /// 用数据行DataRow填充对像，反射赋值
        /// </summary>
        /// <param name="r">数据行DataRow</param>
        /// <param name="item">目标对像</param>
        /// <returns>赋值的对像</returns>
        public static object Fill(DataRow r, object item)
        {
            if(r==null) return item;
            Type t = item.GetType();
            foreach (PropertyInfo pi in t.GetProperties())
            {
                if (
                    r.Table.Columns.IndexOf(pi.Name) > -1
                    && r[pi.Name] != null
                    && !Convert.IsDBNull(r[pi.Name])
                    && !string.IsNullOrEmpty(Convert.ToString(r[pi.Name]))
                    )
                {
                    pi.SetValue(item, ConvertHelper.ChangeType(r[pi.Name], pi.PropertyType), null);
                }
                
            }
            return item;
        }
        public static T Fill<T>(DataRow r, T item)
        {
            if (r == null) return item;
            Type t = item.GetType();
            foreach (PropertyInfo pi in t.GetProperties())
            {
                if (
                    r.Table.Columns.IndexOf(pi.Name) > -1
                    && r[pi.Name] != null
                    && !Convert.IsDBNull(r[pi.Name])
                    && !string.IsNullOrEmpty(Convert.ToString(r[pi.Name]))
                    )
                {
                    pi.SetValue(item, ConvertHelper.ChangeType(r[pi.Name], pi.PropertyType), null);
                }
            }
            return item;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="source"></param>
        /// <param name="target"></param>
        /// <returns></returns>
        public static T Fill<S, T>(S source, T target) where T : class where S:class
        {
            if (source == null) return target;
            Type t = target.GetType();
            var sourcePi = source.GetType().GetProperties();
            foreach (PropertyInfo pi in t.GetProperties())
            {
                if (pi.PropertyType.IsGenericType) continue;
                var s = sourcePi.FirstOrDefault(p => p.PropertyType == pi.PropertyType && p.Name.Equals(pi.Name));
                if (s != null)
                {
                    pi.SetValue(target, s.GetValue(source, null), null);
                }
            }
            return target;
        }
        /// <summary>
        /// 用数组object[]填充对像，反射赋值
        /// </summary>
        /// <param name="array">数组object[]</param>
        /// <param name="item">目标对像</param>
        /// <returns>赋值的对像</returns>
        public static object Fill(object[] array, object item)
        {
            Type t = item.GetType();
            PropertyInfo[] props = t.GetProperties();
            for (int i = 0; i < props.Length; i++)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(array[i])))
                    props[i].SetValue(item, ConvertHelper.ChangeType(array[i], props[i].PropertyType), null);
            }

            return item;
        }

        /// <summary>
        /// 克隆对像
        /// </summary>
        /// <param name="o">要被克隆的对像</param>
        /// <returns>新对像</returns>
        public static object Clone(object o)
        {
            Type T = o.GetType();

            object clone = Activator.CreateInstance(T);

            foreach (PropertyInfo pi in T.GetProperties())
            {
                if (pi.CanWrite)
                {
                    pi.SetValue(clone, pi.GetValue(o, null), null);
                }
            }

            return clone;
        }
        public static T Clone<T>(T o)
        {
            var t = o.GetType();

            var clone = Activator.CreateInstance(t);

            foreach (PropertyInfo pi in t.GetProperties())
            {
                if (pi.CanWrite)
                {
                    pi.SetValue(clone, pi.GetValue(o, null), null);
                }
            }

            return (T)clone;
        }
        public static T DeepClone<T>(T obj)
        {
            using (var ms = new MemoryStream())
            {
                var formatter = new BinaryFormatter();
                formatter.Serialize(ms, obj);
                ms.Position = 0;

                return (T)formatter.Deserialize(ms);
            }
        }

        /// <summary>
        /// 根据实体点生成对应列的DataTable
        /// </summary>
        /// <param name="o">实体类对像</param>
        /// <param name="isOnlyDbField">是否只反射仅包含DbField标签的属性</param>
        /// <returns>根据实体点生成对应列的DataTable</returns>
        public static DataTable BuildTableByModel(object o, bool isOnlyDbField)
        {
            return BuildTableByModel(o.GetType(),isOnlyDbField);
        }

        /// <summary>
        /// 根据实体类生成对应列的DataTable
        /// </summary>
        /// <param name="oType">实体类对像类型</param>
        /// <param name="isOnlyDbField">是否只反射仅包含DbField标签的属性</param>
        /// <returns>根据实体点生成对应列的DataTable</returns>
        public static DataTable BuildTableByModel(Type oType, bool isOnlyDbField)
        {
            var dt = new DataTable(oType.Name);

            foreach (var mi in oType.GetMembers())
            {
                if (mi.MemberType != MemberTypes.Property) continue;
                var columnAttributes = mi.GetCustomAttributes(typeof (DbFieldAttribute), false);
                if (columnAttributes != null && columnAttributes.Length > 0)
                {
                    foreach (DbFieldAttribute attr in columnAttributes)
                    {
                        var p = (PropertyInfo) mi;
                        var dataColumn = new DataColumn
                            {
                                ColumnName = string.IsNullOrEmpty(attr.Name) ? p.Name : attr.Name,
                                DataType = Nullable.GetUnderlyingType(p.PropertyType) ?? p.PropertyType
                            };
                        dt.Columns.Add(dataColumn);
                    }
                    continue;
                }
                if (isOnlyDbField) continue;

                var prop = (PropertyInfo) mi;

                var dataColumn_ = new DataColumn { ColumnName = prop.Name, DataType = Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType };
                dt.Columns.Add(dataColumn_);

            }
            return dt;
        }

        /// <summary>
        /// 根据实体类集合生成对应列的DataTable，每个实体类作为一行数据插入
        /// </summary>
        /// <param name="ie">实体类集合</param>
        /// <param name="isOnlyDbField">是否只反射仅包含DbField标签的属性</param>
        /// <returns>包含数据行的DataTable</returns>
        public static DataTable BuildTableByModelCollection<T>(IEnumerable<T> ie, bool isOnlyDbField)
        {
            var dt = BuildTableByModel(typeof(T),isOnlyDbField);
            foreach (var model in ie)
            {
                var row = dt.NewRow();
                dt.Rows.Add(FillDataRow(model,row));
            }
            dt.AcceptChanges();
            return dt;
        }
    }
}
