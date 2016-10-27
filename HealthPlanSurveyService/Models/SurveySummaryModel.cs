using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveySummaryModel
    {
        public int ResponseId { get; set; }
        public int MemberFirmId { get; set; }
        public string Broker { get; set; }
        public string OrganizationName { get; set; }
        public string City { get; set; }
        public string StateCode { get; set; }
        public string PersonCompletingSurvey { get; set; }
        public string PersonCompletingSurvey_Title { get; set; }
        public string PersonCompletingSurvey_Email { get; set; }
        public string PersonCompletingSurvey_Phone { get; set; }
        public string PersonCompletingSurvey_PhoneExt { get; set; }
        public string ResponseStatus { get; set; }
        public string CompletedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime UpdatedOn { get; set; }
        public DateTime CompletedOn { get; set; }
    }
}