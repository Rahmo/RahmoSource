using System;
using System.Collections.Generic;
using System.Web;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Student
{
    /// <summary>
    /// Summary description for CheckCourseDPUID
    /// </summary>
    [Authorize(Roles = "admin,admin_student,Staff,SLC,CSSP")]
    public class CheckCourseDPUID : IHttpHandler
    {

        private IStudentFactory _studentFactory;
        [Dependency]
        public IStudentFactory StudentFactory
        {
            get { return _studentFactory; }
            set { _studentFactory = value; }
        }
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();

            string courseId = context.Request.QueryString["cid"];
            string dpuId = context.Request.QueryString["dpuid"];
            string sid = context.Request.QueryString["sid"];
            if (string.IsNullOrEmpty(sid)) sid = "0";
            bool result = StudentFactory.Exist(Convert.ToInt32(sid),Convert.ToInt32(courseId), dpuId);
            context.Response.Write(result.ToString().ToLower());
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}