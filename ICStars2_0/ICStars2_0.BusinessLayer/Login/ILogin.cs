using System;

namespace ICStars2_0.BusinessLayer.Login
{
    public interface ILogin
    {
        /// <summary>
        /// Please use ICStars2_0.BusinessLayer.Provider.IUserData instead
        /// </summary>
        /// <returns></returns>
        [Obsolete]
        IUserInfo GetLoginedUserInfo();
        bool IsLogin();
        void Logout(LoginEventArgs e);
        bool Login(LoginEventArgs e);
        bool LoginStudent(LoginEventArgs e);
        bool LoginWithoutRoles(LoginEventArgs e);
    }
}