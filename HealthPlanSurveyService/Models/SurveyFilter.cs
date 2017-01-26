using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyFilter
    {
        public int BrokerNo { get; set; }
        public int ResponseStatusId { get; set; }
        public string ClientName { get; set; }
    }
}