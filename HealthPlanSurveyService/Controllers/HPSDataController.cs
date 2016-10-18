using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UBA.Modules.HealthPlanSurveyService.Models;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class HPSDataController
    {
        #region Syntax

        //CRUD operation + TableName;

        #endregion

        #region SurveyResponse Data
        //Get the paginated list of surveys for a partner firm.
        public IEnumerable<SurveySummaryModel> GetSurveyListData()
        {
            //TODO
            //TODO:  convert this to use pagination
            IEnumerable<SurveySummaryModel> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<SurveySummaryModel>(
                    @"SELECT top 25 r.ResponseId, '' as 'Broker', r.OrganizationName, r.City, s.StateCode, 
                        r.PersonCompletingSurvey, r.PersonCompletingSurvey_Title, r.PersonCompletingSurvey_Email, 
                        r.PersonCompletingSurvey_Phone, r.PersonCompletingSurvey_PhoneExt, 
                        st.[Description] as 'ResponseStatus', r.CompletedBy, r.CreatedOn, r.UpdatedOn, r.CompletedOn  
                        FROM SurveyResponse_General r 
                        INNER JOIN US_State s on r.US_StateId = s.US_StateId 
                        INNER JOIN SurveyResponseStatusType st on r.SurveyResponseStatusTypeId = st.SurveyResponseStatusTypeId 
                        ORDER BY OrganizationName");
                t = result;
            }
            return t;

        }

        //Get the SurveyResponseGeneral data.
        public SurveySummaryModel GetSurveyResponse_Summary(int responseId)
        {
            SurveySummaryModel t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.SingleOrDefault<SurveySummaryModel>(
                    @"SELECT r.ResponseId, '' as 'Broker', r.OrganizationName, r.City, s.StateCode, 
                        r.PersonCompletingSurvey, r.PersonCompletingSurvey_Title, r.PersonCompletingSurvey_Email, 
                        r.PersonCompletingSurvey_Phone, r.PersonCompletingSurvey_PhoneExt, 
                        st.[Description] as 'ResponseStatus', r.CompletedBy, r.CreatedOn, r.UpdatedOn, r.CompletedOn  
                        FROM SurveyResponse_General r 
                        INNER JOIN US_State s on r.US_StateId = s.US_StateId 
                        INNER JOIN SurveyResponseStatusType st on r.SurveyResponseStatusTypeId = st.SurveyResponseStatusTypeId 
                        WHERE r.ResponseId = @0", responseId);
                t = result;
            }
            return t;

        }

        public SurveyResponse_General GetSurveyResponse_General(int responseId)
        {
            SurveyResponse_General t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.SingleOrDefault<SurveyResponse_General>(
                    @"SELECT [ResponseId]
                            ,[SurveyId]
                            ,[WebID]
                            ,[MemberFirmId]
                            ,[ClientId]
                            ,[NotParticipatingReasonTypeId]
                            ,[SurveyResponseStatusTypeId]
                            ,[CreatedOn]
                            ,[CreatedBy]
                            ,[UpdatedOn]
                            ,[UpdatedBy]
                            ,[CompletedBy]
                            ,[CompletedOn]
                            ,[OrganizationName]
                            ,[PersonCompletingSurvey]
                            ,[PersonCompletingSurvey_Title]
                            ,[PersonCompletingSurvey_Email]
                            ,[PersonCompletingSurvey_Phone]
                            ,[PersonCompletingSurvey_PhoneExt]
                            ,[City]
                            ,[US_StateId]
                            ,[ZipCode]
                            ,[LargestLocationCity]
                            ,[LargestLocationStateId]
                            ,[LargestLocationZipCode]
                            ,[IsControlledGroup]
                            ,[NAICSMasterCodeId]
                            ,[OrganizationTypeId]
                            ,[HasUnionEmployees]
                            ,[HasLeasedStaffedEmployees]
                            ,[IsApplicableLargeEmployer]
                            ,[ActiveEmployeesCount]
                            ,[EligibleEmployeesCount]
                            ,[HasVariableHourEmployees]
                            ,[PartTimeEmployeesCount]
                            ,[FullTimeEmployeeCount]
                            ,[OtherEmployeeCount]
                            ,[AreAncillaryProductsOffered]
                            ,[NumberActivePlansOfferedTypeId]
                            ,[NumberRetireePlansOfferedTypeId]
                            ,[PremiumContributionStrategyTypeId]
                            ,[FullTimeHoursPerWeekTypeId]
                            ,[EligibleWaitingPeriodTypeId]
                            ,[HasOptOutBonus]
                            ,[OptOutBonusAmt_Single]
                            ,[OptOutBonusAmt_Family]
                            ,[DomesticPartnerCoverageTypeId]
                            ,[HasEarlyRetireeCoverageInActivePlans]
                            ,[EarlyRetireePremiumShareTypeId]
                            ,[PresentationInterestTypeId]
                            ,[ErrorCount]
                            ,[CoverSameSexSpouses]
                    FROM [dbo].[SurveyResponse_General] 
                    WHERE ResponseId = @0", responseId);
                t = result;
            }
            return t;
        }

        public void SaveSurveySummaryData(SurveySummaryModel survey)
        {

        }
        #endregion
    }
}