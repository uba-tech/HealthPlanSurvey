using DotNetNuke.Web.Api;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class RouteMapper : IServiceRouteMapper
    {
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {

            mapRouteManager.MapHttpRoute(
            "HealthPlanSurveyService",
            "Delete",
            "Survey/BrokerDelete/{responseId}",
            new
            {
                controller = "Survey",
                action = "BrokerDelete",
                responseId = ""
            },
            new string[] { "UBA.Modules.HealthPlanSurveyService.Services" });

            mapRouteManager.MapHttpRoute(
            "HealthPlanSurveyService",
            "Validate",
            "Survey/Validate/{responseId}",
            new
            {
                controller = "Survey",
                action = "Validate",
                responseId = ""
            },
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

            mapRouteManager.MapHttpRoute(
            "HealthPlanSurveyService",
            "index",
            "{controller}/{action}",
            new string[] { "UBA.Modules.HealthPlanSurveyService.Services" });

            mapRouteManager.MapHttpRoute(
            "HealthPlanSurveyService",
            "person",
            "{controller}/{action}/{personId}",
            new
            {
                controller = "Person",
                action = "Person",
                personId = ""
            },
            new string[] { "UBA.Modules.HealthPlanSurveyService.Services" });


            mapRouteManager.MapHttpRoute(
            "HealthPlanSurveyService",
            "default",
            "{controller}/{action}/{id}",
            new string[] { "UBA.Modules.HealthPlanSurveyService.Services" });

        }
    }
}