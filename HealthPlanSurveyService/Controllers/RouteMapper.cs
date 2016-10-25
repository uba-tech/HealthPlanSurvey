using DotNetNuke.Web.Api;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class RouteMapper : IServiceRouteMapper
    {
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            mapRouteManager.MapHttpRoute(
            "HealthPlanSurveyService",
            "default",
            "{controller}/{action}",
            new string[] { "UBA.Modules.HealthPlanSurveyService.Services" });

            mapRouteManager.MapHttpRoute(
            "HealthPlanSurveyService",
            "SurveySummary",
            "{controller}/{action}/{responseId}",
            new {
                controller = "Survey",
                action = "SurveySummary",
                //responseId = UrlParameter.Optional
            },
            new string[] { "UBA.Modules.HealthPlanSurveyService.Services" });


        }
    }
}