namespace CampusConnect.MediatorLibrary
{
    public static class CampusConnectFactory
    {
        public static ICampusConnectMediator CreateCampusConnectMediaor()
        {
            return new CampusConnectMediator();
        }
    }
}
