using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyActivePlan
    {
        public SurveyActivePlan(SurveyResponse_ActivePlan activePlan, SurveyRxPlan rxPlan)
        {
            this.ActivePlan = activePlan;
            this.RxPlan = rxPlan;
        }
        public SurveyResponse_ActivePlan ActivePlan { get; set; }
        public SurveyRxPlan RxPlan { get; set; }
    }
}