using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace ICStars2_0.Common
{
    public class HtmlStreamFilter : Stream
    {
        Stream responseStream;
        long position;
        StringBuilder responseHtml;
        #region = CurrentEncoding =

        private Encoding _currentencoding;

        public Encoding CurrentEncoding
        {
            get { return _currentencoding; }
            set { _currentencoding = value; }
        }

        #endregion
        Func<string, string> _func;
        public HtmlStreamFilter(Stream inputStream, Encoding enc, Func<string, string> func
)
        {
            responseStream = inputStream;
            _currentencoding = enc;
            _func = func;
            responseHtml = new StringBuilder();
        }

        #region Filter overrides
        public override bool CanRead
        {
            get { return true; }
        }

        public override bool CanSeek
        {
            get { return true; }
        }

        public override bool CanWrite
        {
            get { return true; }
        }

        public override void Close()
        {
            responseStream.Close();
        }

        public override void Flush()
        {
            responseStream.Flush();
        }

        public override long Length
        {
            get { return 0; }
        }

        public override long Position
        {
            get { return position; }
            set { position = value; }
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return responseStream.Seek(offset, origin);
        }

        public override void SetLength(long length)
        {
            responseStream.SetLength(length);
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            return responseStream.Read(buffer, offset, count);
        }
        #endregion

        #region Dirty work
        public override void Write(byte[] buffer, int offset, int count)
        {
            // capture the data and convert to string 
            var data = new byte[count];
            Buffer.BlockCopy(buffer, offset, data, 0, count);
            var s = CurrentEncoding.GetString(buffer);

            // filter the string
            if (!string.IsNullOrEmpty(s))
            {
                s = _func(s);
            }
            // write the data to stream 
            var outdata = CurrentEncoding.GetBytes(s);
            responseStream.Write(outdata, 0, outdata.GetLength(0));
        }
        #endregion

    }
}
