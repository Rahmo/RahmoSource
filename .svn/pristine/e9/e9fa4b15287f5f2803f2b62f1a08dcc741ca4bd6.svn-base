using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Commengdpu
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                "List",
                "{controller}/{action}/{page}",
                new { page = 1 },
                new { page = @"\d+", action = @"\w*?List" },
                namespaces: new[] { "Commengdpu.Controllers" }
                );
            routes.MapRoute(
                name: "Profile",
                url: "{controller}/{id}",
                defaults: new { action = "Index" },
                constraints: new { controller = @"Project|CommunityPartner|IndividualPartner" },
                namespaces: new[] { "Commengdpu.Controllers" }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Commengdpu.Controllers" }
            );
        }
    }
}