using System;
using System.Globalization;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Mvc
{
    public class ICStarsDependencyMvcControllerFactory : DefaultControllerFactory
    {
        protected override IController GetControllerInstance(System.Web.Routing.RequestContext requestContext, Type controllerType)
        {
            if (controllerType == null)
            {
                throw new HttpException(404,
                                        String.Format(
                                            CultureInfo.CurrentCulture,
                                            "The controller for path '{0}' was not found or does not implement IController.",
                                            requestContext.HttpContext.Request.Path));
            }
            if (!typeof(IController).IsAssignableFrom(controllerType))
            {
                throw new ArgumentException(
                    String.Format(
                        CultureInfo.CurrentCulture,
                        "The controller type '{0}' must implement IController.",
                        controllerType),
                    "controllerType");
            }
            return (IController)ICStarsUnityContainer.Current.Resolve(controllerType);
            
        }
    }
}
