using Microsoft.Practices.Unity;

namespace ICStars2_0.Framework
{
    /// <summary>
    /// UnityContainer Singleton Instance for Mkt
    /// created by lihui 20110322
    /// </summary>
    public static class ICStarsUnityContainer
    {
        private static IUnityContainer _current;
        private static readonly object Locker=new object();
        public static IUnityContainer Current {
            get
            {
                    if(_current==null)
                    {
                        lock(Locker)
                        {
                            if (_current == null)
                            {
                                _current = new UnityContainer();
                            }
                        }
                    }
                return _current;
            }
        }
    }
}
