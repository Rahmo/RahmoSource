﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Mvc.Filter;

namespace ICStars2_0.Areas.Calendar.Controllers
{
    [CalendarAuthorize(Roles = "SteansWeb,admin,admin_calendar,Steans,Staff")]
    public class ReservationController : Controller
    {
        //
        // GET: /Calendar/Home/
        public ActionResult Index()
        {
            ViewBag.EventsUrl = Url.Action("Approved", "Events");
            return View();
        }
        public ActionResult All()
        {
            ViewBag.EventsUrl = Url.Action("All","Events");
            return View("Index");
        }
        public ActionResult My()
        {
            ViewBag.EventsUrl = Url.Action("My", "Events");
            return View("Index");
        }
        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        public ActionResult NeedApprovals()
        {
            ViewBag.EventsUrl = Url.Action("NeedApprovals", "Events");
            return View("Index");
        }

        public ActionResult SocialEvents()
        {
            ViewBag.EventsUrl = Url.Action("SocialEvents", "Events");
            return View("Index");
        }

    }
}
