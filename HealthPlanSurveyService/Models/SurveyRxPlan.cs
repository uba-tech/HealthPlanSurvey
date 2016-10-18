using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyRxPlan
    {
        public SurveyResponse_RxPlan RxPlan { get; set; }
        public List<SurveyResponse_RxPlanTier> PlanTiers { get; set; }
    }
}