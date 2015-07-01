using System;
using System.IO;
using System.Text;
using System.Web;

namespace ICStars2_0.Common
{
    public static class FileHelper
    {
        private static readonly object Locker = new object();
        /// <summary>
        /// 构建HTTP上传文件的临时文件
        /// Created by lihui 20100623
        /// </summary>
        /// <param name="postedFile">HTTP上传文件</param>
        /// <returns>返回临时文件全路径</returns>
        public static string BuildTemp(HttpPostedFile postedFile)
        {
            string tmpPath = System.IO.Path.GetTempPath();
            if (string.IsNullOrEmpty(tmpPath)) tmpPath = "c:\\";
            FileInfo fi = new FileInfo(postedFile.FileName);
            string tmpFilePath = string.Format("{0}{1}{2}", tmpPath, Guid.NewGuid(), fi.Extension);
            postedFile.SaveAs(tmpFilePath);
            return tmpFilePath;
        }
        public static void StreamToFile(Stream stream, string fileName)
        {
            // 把 Stream 转换成 byte[]
            byte[] bytes = new byte[stream.Length];
            stream.Read(bytes, 0, bytes.Length);
            // 设置当前流的位置为流的开始
            stream.Seek(0, SeekOrigin.Begin);
            // 把 byte[] 写入文件
            FileStream fs = new FileStream(fileName, FileMode.Create);
            BinaryWriter bw = new BinaryWriter(fs);
            bw.Write(bytes);
            bw.Close();
            fs.Close();
        }

        #region - ReadText -
        public static string ReadText(string FileName_FullPath, Encoding encode)
        {
            FileInfo fi = new FileInfo(FileName_FullPath);
            return ReadText(fi, encode);
        }
        public static string ReadText(FileInfo fi, Encoding encode)
        {
            StringBuilder str = new StringBuilder();

            if (fi.Exists == true)
            {
                try
                {
                    // Create an instance of StreamReader to read from a file.
                    // The using statement also closes the StreamReader.
                    using (StreamReader sr = new StreamReader(fi.FullName, encode))
                    {
                        String line;
                        // Read and display lines from the file until the end of 
                        // the file is reached.
                        while ((line = sr.ReadLine()) != null)
                        {
                            str.Append(line + "\n");
                        }
                    }


                }
                catch (Exception e)
                {
                    // Let the user know what went wrong.
                    str.Append("The file could not be read:");
                    str.Append(e.Message);
                }

                return str.ToString();

            }

            return "File is not Exists";
        }
        public static string ReadText(FileInfo file)
        {
            return ReadText(file, Encoding.GetEncoding("GB2312"));

        }
        public static string ReadText(string FileName_FullPath)
        {
            return ReadText(FileName_FullPath, Encoding.GetEncoding("GB2312"));

        }
        #endregion

        #region - WriteText -
        public static void WriteText(string FileName_FullPath, string strContent, bool IsAppend)
        {
            WriteText(FileName_FullPath, strContent, IsAppend, Encoding.GetEncoding("gb2312"));
        }
        public static void WriteText(string FileName_FullPath, string strContent, bool IsAppend, Encoding encoding)
        {
            FileInfo fi = new FileInfo(FileName_FullPath);

            if (fi.Exists == false)
            {
                DirectoryInfo di = new DirectoryInfo(fi.DirectoryName);

                if (di.Exists == false)
                {
                    //FileHelper.WriteText(@"c:\1.txt", di.FullName);
                    di.Create();
                }
                using (FileStream fs = fi.Create())
                {
                }

                IsAppend = false;
            }
            lock (Locker)
            {
                if (IsAppend == true)
                {
                    using (StreamWriter sw = fi.AppendText())
                    {
                        sw.Write(strContent);
                        sw.Flush();
                        sw.Close();
                    }

                }
                else
                {
                    using (StreamWriter sw = new StreamWriter(FileName_FullPath, false, encoding))
                    {

                        sw.Write(strContent);
                        sw.Flush();
                        sw.Close();
                    }
                }
            }

        }

        public static void WriteText(string FileName_FullPath, string strContent)
        {
            WriteText(FileName_FullPath, strContent, false);
        }
        #endregion
    }
}
