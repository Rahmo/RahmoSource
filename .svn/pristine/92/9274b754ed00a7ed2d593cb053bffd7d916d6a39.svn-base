using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Framework
{
    /// <summary>
    /// created by li hui
    /// </summary>
    public static class ICStarsUnityFactory
    {
        //private static readonly ILog Logger = LogManager.GetLogger(typeof(ICStarsUnityFactory));
        /// <summary>
        /// auto register all instance for unitycontainer
        /// created by li hui 
        /// </summary>
        public static void RegisterDependency()
        {

            var assemblies =
                ConfigurationManager.AppSettings["InjectionDllPaths"].Split('|')
                    .Select(p => Assembly.LoadFrom(HttpContext.Current.Server.MapPath(p)));
            

            var typeList= assemblies.SelectMany(assembly => assembly.GetTypes());

            var iSingletonRegisterTypeList = new List<Type>();
            var iWeakReferenceRegisterTypeList = new List<Type>();
            
            foreach (Type t in typeList.Where(t => !t.IsInterface))
            {
                if(t.FindInterfaces((tt, o) => o.Equals(tt), typeof(ISingletonRegister)).Length > 0)
                {
                    iSingletonRegisterTypeList.Add(t);
                }
                if (t.FindInterfaces((tt, o) => o.Equals(tt), typeof(IWeakReferenceRegister)).Length > 0)
                {
                    iWeakReferenceRegisterTypeList.Add(t);
                }
            }
            
            //register ISingletonRegister types
            foreach (var t in iSingletonRegisterTypeList)
            {
                var implementInterfaceList = t.FindInterfaces((tt, o) => !o.Equals(tt), typeof (ISingletonRegister));
                foreach (var iType in implementInterfaceList)
                {
                    
                    ICStarsUnityContainer.Current.RegisterType(iType, t, new ContainerControlledLifetimeManager());//use usually，Singleton
                    
                    #region =DebugChecker created by lihui 2010707=
                    if (t.BaseType != typeof(BaseDebugChecker)) continue;
                    var checker = (BaseDebugChecker)ICStarsUnityContainer.Current.Resolve(iType);
                    checker.IsDebug();

                    #endregion
                }
            }
            
            //register IWeakReferenceRegister types
            foreach (var t in iWeakReferenceRegisterTypeList)
            {
                var implementInterfaceList = t.FindInterfaces((tt, o) => !o.Equals(tt), typeof(IWeakReferenceRegister));
                foreach (var iType in implementInterfaceList)
                {
                    
                    ICStarsUnityContainer.Current.RegisterType(iType, t, new ExternallyControlledLifetimeManager());//use unusually，WeakReference
                    
                    #region =DebugChecker created by lihui 2010707=
                    if (t.BaseType != typeof(BaseDebugChecker)) continue;
                    var checker = (BaseDebugChecker)ICStarsUnityContainer.Current.Resolve(iType);
                    checker.IsDebug();

                    #endregion
                }
            }
            
        }
    }
}
