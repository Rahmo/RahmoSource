using System.Configuration;

namespace ICStars2_0.Common.ConfigSections
{
    public enum Mode
    {
        /// <summary>
        /// Indicates that the module is "on" and all requests should be evaluated.
        /// </summary>
        On,

        /// <summary>
        /// The module is "off" and no evaluation should occur.
        /// </summary>
        Off
    }
    /// <summary>
    /// Indicates the type of security to apply to a matched request.
    /// </summary>
    public enum RequestSecurity
    {
        /// <summary>
        /// The request should be made secure, if necessary.
        /// </summary>
        /// <remarks>This is the default for a PathSetting that does not specify its security.</remarks>
        Secure,

        /// <summary>
        /// The request should be ignored.
        /// </summary>
        Ignore
    }
    /// <summary>
    /// The possible types to match request paths by.
    /// </summary>
    public enum PathMatchType
    {
        /// <summary>
        /// An exact match with a request path is needed for action to be considered.
        /// </summary>
        Exact,


        /// <summary>
        /// The start of request paths are matched against (e.g. ~/Administration/).
        /// All requests with a path that start with the specified path to match will have action taken.
        /// </summary>
        /// <remarks>This is the default for a PathSetting that does not specify its matchType.</remarks>
        StartsWith
    }
    internal sealed class ElementNames
    {
        internal const string Mode = "mode";

        internal const string Paths = "paths";
        internal const string MatchType = "matchType";
        internal const string Path = "path";
        internal const string Security = "security";
    }
    public class HttpsConfiguration : ConfigurationSection
    {
        [ConfigurationProperty(ElementNames.Mode, DefaultValue = Mode.On)]
        public Mode Mode
        {
            get { return this[ElementNames.Mode] is Mode ? (Mode) this[ElementNames.Mode] : Mode.On; }
        }

        [ConfigurationProperty(ElementNames.Paths, IsRequired = true)]
        public HttpsPathCollection Paths
        {
            get
            {
                return this[ElementNames.Paths] as HttpsPathCollection;
            }
        }
    }
    public class HttpsPathCollection:ConfigurationElementCollection
    {
        public HttpsPath this[int index]
        {
            get
            {
                return base.BaseGet(index) as HttpsPath;
            }
            set
            {
                if (base.BaseGet(index) != null)
                {
                    base.BaseRemoveAt(index);
                }

                this.BaseAdd(index, value);
            }
        }
        protected override ConfigurationElement CreateNewElement()
        {
            return new HttpsPath();
        }

        protected override object GetElementKey(ConfigurationElement element)
        {
            return ((HttpsPath)element).Path;
        }
    }
    public class HttpsPath:ConfigurationElement
    {
        [ConfigurationProperty(ElementNames.Path)]
        public string Path
        {
            get
            {
                return this[ElementNames.Path] as string;
            }
        }

        [ConfigurationProperty(ElementNames.MatchType, DefaultValue=PathMatchType.StartsWith)]
        public PathMatchType MatchType
        {
            get
            {
                return this[ElementNames.MatchType] is PathMatchType ? (PathMatchType) this[ElementNames.MatchType] : PathMatchType.Exact;
            }
        }

        [ConfigurationProperty(ElementNames.Security,DefaultValue=RequestSecurity.Secure)]
        public RequestSecurity Security
        {
            get
            {
                return this[ElementNames.Security] is RequestSecurity ? (RequestSecurity) this[ElementNames.Security] : RequestSecurity.Secure;
            }
        }
    }
}
