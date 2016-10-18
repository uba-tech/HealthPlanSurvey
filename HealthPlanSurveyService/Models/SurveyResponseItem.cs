using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyResponseItem
    {
        public SurveyResponse_General GeneralResponse { get; set; }
        public List<SurveyActivePlan> ActivePlans { get; set; }
        public SurveyResponse_RetireePlan RetireePlan { get; set; }
        public SurveyResponse_Section125 Section125 { get; set; }
    }
}