using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyActivePlan
    {
        public SurveyResponse_ActivePlan ActivePlan { get; set; }
        public SurveyRxPlan RxPlan { get; set; }
    }
}