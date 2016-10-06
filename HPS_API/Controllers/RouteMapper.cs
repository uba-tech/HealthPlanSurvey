using System;
using DotNetNuke.Web.Api;

namespace UBA.Modules.HPS_API.Services
{
    public class RouteMapper : IServiceRouteMapper
    {
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            mapRouteManager.MapHttpRoute(
            "HPS_API",
            "default",
            "{controller}/{action}",
            new string[] { "UBA.Modules.HPS_API.Services" });
        }
    }
}