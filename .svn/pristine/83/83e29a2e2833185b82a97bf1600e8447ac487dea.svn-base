using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.BusinessLayer.SteansSettings.Model;

namespace ICStars2_0.BusinessLayer.SteansSettings
{
    public interface ISteansSettingsFactory
    {
        T CreateBaseSetings<T>();
        T CreateStandardSetings<T>();
        void SaveSettings<T>(T settings);
        void SaveStandardSettings<T>(T settings);
    }
}
