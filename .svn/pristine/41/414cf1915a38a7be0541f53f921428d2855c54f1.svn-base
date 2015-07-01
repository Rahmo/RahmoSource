using System;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;
using System.Web;

namespace ICStars2_0.Common
{
    public class ImageValidator
    {
        public static readonly string CookieKey = "IMAGE_VALIDATOR_!@#456&*(0";
        /// <summary>
        /// 创建验证码
        /// </summary>
        /// <param name="sessionId">会话ID</param>
        /// <param name="CodeLen">验证码长度</param>
        /// <param name="CodeType">CodeType:0纯数字;1纯字母;2数字与字母混合;3纯汉字;</param>
        /// <param name="width">图片宽</param>
        /// <param name="height">图片长</param>
        public static string CreateVaidateCode(string sessionId, int CodeLen, int CodeType, int width, int height)
        {
            return CreateVaidateCode(sessionId, CodeLen, CodeType, width, height, string.Empty);
        }

        /// <summary>
        /// 创建验证码
        /// </summary>
        /// <param name="sessionId">会话ID</param>
        /// <param name="CodeLen">验证码长度</param>
        /// <param name="CodeType">CodeType:0纯数字;1纯字母;2数字与字母混合;3纯汉字;4自定义</param>
        /// <param name="width">图片宽</param>
        /// <param name="height">图片长</param>
        /// <param name="charList"></param>
        public static string CreateVaidateCode(string sessionId, int CodeLen, int CodeType, int width, int height,string charList)
        {
            /**参数说明：CodeLen(验证码长度）;CodeType(0纯数字，1纯字母,2,数字与字母混合，3,纯汉字)**/
            if (CodeType > 5)
            {
                CodeType = 2;
            }
            if (!(width > 0 && height > 0))
            {
                //默认图片的长宽
                width = 100;
                height = 25;
            }
            var csbuilder = new StringBuilder();
            //定义验证图片的长度与宽度
            int clen = width, cheight = height;
            //产生随机验证码
            switch (CodeType)
            {
                #region 纯数字
                case 0:
                    var random1 = new Random();
                    csbuilder.Append(random1.Next((int) System.Math.Pow(10, CodeLen - 1),
                                                   (int) System.Math.Pow(10, CodeLen) - 1));
                    break;

                #endregion

                #region 纯字母

                case 1:

                    const string vchar1 = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";

                    var vcArray1 = vchar1.Split(',');

                    var vclen1 = vcArray1.Length;

                    var random2 = new Random();

                    for (var i = 0; i < CodeLen; i++)
                    {
                        var vcindex1 = random2.Next(vclen1);
                        csbuilder.Append(vcArray1[vcindex1]);
                    }

                    break;
                #endregion

                #region 字母加数字
                case 2:

                    const string vchar2 = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";

                    var vcArray2 = vchar2.Split(',');

                    var vclen2 = vcArray2.Length;

                    var random3 = new Random();

                    for (var i = 0; i < CodeLen; i++)
                    {
                        var vcindex2 = random3.Next(vclen2);

                        csbuilder.Append(vcArray2[vcindex2]);
                    }

                    break;

                #endregion

                #region 纯汉字

                case 3:

                    //定义一个字符串数组储存汉字编码的组成元素 

                    var rBase = new[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

                    var rnd = new Random();

                    var strlength = CodeLen * 2;

                    //定义一个object数组用来 

                    var bytes = new object[strlength];

                    /**/

                    /*每循环一次产生一个含两个元素的十六进制字节数组，并将其放入bject数组中 

                     每个汉字有四个区位码组成 

                     区位码第1位和区位码第2位作为字节数组第一个元素 

                     区位码第3位和区位码第4位作为字节数组第二个元素 

                     */

                    for (var i = 0; i < strlength; i++)
                    {

                        //区位码第1位 

                        var r1 = rnd.Next(11, 14);

                        var strR1 = rBase[r1].Trim();

                        //区位码第2位 

                        rnd = new Random(r1 * unchecked((int)DateTime.Now.Ticks) + i);//更换随机数发生器的种子避免产生重复值 

                        int r2;

                        r2 = rnd.Next(0, r1 == 13 ? 7 : 16);

                        var strR2 = rBase[r2].Trim();

                        //区位码第3位 

                        rnd = new Random(r2 * unchecked((int)DateTime.Now.Ticks) + i);

                        var r3 = rnd.Next(10, 16);

                        var strR3 = rBase[r3].Trim();

                        //区位码第4位 

                        rnd = new Random(r3 * unchecked((int)DateTime.Now.Ticks) + i);

                        int r4;

                        switch (r3)
                        {
                            case 10:
                                r4 = rnd.Next(1, 16);
                                break;
                            case 15:
                                r4 = rnd.Next(0, 15);
                                break;
                            default:
                                r4 = rnd.Next(0, 16);
                                break;
                        }

                        var strR4 = rBase[r4].Trim();

                        //定义两个字节变量存储产生的随机汉字区位码 

                        var byte1 = Convert.ToByte(strR1 + strR2, 16);

                        var byte2 = Convert.ToByte(strR3 + strR4, 16);

                        //将两个字节变量存储在字节数组中 

                        var strR = new[] { byte1, byte2 };

                        //将产生的一个汉字的字节数组放入object数组中 

                        bytes.SetValue(strR, i);

                    }

                    var gb = Encoding.GetEncoding("gb2312");

                    //根据汉字编码的字节数组解码出中文汉字 

                    for (var i = 0; i < strlength / 2; i++)
                    {

                        csbuilder.Append(gb.GetString((byte[]) Convert.ChangeType(bytes[i], typeof (byte[]))));

                    }

                    break;

                #endregion

                #region 自定义 added by lihui 20110512

                case 4:

                    var vcArray4 = charList.Split(',');

                    var vclen4 = vcArray4.Length;

                    var random4 = new Random();

                    for (var i = 0; i < CodeLen; i++)
                    {
                        var vcindex4 = random4.Next(vclen4);
                        csbuilder.Append(vcArray4[vcindex4]);
                    }

                    break;
                #endregion
                #region 字母加数字(字母数字至少包含1-2位) added by lihui 20110512
                case 5:

                    const string vchar5 = "A,B,C,D,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,U,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z";
                    const string vchar6 = "2,3,4,5,6,7,8,9";

                    var vcArray5 = new ArrayList(vchar5.Split(','));
                    var vcArray6 = new ArrayList(vchar6.Split(','));
                    var random5 = new Random();
                    var sArray = new ArrayList();
                    for (var i = 0; i < CodeLen; i++)
                    {
                        if(i%2==0)
                        {
                            var index = random5.Next(vcArray5.Count);
                            sArray.Add(vcArray5[index]);
                            vcArray5.RemoveAt(index);
                        }
                        else
                        {
                            var index = random5.Next(vcArray6.Count);
                            sArray.Add(vcArray6[index]);
                            vcArray6.RemoveAt(index);
                        }
                    }
                    for (var i = 0; i < CodeLen; i++)
                    {
                        var index = random5.Next(sArray.Count);
                        csbuilder.Append(sArray[index]);
                        sArray.RemoveAt(index);
                    }
                    break;

                #endregion
            }
            var codestring = csbuilder.ToString();
            #region 创建一个图像，在图片中写文字，划干扰点，干扰线)

            using(var bitmap1 = new Bitmap(clen, cheight))
            {

                //从图像获取一个绘画面
                using (var graphics1 = Graphics.FromImage(bitmap1))
                {

                    //清除整个绘图画面并用颜色填充
                    graphics1.Clear(Color.White);
                    var Cpoint1 = new PointF(5, 5);
                    var rnd1 = new Random();

                    int x1 = 0, y1 = 0;

                    using (var pen1 = new Pen(Color.Silver))
                    {
                        //绘制边框
                        graphics1.DrawRectangle(pen1, 0, 0, bitmap1.Width - 1, bitmap1.Height - 1);
                    }
                    //绘制干扰点
                    rnd1 = new Random();
                    for (int i = 0; i < 50*CodeLen; i++)
                    {
                        //随机干扰位置
                        x1 = rnd1.Next(bitmap1.Width);
                        y1 = rnd1.Next(bitmap1.Height);
                        bitmap1.SetPixel(x1, y1, Color.FromArgb(rnd1.Next(50), rnd1.Next(50), rnd1.Next(50)));
                    }

                    //绘制干扰线
                    rnd1 = new Random();
                    for (int i = 0; i < 3; i++)
                    {
                        //随机干扰位置
                        x1 = rnd1.Next(bitmap1.Width);
                        y1 = rnd1.Next(bitmap1.Height);
                        int x2 = rnd1.Next(bitmap1.Width);
                        int y2 = rnd1.Next(bitmap1.Height);
                        //随机干扰线颜色
                        using (Pen pen1 = new Pen(
                            Color.FromArgb(rnd1.Next(100, 255), rnd1.Next(100, 255), rnd1.Next(100, 255)),
                            7 * height / 40))
                        {
                            graphics1.DrawLine(pen1, x1, y1, x2, y2);
                        }
                    }

                    //绘制文字

                    //默认文字字体 、大小、字型、
                    using (Font Cfont = new Font("Arial", 22*height/40, FontStyle.Bold))
                    {
                        for (int i = 0; i < codestring.Length; i++)
                        {
                            //随机字符位置
                            x1 = rnd1.Next(10*height/40) + 28*i*height/40;
                            y1 = rnd1.Next((bitmap1.Height - 22*height/40)/2*height/40);
                            Cpoint1 = new PointF(x1, y1);
                            //随机字符颜色,应根据背景作适当调整以免显示模糊不清（graphics1.Clear(Color.White);这个修改背景色）
                            using (
                                var brush1 =
                                    new SolidBrush(Color.FromArgb(rnd1.Next(100), rnd1.Next(100), rnd1.Next(100))))
                            {
                                //绘制文字
                                graphics1.DrawString(codestring.Substring(i, 1), Cfont, brush1, Cpoint1);
                            }
                            graphics1.ResetTransform();

                        }
                    }

                    #endregion

                    //输出图片
                    HttpContext.Current.Response.ContentType = "image/jpeg";
                    bitmap1.Save(HttpContext.Current.Response.OutputStream, ImageFormat.Jpeg);
                    
                }
            }
            HttpContext.Current.Response.Cookies[sessionId].Value = MathHelper.Md5(string.Concat(codestring.ToLower(), CookieKey));
            return codestring;
        }

    }
}
