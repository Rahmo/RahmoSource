using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model.Settings
{
    public class MemberCollectionSettings
    {
        public MemberType MemberType { get; set; }
        public MemberType ExcludedMemberType { get; set; }
        public bool IsUnverified { get; set; }
        public string[] MemberRoles { get; set; }
        public bool IsInitalize { get; set; }
        public MemberCollectionSettings()
        {
            MemberType = MemberType.NULL;
            ExcludedMemberType = MemberType.NULL;
        }
    }
}
