using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.CommunityPartnerServices
{
    class CommunityPartnerCollection : IPageableCollection<CommunityPartner>
    {
        private readonly IEnumerable<CommunityPartner> _communityPartners;
        public CommunityPartnerCollection(IEnumerable<CommunityPartner> list)
        {
            _communityPartners = list;
        }
        public IEnumerator<CommunityPartner> GetEnumerator()
        {
            return _communityPartners.GetEnumerator();
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
