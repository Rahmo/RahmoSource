using System;
using System.IO;
using System.Web;

namespace ICStars2_0.Mvc
{
    public static class FileHelper
    {/// <summary>
        /// 构建HTTP上传文件的临时文件
        /// Created by lihui 20100623
        /// </summary>
        /// <param name="postedFile">HTTP上传文件</param>
        /// <returns>返回临时文件全路径</returns>
        public static string BuildTemp(HttpPostedFileBase postedFile)
        {
            string tmpPath = System.IO.Path.GetTempPath();
            if (string.IsNullOrEmpty(tmpPath)) tmpPath = "c:\\";
            FileInfo fi = new FileInfo(postedFile.FileName);
            string tmpFilePath = string.Format("{0}{1}{2}", tmpPath, Guid.NewGuid(), fi.Extension);
            postedFile.SaveAs(tmpFilePath);
            return tmpFilePath;
        }
    }
}
