using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class ActivePlanSummaryItem
    {
        public int ActivePlanId { get; set; }
        public int ResponseId { get; set; }
        public string PlanName { get; set; }
        public string ActivePlanType { get; set; }
    }
}