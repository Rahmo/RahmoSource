namespace CampusConnect.MediatorLibrary
{
    public interface ICampusConnectMediator
    {
        /// <summary>
        /// Validate CampusConnectID and password
        /// </summary>
        /// <param name="campusConnectID"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        bool IsValid(string campusConnectID, string password);
        /// <summary>
        /// Get DePaul ID
        /// </summary>
        /// <param name="campusConnectID"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        string GetEmplId(string campusConnectID, string password);
        /// <summary>
        /// Invalid:Return null
        /// </summary>
        /// <param name="campusConnectID"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        UserInfo GetUserInfo(string campusConnectID, string password);
    }
}
