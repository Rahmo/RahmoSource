using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Commengdpu.BusinessLayer.Provider;
using Commengdpu.BusinessLayer.Settings.Models;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.Settings
{
    public interface IPageSettingsFactory
    {
        T BuildPageSettings<T>();
        void SavePageSettings<T>(T origin, T target) where T : BasePageSettings;
    }

    class PageSettingsFactory : IPageSettingsFactory,ISingletonRegister
    {
        [Dependency]
        public IUserData UserData { get; set; }
        public T BuildPageSettings<T>()
        {
            return SettingsFactory.BuildSetings<T>();
        }

        public void SavePageSettings<T>(T origin, T target) where T:BasePageSettings
        {
            target.LastEditor = string.Format("{0}({1})", UserData.RealName,HttpContext.Current.User.Identity.Name);
            target.LastModifyDate = DateTime.Now;
            target.ContentHistory = origin.ContentHistory == null
                ? new[] { origin.Content }
                : new[] { origin.Content }.Union(origin.ContentHistory.Take(2))
                    .ToArray();
            SettingsFactory.SaveSettings(target);
        }
    }
}
