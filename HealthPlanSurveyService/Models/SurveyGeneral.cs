using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UBA.Modules.HealthPlanSurveyService.Models
{
    public class SurveyGeneral
    {
        public int ResponseId { get; set; }
        public int SurveyId { get; set; }
        public Guid? WebID { get; set; }
        public int MemberFirmId { get; set; }
        public int ClientId { get; set; }
        public int? NotParticipatingReasonTypeId { get; set; }
        public int SurveyResponseStatusTypeId { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public int CompletedBy { get; set; }
        public DateTime? CompletedOn { get; set; }
        public string OrganizationName { get; set; }
        public string PersonCompletingSurvey { get; set; }
        public string PersonCompletingSurvey_Title { get; set; }
        public string PersonCompletingSurvey_Email { get; set; }
        public string PersonCompletingSurvey_Phone { get; set; }
        public string PersonCompletingSurvey_PhoneExt { get; set; }
        public string City { get; set; }
        public int US_StateId { get; set; }
        public string ZipCode { get; set; }
        public string LargestLocationCity { get; set; }
        public int? LargestLocationStateId { get; set; }
        public string LargestLocationZipCode { get; set; }
        public bool IsControlledGroup { get; set; }
        public int NAICSMasterCodeId { get; set; }
        public int OrganizationTypeId { get; set; }
        public bool HasUnionEmployees { get; set; }
        public bool HasLeasedStaffedEmployees { get; set; }
        public bool IsApplicableLargeEmployer { get; set; }
        public int ActiveEmployeesCount { get; set; }
        public int EligibleEmployeesCount { get; set; }
        public bool HasVariableHourEmployees { get; set; }
        public int PartTimeEmployeesCount { get; set; }
        public int FullTimeEmployeeCount { get; set; }
        public int OtherEmployeeCount { get; set; }
        public bool AreAncillaryProductsOffered { get; set; }
        public int NumberActivePlansOfferedTypeId { get; set; }
        public int NumberRetireePlansOfferedTypeId { get; set; }
        public int PremiumContributionStrategyTypeId { get; set; }
        public int FullTimeHoursPerWeekTypeId { get; set; }
        public int EligibleWaitingPeriodTypeId { get; set; }
        public bool HasOptOutBonus { get; set; }
        public decimal? OptOutBonusAmt_Single { get; set; }
        public decimal? OptOutBonusAmt_Family { get; set; }
        public int DomesticPartnerCoverageTypeId { get; set; }
        public bool HasEarlyRetireeCoverageInActivePlans { get; set; }
        public int EarlyRetireePremiumShareTypeId { get; set; }
        public int PresentationInterestTypeId { get; set; }
        public int? ErrorCount { get; set; }
        public bool? CoverSameSexSpouses { get; set; }
        public List<ActivePlanSummaryItem> ActivePlans { get; set; }
    }
}