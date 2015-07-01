using System.Collections;
using System.Collections.Generic;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.UserServices
{
    class UserCollection : IPageableCollection<User>
    {
        private readonly IEnumerable<User> _users;
        public UserCollection(IEnumerable<User> list)
        {
            _users = list;
        }
        public IEnumerator<User> GetEnumerator()
        {
            return _users.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        public int TotalCount { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
    }
}
