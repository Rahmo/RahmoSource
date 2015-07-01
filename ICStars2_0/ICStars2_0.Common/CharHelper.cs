using System;
using System.Text;

namespace ICStars2_0.Common
{
    public static class CharHelper
    {
        #region = 字符截断 =
        /// <summary>
        /// Truncates the specified s.
        /// </summary>
        /// <param name="s">The s.</param>
        /// <param name="length">The length.</param>
        /// <returns></returns>
        public static string Truncate(string text, int length)
        {
            StringBuilder str = new StringBuilder();

            if (length < 1 || string.IsNullOrEmpty(text) == true)
            {
                return text;
            }

            char[] TextDir = HtmlHelper.RemoveHtml(text).ToCharArray();
            char[] CharDir = text.ToCharArray(); //字符表

            int index = 0; //字符表的定位
            int count = 0; //目前的位置
            foreach (char c in TextDir)
            {
                while (c != CharDir[index])
                {
                    str.Append(CharDir[index]);
                    index++;
                    if (CharDir.Length < index) //防止数组溢出
                    {
                        break;
                    }
                }
                count += FindCharWidth(c);

                if (count / 12 > length)
                {
                    str.Append("…");
                    break;
                }
                str.Append(c);

                index++;
                if (CharDir.Length < index) //防止数组溢出
                {
                    break;
                }
            }

            return str.ToString();
        }

        public static string Truncate(string text, int length, bool pix)
        {
            StringBuilder str = new StringBuilder();

            if (length < 1 || string.IsNullOrEmpty(text) == true)
            {
                return text;
            }

            char[] AllChar ={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
'0','1','2','3','4','5','6','7','8','9',
'`','.','/','\'',';',']','[','=','-','~','!','@','#','$','%','^','&','*','(',')','_','+','?','>','<','{','}','|',':','"',
'·','，','。','、','‘','；','〕','〔','～','！','@','#','￥','％','…','&','×','（','）','—','＝','－','＋','｛','｝',
                '：','“','？','》','《','|'};
            char[] CharDir = text.ToCharArray(); //字符表
            foreach (char c in CharDir)
            {

            }

            return str.ToString();
        }

        private static int FindCharWidth(char c)
        {
            int[] charcode = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 224, 225, 232, 233, 234, 236, 237, 242, 243, 249, 250, 252, 257, 275, 283, 299, 324, 328, 333, 363, 462, 464, 466, 468, 470, 472, 474, 476, 593, 609, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 925, 926, 927, 928, 929, 931, 932, 933, 934, 935, 936, 937, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 963, 964, 965, 966, 967, 968, 969, 1025, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1066, 1067, 1068, 1069, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1105, 8364, 59335, 59336, 59393, 59394, 59395, 59396, 59397 };
            int[] charlangth = new int[] { 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 5, 5, 5, 5, 5, 3, 3, 8, 8, 8, 8, 8, 5, 5, 5, 3, 8, 8, 8, 8, 5, 3, 8, 8, 8, 8, 8, 8, 8, 8, 9, 8, 7, 8, 7, 8, 9, 9, 8, 9, 9, 9, 8, 9, 9, 7, 7, 8, 8, 8, 9, 9, 9, 8, 8, 5, 8, 5, 5, 8, 8, 3, 8, 8, 8, 8, 5, 8, 8, 8, 8, 5, 8, 7, 8, 8, 8, 7, 9, 7, 8, 7, 8, 7, 11, 8, 9, 9, 8, 8, 9, 9, 9, 7, 8, 8, 9, 9, 9, 9, 8, 8, 10, 7, 8, 8, 5, 8, 8, 5, 8, 5, 8, 5, 8, 8, 8, 8, 7, 8, 8, 8, 7, 5, 5, 7, 8, 5, 8, 8, 9, 9, 8, 8, 8, 5, 9, 8, 5, 8, 8, 8, 5, 7, 7, 7, 7 };

            int asc = (int)c;

            for (int i = 0; i < charcode.Length; i++)
            {
                if (asc == charcode[i])
                {
                    return charlangth[i];
                }
            }

            return 12;
        }
        #endregion

        #region =随机生成各种任意长度字符=
        /// <summary>
        /// 随机生成任意长度纯数字字串
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string RandomNumber(int length)
        {
            var random1 = new Random();
            return random1.Next((int)Math.Pow(10, length - 1), (int)Math.Pow(10, length) - 1).ToString();
        }
        /// <summary>
        /// 随机生成任意长度纯字母字串
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string RandomLetter(int length)
        {
            const string chars = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
            var sbCode = new StringBuilder();
            var charArray = chars.Split(',');
            var rnd = new Random();
            for (var i = 0; i < length; i++)
            {
                sbCode.Append(charArray[rnd.Next(charArray.Length)]);
            }
            return sbCode.ToString();
        }
        /// <summary>
        /// 随机生成任意长度字母数字字串
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string RandomNumberLetter(int length)
        {
            const string chars = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
            var sbCode = new StringBuilder();
            var charArray = chars.Split(',');
            var rnd = new Random();
            for (var i = 0; i < length; i++)
            {
                sbCode.Append(charArray[rnd.Next(charArray.Length)]);
            }
            return sbCode.ToString();
        }

        #endregion
    }
}
