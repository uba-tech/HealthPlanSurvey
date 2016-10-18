using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class RetireePlanSummaryItem
    {
        public int RetireePlanId { get; set; }
        public int ResponseId { get; set; }
        public short PlanNumber { get; set; }
        public string RetireePlanType { get; set; }
    }
}