using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class Person
    {
        public int PersonId { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName { get; set; }
        public string EmailAddress { get; set; }
        public string OfficePhoneNumber { get; set; }
        public string CellPhoneNumber { get; set; }
        public string JobTitle { get; set; }
        public int MemberFirmId { get; set; }
    }
}