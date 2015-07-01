using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.SteansServices.EventRequest
{
    #region =EventRequestFormFactory=
    internal class EventRequestFormFactory : IEventRequestFormFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_EventRequestForm DB_EventRequestForm { get; set; }
        public IEventRequestFormCollection CreateEventRequestFormCollection(int pageIndex, int pageSize)
        {
            var i = ICStarsUnityContainer.Current.Resolve<EventRequestFormCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            return i;
        }
        public EventRequestForm Create(int id)
        {
            EventRequestForm m = new EventRequestForm();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_EventRequestForm.EventRequestFormInfo(id), m);
            }
            return m;
        }
        public EventRequestForm Update(EventRequestForm m)
        {
            if (m.ID > 0)
            {
                DB_EventRequestForm.Update(m);
            }
            else
            {
                m.ID = DB_EventRequestForm.Add(m);
            }
            return m;
        }
        public int Delete(int ID)
        {
            return DB_EventRequestForm.Delete(ID);
        }
        public bool Exists(int ID)
        {
            return DB_EventRequestForm.Exists(ID);
        }

        public bool UpdateStatus(int ID, EventRequestFormStatus status)
        {
            return DB_EventRequestForm.UpdateStatus(ID, status);
        }
    }
    #endregion
}
