﻿using System.Web.Mvc;
using System.Web.Routing;
using ICStars2_0.BusinessLayer.Mvc.Constraints;

namespace ICStars2_0.App_Start
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.RouteExistingFiles = false;
            //routes.IgnoreRoute("");
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("Images/{*pathInfo}");
            routes.IgnoreRoute("Scripts/{*pathInfo}");
            routes.IgnoreRoute("Content/{*pathInfo}");
            routes.IgnoreRoute("docs/{*pathInfo}");
            routes.IgnoreRoute("SHTracker/Images/{*pathInfo}");
            routes.IgnoreRoute("{*allaspx}", new { allaspx = @".*\.[aspx|asp|inc|htm|html|js|css|jpg|gif|png|swf|xml|pdf|doc|docx|xsl|xslx|txt|ico|ashx](/.*)?" });
            

            routes.MapRoute(
                name: "DefaultHomePage",
                url: "",
                defaults: new { controller = "Home", action = "Default", id = UrlParameter.Optional },
                namespaces: new[] { "ICStars2_0.Controllers" }
            );
            routes.MapRoute(
                name: "WebPage",
                url: "{*pageurl}",
                defaults: new { controller = "WebPage", action = "Index" },
                constraints: new { pageurl = new WebPageConstraint() },
                namespaces: new[] { "ICStars2_0.Controllers" }
            );

            routes.MapRoute(
                name: "Article",
                url: "{root}/{id}",
                defaults: new {controller="Publication",action = "Index" },
                constraints:new { root = new CategoryConstraint() },
                namespaces: new[] { "ICStars2_0.Controllers" }
            );
            routes.MapRoute(
                name: "Publication",
                url: "Publication/{action}/{page}",
                defaults: new { controller = "Publication", page = 1 },
                constraints: new { action = @"^(News|Story)$", page = @"\d+" },
                namespaces: new[] { "ICStars2_0.Controllers" }
            );
           
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new {id = UrlParameter.Optional},
                constraints: new {controller = @"^(?!Publication|WebPage|Home)\w+$"},
                namespaces: new[] {"ICStars2_0.Controllers"}
                ).DataTokens["UseNamespaceFallback"] = false;
        }
    }
}