using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Reflection;

namespace ICStars2_0.Common.Reflection
{
    /// <summary>
    /// SqlParameter的操作类
    /// created by lihui 20100613
    /// </summary>
    public class ParameterHelper
    {
        #region = JoinSqlParameter =
        /// <summary>
        /// 合并SqlParameter数组
        /// </summary>
        /// <param name="oldparms">原SqlParameter数组</param>
        /// <param name="newparms">新SqlParameter数组</param>
        /// <returns>合并后的SqlParameter数组</returns>
        public static List<SqlParameter> JoinSqlParameter(List<SqlParameter> oldparms, List<SqlParameter> newparms)
        {
            if (newparms != null && newparms.Count != 0)
            {
                foreach (SqlParameter pa in newparms)
                {
                    if (oldparms.Contains(pa) == false)
                    {
                        oldparms.Add(pa);
                    }
                }
            }
            return oldparms;
        }

        #endregion

        #region = ConvertToListSqlParameter =
        /// <summary>
        /// SqlParameter[]转换成 List SqlParameter
        /// </summary>
        /// <param name="sqlParms">SqlParameter[]参数</param>
        /// <returns>List SqlParameter</returns>
        public static List<SqlParameter> ConvertToListSqlParameter(SqlParameter[] sqlParms)
        {
            List<SqlParameter> parms = new List<SqlParameter>();

            if (sqlParms != null && sqlParms.Length > 0)
            {
                foreach (SqlParameter p in sqlParms)
                {
                    parms.Add(p);
                }
            }

            return parms;
        }

        #endregion

        #region = GetClassSqlParameters =
        /// <summary>
        /// 通过Model类获取属性的SqlParameter数组
        /// </summary>
        /// <param name="classObject">Model类</param>
        /// <returns>SqlParameter数组</returns>
        public static SqlParameter[] GetClassSqlParameters(object classObject)
        {
            return GetClassSqlParameters(classObject, false);
        }

        /// <summary>
        /// 通过Model类获取属性的SqlParameter数组
        /// </summary>
        /// <param name="classObject">Model类</param>
        /// <param name="isOnlyDbField">是否只反射仅包含DbField标签的属性</param>
        /// <returns>SqlParameter数组</returns>
        public static SqlParameter[] GetClassSqlParameters(object classObject,bool isOnlyDbField)
        {
            var sqlParms = new List<SqlParameter>();
            var oType = classObject.GetType();
            foreach (var mi in oType.GetMembers())
            {
                if (mi.MemberType != MemberTypes.Property) continue;
                var p = (PropertyInfo)mi;
                var pName = p.Name;
                var v = p.GetValue(classObject, null);
                DbFieldAttribute dbFieldAttribute = null;
                var columnAttributes = mi.GetCustomAttributes(typeof(DbFieldAttribute), false);
                if (columnAttributes != null && columnAttributes.Length > 0)
                {
                    dbFieldAttribute = columnAttributes[0] as DbFieldAttribute;
                }
                //只反射带DbField标签的属性
                if (isOnlyDbField && dbFieldAttribute == null) continue;
                if (p.PropertyType == typeof(DateTime) && v.Equals(DateTime.MinValue))
                {
                    v = null;
                }
                if (typeof(System.Enum).IsAssignableFrom(p.PropertyType))
                {
                    if(v != null && EnumHelper.IsString((Enum)Enum.Parse(p.PropertyType,v.ToString())))
                    {
                        v = v.ToString();
                    }
                }
                if (dbFieldAttribute != null && !string.IsNullOrEmpty(dbFieldAttribute.Name))
                {
                    pName = dbFieldAttribute.Name;
                }
                var parm = new SqlParameter(string.Concat("@", pName), v ?? DBNull.Value);
                if (dbFieldAttribute != null)
                {
                    if (dbFieldAttribute.Size > 0)
                    {
                        parm.Size = dbFieldAttribute.Size;
                    }
                }
                if (sqlParms.Contains(parm) == false)
                {
                    sqlParms.Add(parm);
                }
            }
            return sqlParms.ToArray();
        }

        #endregion

        #region = GetClassOleDbParameters =

        /// <summary>
        /// 通过Model类获取属性的OleDbParameter数组
        /// </summary>
        /// <param name="classObject">Model类</param>
        /// <returns>OleDbParameter数组</returns>
        public static OleDbParameter[] GetClassOleDbParameters(object classObject)
        {
            Hashtable ht = new Hashtable();
            Type oType = classObject.GetType();
            foreach (MemberInfo mi in oType.GetMembers())
            {
                if (mi.MemberType != MemberTypes.Property) continue;
                object[] columnAttributes = mi.GetCustomAttributes(typeof(DbFieldAttribute), false);
                if (columnAttributes != null && columnAttributes.Length > 0)
                {
                    foreach (DbFieldAttribute attr in columnAttributes)
                    {
                        var p = (PropertyInfo)mi;

                        if (ht.ContainsKey(attr.Name) == false)
                        {
                            ht.Add(attr.Name, p.GetValue(classObject, null));
                        }
                    }
                }
                else
                {
                    PropertyInfo p = (PropertyInfo)mi;
                    if (ht.ContainsKey(p.Name) == false)
                    {
                        ht.Add(p.Name, p.GetValue(classObject, null));
                    }
                }
            }
            List<OleDbParameter> sqlParms = new List<OleDbParameter>();
            foreach (object column in ht.Keys)
            {
                OleDbParameter parm = new OleDbParameter("@" + (string)column, ht[column]);
                if (sqlParms.Contains(parm) == false)
                {
                    sqlParms.Add(parm);
                }
            }
            return sqlParms.ToArray();
        }

        #endregion
    }
}
