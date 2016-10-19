using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyRxPlan
    {
        public SurveyRxPlan(SurveyResponse_RxPlan rxPlan, List<SurveyResponse_RxPlanTier> rxTiers)
        {
            this.RxPlan = rxPlan;
            this.PlanTiers = rxTiers;
        }

        public SurveyResponse_RxPlan RxPlan { get; set; }
        public virtual List<SurveyResponse_RxPlanTier> PlanTiers { get; set; }
        
    }
}