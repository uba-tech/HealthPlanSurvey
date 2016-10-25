using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class PersonModel
    {
        public int PersonId { get; set; }
        public string Name { get; set; }
        public string EmailAdress { get; set; }
        public string PhoneNumber { get; set; }
        public string PhoneExtension { get; set; }
        public string JobTitle { get; set; }
    }
}