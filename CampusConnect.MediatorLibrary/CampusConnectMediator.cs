using System;
using System.Web;
using PSAuthClient;
using log4net;

namespace CampusConnect.MediatorLibrary
{
    internal class CampusConnectMediator:ICampusConnectMediator
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(CampusConnectMediator));
        public bool IsValid(string campusConnectID, string password)
        {
#if DEBUG
            return true;
#endif
            try
            {
                Authenticate objPSAuthentication = new Authenticate();
                Package pckResponse = objPSAuthentication.PeopleSoftAuthenticate(campusConnectID,
                                                                                 HttpUtility.UrlEncode(password), true,
                                                                                 false);
                if (pckResponse.Status == 0)
                {
                    return true;
                }
            }
            catch (Exception exp)
            {
                Logger.Error(string.Format("Failed to connect to the CampusConnect!(user:{0})", campusConnectID), exp);
            }

            
            return false;
        }

        public string GetEmplId(string campusConnectID, string password)
        {
#if DEBUG
            return "123123";
#endif
            try
            {
                Authenticate objPSAuthentication = new Authenticate();
                Package pckResponse = objPSAuthentication.PeopleSoftAuthenticate(campusConnectID,
                                                                                 HttpUtility.UrlEncode(password), true,
                                                                                 false);
                if (pckResponse.Status == 0)
                {
                    return ((PackageData)pckResponse.Rows[0]).get_Item("emplid");
                }
            }
            catch (Exception exp)
            {
                Logger.Error(string.Format("Failed to connect to the CampusConnect!(user:{0})", campusConnectID), exp);
            }

            
            return "False";
        }
        public UserInfo GetUserInfo(string campusConnectID, string password)
        {
#if DEBUG
            return new UserInfo(){Emplid="123123",FirstName="DEBUG",LastName="DEBUG"};
#endif
            try
            {
                Authenticate objPSAuthentication = new Authenticate();
                Package pckResponse = objPSAuthentication.PeopleSoftAuthenticate(campusConnectID,
                                                                                 HttpUtility.UrlEncode(password), true,
                                                                                 false);
                if (pckResponse.Status == 0)
                {
                    var res = ((PackageData) pckResponse.Rows[0]);
                    var userinfo = new UserInfo()
                    {
                        Emplid = res.get_Item("emplid")
                    };
                    var fullname = res.get_Item("fullname");
                    string[] nameArray=null;
                    if (!string.IsNullOrEmpty(fullname))
                    {
                        nameArray = fullname.Split(' ');
                    }
                    if (nameArray.Length > 0)
                    {
                        userinfo.FirstName = nameArray[0];
                    }
                    if (nameArray.Length > 1)
                    {
                        userinfo.LastName = nameArray[1];
                    }
                    return userinfo;
                }
            }
            catch (Exception exp)
            {
                Logger.Error(string.Format("Failed to connect to the CampusConnect!(user:{0})", campusConnectID), exp);
            }

            //invalid
            return null;
        }
    }
}
