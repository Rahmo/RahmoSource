using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace ICStars2_0.Common
{
    public static class ImageHelper
    {
        #region = ResizeImageFile =
        /// <summary>
        /// 缩放图像文件
        /// </summary>
        /// <example>
        ///     <asp:FileUpload ID="PhotoFile" Runat="server" Width="416" FileBytes='<%# Bind("BytesOriginal") %>' />
        ///     command.Parameters.Add(new SqlParameter("@BytesPoster", ResizeImageFile(BytesOriginal, 198)));
        /// 
        /// FileInfo f
        /// byte[] buffer = new byte[f.OpenRead().Length];
        /// f.OpenRead().Read(buffer, 0, (int) f.OpenRead().Length);
        /// (new PhotoManager()).AddPhoto(Convert.ToInt32(Request.QueryString["AlbumID"]), f.Name, buffer);
        /// </example>
        /// <param name="imageFile">图像文件</param>
        /// <param name="targetSize">目标宽度</param>
        /// <returns></returns>
        public static byte[] ResizeImageFile(byte[] imageFile, int targetSize)
        {
            System.Drawing.Image original = System.Drawing.Image.FromStream(new MemoryStream(imageFile));
            int targetH, targetW;
            if (original.Height > original.Width)
            {
                targetH = targetSize;
                targetW = (int)(original.Width * ((float)targetSize / (float)original.Height));
            }
            else
            {
                targetW = targetSize;
                targetH = (int)(original.Height * ((float)targetSize / (float)original.Width));
            }
            System.Drawing.Image imgPhoto = System.Drawing.Image.FromStream(new MemoryStream(imageFile));
            // Create a new blank canvas.  The resized image will be drawn on this canvas.
            Bitmap bmPhoto = new Bitmap(targetW, targetH, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(72, 72);
            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.SmoothingMode = SmoothingMode.AntiAlias;
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            grPhoto.DrawImage(imgPhoto, new Rectangle(0, 0, targetW, targetH), 0, 0, original.Width, original.Height, GraphicsUnit.Pixel);
            // Save out to memory and then to a file.  We dispose of all objects to make sure the files don't stay locked.
            MemoryStream mm = new MemoryStream();
            bmPhoto.Save(mm, System.Drawing.Imaging.ImageFormat.Jpeg);
            original.Dispose();
            imgPhoto.Dispose();
            bmPhoto.Dispose();
            grPhoto.Dispose();
            return mm.GetBuffer();
        }
        public static void ResizeImageFile(Stream imageFile, int targetWidth,int targetHeight, string targetPath)
        {
            System.Drawing.Image original = System.Drawing.Image.FromStream(imageFile);
            ResizeImageFile(original, targetWidth, targetHeight, targetPath, ImageFormat.Jpeg);
        }
        public static void ResizeImageFile(Stream imageFile, int targetSize, string targetPath)
        {
            ResizeImageFile(imageFile, targetSize, targetPath, ImageFormat.Jpeg);
        }

        public static void ResizeImageFile(Stream imageFile, int targetSize, string targetPath, ImageFormat imageFormat)
        {
            System.Drawing.Image original = System.Drawing.Image.FromStream(imageFile);
            ResizeImageFile(original, targetSize, targetPath, imageFormat);
        }
        public static void ResizeImageFile(string imageFile, int targetSize, string targetPath, ImageFormat imageFormat)
        {
            Image original = Image.FromFile(imageFile);
            ResizeImageFile(original, targetSize, targetPath, imageFormat);
        }
        public static void ResizeImageFile(Image original, int targetWidth, int targetHeight, string targetPath, ImageFormat imageFormat)
        {
            ResizeImageFile(original, targetWidth, targetHeight, 0, 0, targetPath, imageFormat);
        }

        public static void ResizeImageFile(Stream imageFile, int targetWidth, int targetHeight, int targetMaxWidth, int targetMaxHeight, string targetPath)
        {
            System.Drawing.Image original = System.Drawing.Image.FromStream(imageFile);
            ResizeImageFile(original, targetWidth, targetHeight, targetMaxWidth, targetMaxHeight, targetPath);
        }

        public static void ResizeImageFile(Image original, int targetWidth, int targetHeight, int targetMaxWidth, int targetMaxHeight, string targetPath)
        {
            ResizeImageFile(original, targetWidth, targetHeight, targetMaxWidth, targetMaxHeight, targetPath,
                            ImageFormat.Jpeg);
        }
        private static void CalculateMaxWidth(int originalWidth,int originalHeight, int targetMaxWidth,out int targetWidth,out int targetHeight)
        {
            targetWidth = targetMaxWidth > originalWidth ? originalWidth : targetMaxWidth;
            targetHeight = (int)(originalHeight * ((float)targetWidth / (float)originalWidth));
        }
        private static void CalculateMaxHeight(int originalWidth, int originalHeight, int targetMaxHeight, out int targetWidth, out int targetHeight)
        {
            targetHeight = targetMaxHeight > originalHeight ? originalHeight : targetMaxHeight;
            targetWidth = (int)(originalWidth * ((float)targetHeight / (float)originalHeight));
            
        }
        public static void ResizeImageFile(Image original, int targetWidth, int targetHeight, int targetMaxWidth, int targetMaxHeight, string targetPath, ImageFormat imageFormat)
        {
            if(targetWidth<1)
            {
                targetWidth = (int)(original.Width * ((float)targetHeight / (float)original.Height));
            }
            if (targetHeight < 1)
            {
                targetHeight = (int)(original.Height * ((float)targetWidth / (float)original.Width));
            }

            if (targetMaxWidth > 0 && original.Width > original.Height)
            {
                CalculateMaxWidth(original.Width, original.Height, targetMaxWidth, out targetWidth, out targetHeight);
            }
            if (targetMaxHeight > 0 && original.Height > original.Width)
            {
                int newTargetWidth;
                int newTargetHeight;
                CalculateMaxHeight(original.Width, original.Height, targetMaxHeight, out newTargetWidth, out newTargetHeight);
                if(newTargetWidth>targetMaxWidth)
                {
                    CalculateMaxWidth(original.Width, original.Height, targetMaxWidth, out targetWidth, out targetHeight);
                }
                else
                {
                    targetWidth = newTargetWidth;
                    targetHeight = newTargetHeight;
                }
            }
            string targetDirpath = targetPath.Replace(Path.GetFileName(targetPath), string.Empty);
            if (System.IO.Directory.Exists(targetDirpath) == false)
            {
                System.IO.Directory.CreateDirectory(targetDirpath);
            }
            Bitmap bmpCanvas = new Bitmap(targetWidth, targetHeight, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            bmpCanvas.SetResolution(72, 72);
            for (int i = 0; i < bmpCanvas.Width; i++)
            {
                for (int j = 0; j < bmpCanvas.Height; j++)
                {
                    bmpCanvas.SetPixel(i, j, Color.Transparent);
                }
            }
            Graphics g = Graphics.FromImage(bmpCanvas);
            g.SmoothingMode = SmoothingMode.AntiAlias;
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
            g.PixelOffsetMode = PixelOffsetMode.HighQuality;
            g.DrawImage(original, new Rectangle(0, 0, targetWidth, targetHeight), 0, 0, original.Width, original.Height, GraphicsUnit.Pixel);
            g.Dispose();
            bmpCanvas.Save(targetPath, imageFormat);
            bmpCanvas.Dispose();
            //if (quantizedImage != null) quantizedImage.Dispose();
            original.Dispose();
        }
        public static void ResizeImageFile(Image original, int targetSize, string targetPath, ImageFormat imageFormat)
        {
            int targetH = original.Height;
            int targetW = original.Width;
            if (original.Height > original.Width && original.Height > targetSize)
            {
                targetH = targetSize;
                targetW = (int)(original.Width * ((float)targetSize / (float)original.Height));
            }
            else if (original.Height <= original.Width && original.Width > targetSize)
            {
                targetW = targetSize;
                targetH = (int)(original.Height * ((float)targetSize / (float)original.Width));
            }
            ResizeImageFile(original, targetW, targetH, targetPath, imageFormat);
        }
        #endregion
    }
}
