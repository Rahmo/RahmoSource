using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.IndividualPartnerServices
{
    class IndividualPartnerCollection : IPageableCollection<IndividualPartner>
    {
        private readonly IEnumerable<IndividualPartner> _individualPartners;
        public IndividualPartnerCollection(IEnumerable<IndividualPartner> list)
        {
            _individualPartners = list;
        }
        public IEnumerator<IndividualPartner> GetEnumerator()
        {
            return _individualPartners.GetEnumerator();
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
