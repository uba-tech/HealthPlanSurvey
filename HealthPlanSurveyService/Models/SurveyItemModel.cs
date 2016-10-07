using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyItemModel
    {
        public int ResponseId { get; set; }
        public string Broker { get; set; }
        public string Client { get; set; }
        public string City { get; set; }
        public string StateProvince { get; set; }
        public string ClientContact { get; set; }
        public string ClientEmailAddress { get; set; }
        public string ClientPhoneNumber { get; set; }
        public string ResponseStatus { get; set; }
        public string CompletedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime UpdatedOn { get; set; }
        public DateTime CompletedOn { get; set; }
    }
}