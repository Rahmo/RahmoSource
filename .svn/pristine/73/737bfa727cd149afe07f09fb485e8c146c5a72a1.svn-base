using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.BusinessLayer.SteansServices.EventRequest
{


    public interface IEventRequestFormFactory
    {
        IEventRequestFormCollection CreateEventRequestFormCollection(int pageIndex, int pageSize);
        EventRequestForm Create(int id);
        EventRequestForm Update(EventRequestForm m);
        int Delete(int ID);
        bool Exists(int ID);
        bool UpdateStatus(int ID, EventRequestFormStatus status);
    }
}
