namespace ICStars2_0.Common
{
    public static class RegexHelper
    {
        public const string Mobile = @"^(13[0-9]|15[^4]|18[^4])\d{8}$";
        public const string Phone = @"^[0-9-]{9,15}$";
        public const string Number = @"^[+-]?\d*([\.]?|(\.\d*))$";
        public const string Email = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
        public const string Chinese = @"^[\u0391-\uFFE5]+$";
    }
}
