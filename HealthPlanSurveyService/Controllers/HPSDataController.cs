using DotNetNuke.Entities.Users;
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

        #region SQL Strings
        string SurveyListSql = @"SELECT r.ResponseId,  r.MemberFirmId, f.Name as 'Broker', r.OrganizationName, r.City, us.StateCode, 
                        r.PersonCompletingSurvey, r.PersonCompletingSurvey_Title, r.PersonCompletingSurvey_Email, 
                        r.PersonCompletingSurvey_Phone, r.PersonCompletingSurvey_PhoneExt, 
                        st.[Name] as 'ResponseStatus', r.CompletedBy, r.CreatedOn, r.UpdatedOn, r.CompletedOn  
                        FROM SurveyResponse_General r 
						INNER JOIN wm4dnn.dbo.uba_MemberFirm f on r.MemberFirmId = f.MemberFirmId 
                        INNER JOIN US_State us on r.US_StateId = us.TypeId 
                        INNER JOIN SurveyResponseStatusType st on r.SurveyResponseStatusTypeId = st.TypeId 
                        INNER JOIN Survey s on r.SurveyId = s.SurveyId 
                        WHERE s.SurveyYear = (SELECT TOP 1 SurveyYear FROM Survey ORDER BY SurveyYear DESC) ";

        string SurveySummaryModelSql = @"SELECT r.ResponseId, '' as 'Broker', r.OrganizationName, r.City, s.StateCode, 
                        r.PersonCompletingSurvey, r.PersonCompletingSurvey_Title, r.PersonCompletingSurvey_Email, 
                        r.PersonCompletingSurvey_Phone, r.PersonCompletingSurvey_PhoneExt, 
                        st.[Name] as 'ResponseStatus', r.CompletedBy, r.CreatedOn, r.UpdatedOn, r.CompletedOn  
                        FROM SurveyResponse_General r 
                        INNER JOIN US_State s on r.US_StateId = s.TypeId 
                        INNER JOIN SurveyResponseStatusType st on r.SurveyResponseStatusTypeId = st.TypeId 
                        WHERE r.ResponseId = @0";
        string SurveyFilteredListSql = @"SELECT TOP 25 r.ResponseId, '' as 'Broker', r.OrganizationName, r.City, s.StateCode, 
                        r.PersonCompletingSurvey, r.PersonCompletingSurvey_Title, r.PersonCompletingSurvey_Email, 
                        r.PersonCompletingSurvey_Phone, r.PersonCompletingSurvey_PhoneExt, 
                        st.[Name] as 'ResponseStatus', r.CompletedBy, r.CreatedOn, r.UpdatedOn, r.CompletedOn  
                        FROM SurveyResponse_General r 
                        INNER JOIN US_State s on r.US_StateId = s.TypeId 
                        INNER JOIN SurveyResponseStatusType st on r.SurveyResponseStatusTypeId = st.TypeId 
                        WHERE 1 = 1 ";
        string SurveyResponseItemSql = @"SELECT [ResponseId]
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
                            ,[NAICSCode]
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
                    WHERE ResponseId = @0";
        string SurveyResponse_ActivePlanSql = @"SELECT 
                       [ActivePlanId]
                      ,[ResponseId]
                      ,[EnterPlanData]
                      ,[PlanNumber]
                      ,[PlanName]
                      ,[ActivePlanTypeId]
                      ,[IsPlanGrandfathered]
                      ,[IsPlanGrandmothered]
                      ,[IsHRAIncluded]
                      ,[IsHSAIncluded]
                      ,[IsMERPIncluded]
                      ,[IsHRAHSAMERP_NoneOfTheAbove]
                      ,[FundingMethodTypeId]
                      ,[PremiumTierTypeId]
                      ,[UnitRateTypeId]
                      ,[NumberEnrolled_Single]
                      ,[NumberEnrolled_EmployeePlusOne]
                      ,[NumberEnrolled_EmployeePlusChild]
                      ,[NumberEnrolled_EmployeePlusSpouse]
                      ,[NumberEnrolled_Family]
                      ,[MonthlyPremiumAmt_Single]
                      ,[MonthlyPremiumAmt_EmployeePlusOne]
                      ,[MonthlyPremiumAmt_EmployeePlusChild]
                      ,[MonthlyPremiumAmt_EmployeePlusSpouse]
                      ,[MonthlyPremiumAmt_Family]
                      ,[HasTobaccoSurcharge]
                      ,[TobaccoSurchargePct]
                      ,[AreContributionsBasedOnPercentageOfSalary]
                      ,[ContributionBasisTypeId]
                      ,[EmployeeContributionAmt_Single]
                      ,[EmployeeContributionAmt_EmployeePlusOne]
                      ,[EmployeeContributionAmt_EmployeePlusChild]
                      ,[EmployeeContributionAmt_EmployeePlusSpouse]
                      ,[EmployeeContributionAmt_Family]
                      ,[EmployeeContributionPctOfPremium_Single]
                      ,[EmployeeContributionPctOfPremium_EmployeePlusOne]
                      ,[EmployeeContributionPctOfPremium_EmployeePlusChild]
                      ,[EmployeeContributionPctOfPremium_EmployeePlusSpouse]
                      ,[EmployeeContributionPctOfPremium_Family]
                      ,[Employer_HRA_ContributionAmt_Single]
                      ,[Employer_HRA_ContributionAmt_EmployeePlusOne]
                      ,[Employer_HRA_ContributionAmt_EmployeePlusChild]
                      ,[Employer_HRA_ContributionAmt_EmployeePlusSpouse]
                      ,[Employer_HRA_ContributionAmt_Family]
                      ,[Employer_HSA_ContributionAmt_Single]
                      ,[Employer_HSA_ContributionAmt_EmployeePlusOne]
                      ,[Employer_HSA_ContributionAmt_EmployeePlusChild]
                      ,[Employer_HSA_ContributionAmt_EmployeePlusSpouse]
                      ,[Employer_HSA_ContributionAmt_Family]
                      ,[HasSpecificStopLossCoverage]
                      ,[HasAggregateStopLossCoverage]
                      ,[SpecificStopLossLevelAmt]
                      ,[SpecificStopLossPremiumAmt_Single]
                      ,[SpecificStopLossPremiumAmt_EmployeePlusOne]
                      ,[SpecificStopLossPremiumAmt_EmployeePlusChild]
                      ,[SpecificStopLossPremiumAmt_EmployeePlusSpouse]
                      ,[SpecificStopLossPremiumAmt_Family]
                      ,[ProposedIncreasePct]
                      ,[FinalIncreasePct]
                      ,[MedicalExpenseReimbursementRenewalRateTypeId]
                      ,[RenewalDate]
                      ,[CopayAmt_Inpatient_InNetwork]
                      ,[HasCopay_Inpatient_InNetwork]
                      ,[HasCopayPerDay_Inpatient_InNetwork]
                      ,[CopayAmt_Inpatient_OutOfNetwork]
                      ,[HasCopay_Inpatient_OutOfNetwork]
                      ,[HasCopayPerDay_Inpatient_OutOfNetwork]
                      ,[AnnualPlanDeductibleAmt_Single_InNetwork]
                      ,[HasAnnualPlanDeductible_Single_InNetwork]
                      ,[AnnualPlanDeductibleAmt_Single_OutOfNetwork]
                      ,[HasAnnualPlanDeductible_Single_OutOfNetwork]
                      ,[AnnualPlanDeductibleAmt_Family_InNetwork]
                      ,[HasAnnualPlanDeductible_Family_InNetwork]
                      ,[HasAnnualPlanDeductible_xEE_Family_InNetwork]
                      ,[AnnualPlanDeductibleAmt_Family_OutOfNetwork]
                      ,[HasAnnualPlanDeductible_Family_OutOfNetwork]
                      ,[HasAnnualPlanDeductible_xEE_Family_OutOfNetwork]
                      ,[PlanCoinsurancePct_InNetwork]
                      ,[HasPlanCoinsurance_InNetwork]
                      ,[PlanCoinsurancePct_OutOfNetwork]
                      ,[HasPlanCoinsurance_OutOfNetwork]
                      ,[AnnualOutOfPocketMaxAmt_Single_InNetwork]
                      ,[HasAnnualOutOfPocketMax_Single_InNetwork]
                      ,[AnnualOutOfPocketMaxAmt_Single_OutOfNetwork]
                      ,[HasAnnualOutOfPocketMax_Single_OutOfNetwork]
                      ,[AnnualOutOfPocketMaxAmt_Family_InNetwork]
                      ,[HasAnnualOutOfPocketMax_Family_InNetwork]
                      ,[HasAnnualOutOfPocketMax_xEE_Family_InNetwork]
                      ,[AnnualOutOfPocketMaxAmt_Family_OutOfNetwork]
                      ,[HasAnnualOutOfPocketMax_Family_OutOfNetwork]
                      ,[HasAnnualOutOfPocketMax_xEE_Family_OutOfNetwork]
                      ,[HasMinValueCoverage]
                      ,[HasMinEssentialCoverage]
                      ,[PlanDesignMetalLevelTypeId]
                      ,[HasSkinnyPlan]
                      ,[HasERHospitalCoverage]
                      ,[HasPhysicianVisitsCoverage]
                      ,[HasPharmacyCoverage]
                      ,[HasLab_ImagingCoverage]
                      ,[CopayAmt_PCP]
                      ,[HasCopay_PCP]
                      ,[CopayAmt_SCP]
                      ,[HasCopay_SCP]
                      ,[CopayAmt_UrgentCare]
                      ,[HasCopay_UrgentCare]
                      ,[CopayAmt_ER]
                      ,[HasCopay_ER]
                      ,[HRA_PreventiveSvcs]
                      ,[HSA_PreventiveSvcs]
                      ,[InfertilityCoverageTypeId]
                      ,[HasWellnessProgram]
                      ,[WellnessProgramProviderTypeId]
                      ,[HasWellness_HealthRiskAssessment]
                      ,[HasWellness_SeminarsWorkshops]
                      ,[HasWellness_PhysicalExamBloodDraw]
                      ,[HasWellness_Coaching]
                      ,[HasWellness_Incentives]
                      ,[HasWellness_WebPortal]
                      ,[HasWellness_Other]
                      ,[HasWellnessIncentives_PremiumReduction]
                      ,[HasWellnessIncentives_HealthClubDues]
                      ,[HasWellnessIncentives_PaidTimeOff]
                      ,[HasWellnessIncentives_Min]
                      ,[HasWellnessIncentives_Other]
                      ,[HasRxPlan]
                      ,[UpdatedByUserID]
                      ,[SelfFundedDeductible]
                      ,[HasReinsuranceCaptible]
                      ,[AleEmployerStrategyTypeId]
                      FROM [dbo].[SurveyResponse_ActivePlan]
                    WHERE ResponseId = @0";
        string SurveyResponse_RxPlanSql = @"SELECT [RxPlanId]
                          ,[ActivePlanId]
                          ,[FundingMethodTypeId]
                          ,[IsCoveredUnderMajorMedical]
                          ,[DoesCoPay_CoinsApplyAfterMajorMedicalDeductible]
                          ,[HasSeparateAnnualDeductibleApplied]
                          ,[DoesSeparateAnnualDeductibleApplyForGeneric]
                          ,[SeparateAnnualDeductibleAmt_Single]
                          ,[HasSeparateAnnualDeductibleAmt_FamilyOnly]
                          ,[SeparateAnnualDeductibleAmt_Family]
                          ,[HasSeparateAnnualDeductibleAmt_xEE]
                          ,[CoPayCoinsuranceStructureTypeId]
                          ,[RxPlanTierCountTypeId]
                          ,[HasSeparateDeductibleForInjectibles]
                          ,[AddedCostForBrandDrugsTypeId]
                          ,[MailOrderPlanDesignTypeId]
                      FROM [dbo].[SurveyResponse_RxPlan]
                      WHERE ActivePlanId = @0";
        string SurveyResponse_RxPlanTierSql = @"SELECT [RxPlanTierId]
                          ,[RxPlanId]
                          ,[TierNumber]
                          ,[RxPlanTierTypeId]
                          ,[EmployeeCopayAmt]
                          ,[HasEmployeeCopay]
                          ,[EmployeeCoinsurancePctTypeId]
                          ,[HasEmployeeCoinsurance]
                          ,[MaxCoinsuranceAmt]
                      FROM [dbo].[SurveyResponse_RxPlanTier]
                      WHERE RxPlanId = @0";
        string SurveyResponse_RetireePlanSql = @"SELECT [RetireePlanId]
                          ,[ResponseId]
                          ,[PlanNumber]
                          ,[EnterPlanData]
                          ,[RetireePlanTypeId]
                          ,[FundingMethodTypeId]
                          ,[RetireePlanArrangementTypeId]
                          ,[RetireePlanOfferedToTypeId]
                          ,[MonthlyPremiumAmt_Single]
                          ,[MonthlyPremiumAmt_Family]
                          ,[IsMonthlyPremiumRetireeOnly]
                          ,[IsEmployerContribBasedOnAgeOrYearsOfSvc]
                          ,[MonthlyEmployerContribAmt_Single]
                          ,[MonthlyEmployerContribAmt_Family]
                          ,[ProposedPremiumChangePct]
                          ,[FinalPremiumChangePct]
                          ,[HasRxPlan]
                          ,[HasMedicarePartDReimbursment]
                          ,[UpdatedByUserID]
                      FROM [dbo].[SurveyResponse_RetireePlan]
                      WHERE ResponseId = @0";
        string SurveyResponse_Section125Sql = @"SELECT [Section125Id]
                          ,[ResponseId]
                          ,[Offers_FSA_TraditionalMedical]
                          ,[Offers_FSA_LimitedPurposeMedical]
                          ,[Offers_FSA_DependentCare]
                          ,[Offers_FSA_PremiumOnlyPlan]
                          ,[Offers_FSA_NoneOfTheAbove]
                          ,[MaxAnnualContribution_TraditionalMedical_FSA]
                          ,[EmployeesEnrolledCount_TraditionalMedical_FSA]
                          ,[AvgAnnualContribution_TraditionalMedical_FSA]
                          ,[MaxAnnualContribution_LtdPurposeMedical_FSA]
                          ,[EmployeesEnrolledCount_LtdPurposeMedical_FSA]
                          ,[AvgAnnualContribution_LtdPurposeMedical_FSA]
                          ,[MaxAnnualContribution_DependentCare_FSA]
                          ,[EmployeesEnrolledCount_DependentCare_FSA]
                          ,[AvgAnnualContribution_DependentCare_FSA]
                      FROM [dbo].[SurveyResponse_Section125]
                      WHERE ResponseId = @0";
        string BrokersSql = @"SELECT [BrokerNo]
                      ,[WebID]
                      ,[BrokerName]
                      ,[SurveyContactName]
                      ,[SurveyContactEmail]
                      ,[InProcessCount]
                      ,[FinishedCount]
                      ,[CompletedCount]
                      ,[BrokerDeletedCount]
                      ,[DontSendSaveEmail]
                      ,[AllowPTG]
                      ,b.[MemberFirmID]
                      FROM [dbo].[Brokers]  b 
                      INNER JOIN wm4dnn.[dbo].[uba_MemberFirm] f 
                      ON b.[MemberFirmID] = f.[MemberFirmID] 
                      WHERE f.[Active] = 1 ";
        string BrokersByMemberFirmIdSql = @"SELECT [BrokerNo]
                      ,[WebID]
                      ,[BrokerName]
                      ,[SurveyContactName]
                      ,[SurveyContactEmail]
                      ,[InProcessCount]
                      ,[FinishedCount]
                      ,[CompletedCount]
                      ,[BrokerDeletedCount]
                      ,[DontSendSaveEmail]
                      ,[AllowPTG]
                      ,[MemberFirmID]
                  FROM[dbo].[Brokers]
                  WHERE [MemberFirmID] = @0";

        #endregion

        #region SurveyResponse Data
        //Get the paginated list of surveys for a partner firm.
        public IEnumerable<SurveySummaryModel> GetSurveyListData(UserInfo curUser)
        {
            string sql = SurveyListSql;
            if (!(curUser.IsInRole("Administrators") | curUser.IsInRole("SuperUsers") | curUser.IsInRole("UBASuperUser")))
                sql += string.Format(@" AND EXISTS (
                            SELECT NULL
                            FROM UserSettings u
                            WHERE r.MemberFirmId = u.MemberFirmId
                            AND u.UserID = {0}
                        )", curUser.UserID);

            IEnumerable<SurveySummaryModel> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<SurveySummaryModel>(sql);
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
                var result = db.SingleOrDefault<SurveySummaryModel>(SurveySummaryModelSql, responseId);
                t = result;
            }
            return t;

        }

        //Get the SurveyResponseGeneral data.
        public IEnumerable<SurveySummaryModel> GetSurveyResponse_Summary(SurveyFilter filter)
        {
            //TODO:  build qry
            string qry = SurveyFilteredListSql;
            if (filter.BrokerNo > 0)
                qry = qry + string.Format(" AND r.MemberFirmId = {0}", filter.BrokerNo);
            if (filter.ResponseStatusId > 0)
                qry += string.Format(" AND r.SurveyResponseStatusTypeId = {0}", filter.ResponseStatusId);
            qry += string.Format(" AND r.OrganizationName LIKE '%{0}%'", filter.ClientName);
            //TODO:  convert this to use pagination
            IEnumerable<SurveySummaryModel> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<SurveySummaryModel>(qry);
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
                            ,[TypeId]
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

        public SurveyResponseItem GetSurvey(int responseId)
        {
            SurveyResponseItem item = new SurveyResponseItem();
            using (hpsDB db = new hpsDB())
            {
                // get general response
                var general = db.SingleOrDefault<SurveyResponse_General>(SurveyResponseItemSql, responseId);
                item.GeneralResponse = general;

                // get active plans with RxPlan
                var responseActivePlans = db.Fetch<SurveyResponse_ActivePlan>(SurveyResponse_ActivePlanSql, responseId);
                foreach (SurveyResponse_ActivePlan plan in responseActivePlans)
                {
                    // get RxPlan for each active plan
                    var rxPlan = db.SingleOrDefault<SurveyResponse_RxPlan>(SurveyResponse_RxPlanSql, plan.ActivePlanId);
                    var rxTiers = db.Fetch<SurveyResponse_RxPlanTier>(SurveyResponse_RxPlanTierSql, plan.ActivePlanId);
                    var surveyRxPlan = new SurveyRxPlan(rxPlan, rxTiers);
                    // create new SurveyActivePlan(plan, rxPlan) 
                    var surveyActivePlan = new SurveyActivePlan();
                    surveyActivePlan.ActivePlan = plan;
                    surveyActivePlan.RxPlan = surveyRxPlan;
                    item.ActivePlans.Add(surveyActivePlan);
                }

                // get retiree plan
                var retiree = db.SingleOrDefault<SurveyResponse_RetireePlan>(SurveyResponse_RetireePlanSql, responseId);
                item.RetireePlan = retiree;

                // get section125 
                var section125 = db.SingleOrDefault<SurveyResponse_Section125>(SurveyResponse_Section125Sql, responseId);
                item.Section125 = section125;

            }
            return item;
        }

        public SurveyResponseItem GetSurveyTemplate()
        {
            SurveyResponseItem item = new SurveyResponseItem();
            // initialize general response
            var general = new SurveyResponse_General();
            general.NotParticipatingReasonTypeId = 4;
            general.SurveyResponseStatusTypeId = 4;
            general.US_StateId = -1;
            general.OrganizationTypeId = -1;
            general.NumberActivePlansOfferedTypeId = -1;
            general.NumberRetireePlansOfferedTypeId = -1;
            general.PremiumContributionStrategyTypeId = -1;
            general.FullTimeHoursPerWeekTypeId = -1;
            general.EligibleWaitingPeriodTypeId = -1;
            general.DomesticPartnerCoverageTypeId = -1;
            general.EarlyRetireePremiumShareTypeId = -1;
            general.PresentationInterestTypeId = -1;
            item.GeneralResponse = general;

            // initialize active plans with RxPlan
            for(int i=1; i < 5; i++)
            {
                var srvyActivePlan = new SurveyActivePlan();
                var activePlan = new SurveyResponse_ActivePlan();
                activePlan.PlanName = "Plan #" + i.ToString();
                activePlan.PlanNumber = i;
                activePlan.ActivePlanTypeId = -1;
                activePlan.FundingMethodTypeId = -1;
                activePlan.PremiumTierTypeId = -1;
                activePlan.ContributionBasisTypeId = -1;
                activePlan.UnitRateTypeId = -1;
                activePlan.MedicalExpenseReimbursementRenewalRateTypeId = -1;
                activePlan.RenewalDate = DateTime.Now.Date;
                activePlan.PlanDesignMetalLevelTypeId = -1;
                activePlan.InfertilityCoverageTypeId = -1;
                activePlan.WellnessProgramProviderTypeId = -1;
                activePlan.AleEmployerStrategyTypeId = -1;
                srvyActivePlan.ActivePlan = activePlan;
                var rxPlan = new SurveyResponse_RxPlan();
                rxPlan.FundingMethodTypeId = -1;
                rxPlan.CoPayCoinsuranceStructureTypeId = -1;
                rxPlan.RxPlanTierCountTypeId = -1;
                rxPlan.AddedCostForBrandDrugsTypeId = -1;
                rxPlan.MailOrderPlanDesignTypeId = -1;
                var rxTiers = new List<SurveyResponse_RxPlanTier>();
                for (int j=1; j < 7; j++)
                {
                    var rxTier = new SurveyResponse_RxPlanTier();
                    rxTier.RxPlanTierTypeId = -1;
                    rxTier.EmployeeCoinsurancePctTypeId = -1;
                    rxTiers.Add(rxTier);
                }
                var surveyRxPlan = new SurveyRxPlan(rxPlan, rxTiers);
                srvyActivePlan.RxPlan = surveyRxPlan;
                item.ActivePlans.Add(srvyActivePlan);
            }

            // get retiree plan
            var retiree = new SurveyResponse_RetireePlan();
            retiree.RetireePlanTypeId = -1;
            retiree.FundingMethodTypeId = -1;
            retiree.RetireePlanArrangementTypeId = -1;
            retiree.RetireePlanOfferedToTypeId = -1;
            item.RetireePlan = retiree;

            // get section125 
            var section125 = new SurveyResponse_Section125();
            item.Section125 = section125;

            return item;
        }

        public int SaveSurveyResponse(SurveyResponseItem survey, UserInfo curUser)
        {
            using (hpsDB db = new hpsDB())
            {
                if(survey.GeneralResponse.ResponseId <= 0)
                {
                    // create new response

                    // get current Survey record
                    var srvy = db.FirstOrDefault<Survey>("SELECT TOP 1 * FROM Survey ORDER BY SurveyYear DESC");

                    // get user's memberfirmid
                    var firmId = 1;
                    if (!(curUser.IsInRole("Administrators") | curUser.IsInRole("SuperUsers") | curUser.IsInRole("UBASuperUser")))
                        firmId = db.ExecuteScalar<int>("SELECT ISNULL(MemberFirmId,0) FROM UserSettings WHERE UserId = @0", curUser.UserID);

                    // create SurveyResponse_General record
                    survey.GeneralResponse.MemberFirmId = firmId;
                    survey.GeneralResponse.CreatedBy = curUser.UserID;
                    survey.GeneralResponse.CreatedOn = DateTime.Now;
                    survey.GeneralResponse.UpdatedBy = curUser.UserID;
                    survey.GeneralResponse.UpdatedOn = DateTime.Now;
                    survey.GeneralResponse.SurveyId = srvy.SurveyId;
                    db.Insert(survey.GeneralResponse);
                    int responseId = survey.GeneralResponse.ResponseId;

                    // create SurveyResponse_ActivePlan and Rx Plan records
                    int i = 1;
                    DateTime renewal = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                    foreach (SurveyActivePlan plan in survey.ActivePlans)
                    {
                        //if (plan.ActivePlan.EnterPlanData)
                        //{
                            // create Active Plan
                            plan.ActivePlan.ResponseId = responseId;
                            plan.ActivePlan.PlanNumber = i;
                            plan.ActivePlan.RenewalDate = renewal;
                            plan.ActivePlan.UpdatedByUserID = curUser.UserID;
                            db.Insert(plan.ActivePlan);
                            int planId = plan.ActivePlan.ActivePlanId;

                            // create Rx plan record
                            plan.RxPlan.RxPlan.ActivePlanId = planId;
                            db.Insert(plan.RxPlan.RxPlan);
                            int rxPlanId = plan.RxPlan.RxPlan.RxPlanId;

                            // create Rx tier records
                            short j = 1;
                            foreach (SurveyResponse_RxPlanTier tier in plan.RxPlan.PlanTiers)
                            {
                                //if (tier.RxPlanTypeId > 0)
                                //{
                                tier.RxPlanId = rxPlanId;
                                tier.TierNumber = j;
                                tier.ActivePlanId = planId;
                                db.Insert(tier);
                                //}
                                j++;
                            }
                        //}
                        i++;
                    }

                    // create retiree plan record
                    if(survey.GeneralResponse.HasEarlyRetireeCoverageInActivePlans)
                    {
                        survey.RetireePlan.ResponseId = responseId;
                        survey.RetireePlan.UpdatedByUserID = curUser.UserID;
                        db.Insert(survey.RetireePlan);
                    }

                    // create section 125 record
                    if(survey.Section125 != null)
                    { 
                        survey.Section125.ResponseId = responseId;
                        if (survey.Section125.Offers_FSA_NoneOfTheAbove.HasValue && survey.Section125.Offers_FSA_NoneOfTheAbove.Value)
                        {
                            survey.Section125.Offers_FSA_DependentCare = false;
                            survey.Section125.Offers_FSA_LimitedPurposeMedical = false;
                            survey.Section125.Offers_FSA_PremiumOnlyPlan = false;
                            survey.Section125.Offers_FSA_TraditionalMedical = false;
                        }
                        db.Insert(survey.Section125);
                    }

                }
                else
                {
                    int responseId = survey.GeneralResponse.ResponseId;
                    // update SurveyResponse_General record
                    survey.GeneralResponse.UpdatedBy = curUser.UserID;
                    survey.GeneralResponse.UpdatedOn = DateTime.Now;
                    db.Update(survey.GeneralResponse);

                    // update SurveyResponse_ActivePlan and Rx Plan records
                    foreach (SurveyActivePlan plan in survey.ActivePlans)
                    {
                        // update Active Plan
                        db.Update(plan.ActivePlan);
                        int planId = plan.ActivePlan.ActivePlanId;

                        // update Rx plan record
                        if (plan.RxPlan.RxPlan.RxPlanId > 0)
                            db.Update(plan.RxPlan.RxPlan);
                        else
                        {
                            plan.RxPlan.RxPlan.ActivePlanId = planId;
                            db.Insert(plan.RxPlan.RxPlan);
                        }
                        int rxPlanId = plan.RxPlan.RxPlan.RxPlanId;

                        // update Rx tier records
                        foreach (SurveyResponse_RxPlanTier tier in plan.RxPlan.PlanTiers)
                        {
                            if(tier.RxPlanTierId > 0)
                                db.Update(tier);
                            else
                            {
                                tier.RxPlanId = rxPlanId;
                                db.Insert(tier);
                            }
                        }
                    }

                    // update retiree plan record
                    if (survey.GeneralResponse.HasEarlyRetireeCoverageInActivePlans)
                    {
                        if (survey.RetireePlan.RetireePlanId > 0)
                            db.Update(survey.RetireePlan);
                        else
                        {
                            survey.RetireePlan.ResponseId = responseId;
                            survey.RetireePlan.UpdatedByUserID = curUser.UserID;
                            db.Insert(survey.RetireePlan);
                        }
                    }

                    // update section 125 record
                    if (survey.Section125 != null)
                    {
                        if (survey.Section125.Offers_FSA_NoneOfTheAbove.HasValue && survey.Section125.Offers_FSA_NoneOfTheAbove.Value)
                        {
                            survey.Section125.Offers_FSA_DependentCare = false;
                            survey.Section125.Offers_FSA_LimitedPurposeMedical = false;
                            survey.Section125.Offers_FSA_PremiumOnlyPlan = false;
                            survey.Section125.Offers_FSA_TraditionalMedical = false;
                        }
                        if(survey.Section125.Section125Id > 0)
                            db.Update(survey.Section125);
                        else
                        {
                            survey.Section125.ResponseId = responseId;
                            db.Insert(survey.Section125);
                        }
                    }

                }
            }

            return survey.GeneralResponse.ResponseId;
        }

        public void ChangeStatus(int responseId, int status)
        {
            using (hpsDB db = new hpsDB())
            {
                // set survey response status
                string sql = string.Format("UPDATE SurveyResponse_General SET [SurveyResponseStatusTypeId] = {0} WHERE ResponseId = {1}", status, responseId);
                db.Execute(sql);
            }

        }
        #endregion

        #region Brokers
        //Get the list of brokers.
        public IEnumerable<Broker> GetBrokers(UserInfo curUser)
        {
            string sql = BrokersSql;
            if (!(curUser.IsInRole("Administrators") | curUser.IsInRole("SuperUsers")))
                sql += string.Format(@" AND EXISTS (
                            SELECT NULL
                            FROM UserSettings u
                            WHERE b.MemberFirmId = u.MemberFirmId
                            AND u.UserID = {0}
                        )", curUser.UserID);

            IEnumerable<Broker> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<Broker>(sql);
                t = result;
            }
            return t;

        }

        //Get the list of brokers.
        public IEnumerable<Broker> GetBrokers(int memberFirmId)
        {
            IEnumerable<Broker> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<Broker>(BrokersByMemberFirmIdSql, memberFirmId);
                t = result;
            }
            return t;

        }
        #endregion

        #region Clients
        ////Get the list of Clients.
        //public IEnumerable<Client> GetClients(UserInfo curUser)
        //{
        //    string sql = @"SELECT DISTINCT OrganizationName as Name
        //                    FROM SurveyResponse_General r 
        //                    INNER JOIN Survey s on r.SurveyId = s.SurveyId 
        //                    WHERE s.SurveyYear = (SELECT TOP 1 SurveyYear FROM Survey ORDER BY SurveyYear DESC) ";
        //    if (!(curUser.IsInRole("Administrators") | curUser.IsInRole("SuperUsers")))
        //        sql += string.Format(@" AND EXISTS (
        //                    SELECT NULL
        //                    FROM wm4dnn.dbo.uba_Users u
        //                    WHERE r.MemberFirmId = u.MemberFirmId
        //                    AND u.UserID = {0}
        //                )", curUser.UserID);

        //    IEnumerable<Client> t;
        //    using (hpsDB db = new hpsDB())
        //    {
        //        var result = db.Fetch<Client>(sql);
        //        t = result;
        //    }
        //    return t;

        //}

        //Get the list of Clients.
        public IEnumerable<Client> GetClientsByBroker(int userId, int memberFirmId)
        {
            IEnumerable<Client> t;
            using (hpsDB db = new hpsDB())
            {
                //get last year's client list
                var result = db.Fetch<Client>(@"SELECT DISTINCT OrganizationName as Name
                                                FROM SurveyResponse_General rg 
                                                INNER JOIN Survey s on rg.SurveyId = s.SurveyId 
                                                WHERE s.SurveyYear = (SELECT TOP 1 SurveyYear FROM Survey ORDER BY SurveyYear DESC) - 1
                                                AND MemberFirmId = @0 
                                                ORDER BY OrganizationName ", memberFirmId);
                t = result;
            }
            return t;

        }

        //Get the list of Clients.
        public IEnumerable<Client> GetClients(UserInfo curUser)
        {
            string sql = @"SELECT DISTINCT r.ResponseId, r.OrganizationName as Name
                            FROM SurveyResponse_General r  
                            INNER JOIN Survey s on r.SurveyId = s.SurveyId 
                            WHERE s.SurveyYear = (SELECT TOP 1 SurveyYear FROM Survey ORDER BY SurveyYear DESC) - 1 ";
            if (!(curUser.IsInRole("Administrators") | curUser.IsInRole("SuperUsers")))
                sql += string.Format(@" AND EXISTS (
                            SELECT NULL
                            FROM UserSettings u
                            WHERE r.MemberFirmId = u.MemberFirmId
                            AND u.UserID = {0}
                        )", curUser.UserID);

            IEnumerable<Client> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<Client>(sql);
                t = result;
            }
            return t;

        }
        #endregion

        #region Users
        //Get the list of Users.
        public IEnumerable<Person> GetUsers()
        {
            IEnumerable<Person> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<Person>(@"SELECT
                                                u.UserID, u.Username, u.FirstName, u.LastName, u.DisplayName, 
                                                u.Email, uu.PhoneOffice, uu.PhoneCell, uu.Title, uu.MemberFirmId 
                                                FROM dnn_Users u 
                                                LEFT OUTER JOIN wm4dnn.dbo.[vw_uba_Users] uu on u.email = uu.email 
                                                ORDER BY u.LastName, u.FirstName");
                t = result;
            }
            return t;

        }

        //Get this User.
        public Person GetUserById(int userId)
        {

            string sql = string.Format(@"SELECT
                            u.UserID as PersonId, u.Username, u.FirstName, u.LastName, u.DisplayName, 
                            u.Email as EmailAddress, uu.PhoneOffice as OfficePhoneNumber, 
                            uu.PhoneCell as CellPhoneNumber, uu.Title as JobTitle, uu.MemberFirmId 
                            FROM dnn_Users u 
                            LEFT OUTER JOIN wm4dnn.dbo.[vw_uba_Users] uu on u.email = uu.email 
                            WHERE u.UserID = {0}
                            ORDER BY u.LastName, u.FirstName", userId);

            Person t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.SingleOrDefault<Person>(sql);
                t = result;
            }
            return t;

        }

        #endregion

        #region Miscellaneous

        //Get the list of US States.
        public IEnumerable<US_State> GetUsStates()
        {
            IEnumerable<US_State> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<US_State>(@"SELECT [TypeId]
                                                  ,[Name]
                                                  ,[StateCode]
                                                  ,[Description]
                                                  ,[RegionId]
                                              FROM [dbo].[US_State]");
                t = result;
            }
            return t;

        }

        //Get the key/value pair from selected reference table.
        public IEnumerable<ReferenceTable> GetReferences()
        {
            IEnumerable<ReferenceTable> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<ReferenceTable>(@"SELECT [TableId]
                                                  ,[TableName]
                                              FROM ReferenceTable");
                t = result;
            }
            return t;

        }

        //Get the key/value pair from selected reference table.
        public IEnumerable<ReferenceTable> GetReferencesByName(string TableName)
        {
            IEnumerable<ReferenceTable> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<ReferenceTable>(@"SELECT [TypeId]
                                                  ,[Name]
                                              FROM " + TableName + " WHERE TypeId >= 0");
                t = result;
            }
            return t;

        }

        //Get the key/value pair from selected reference table.
        public IEnumerable<ReferenceTable> GetReferencesById(int TableId)
        {
            IEnumerable<ReferenceTable> t;
            using (hpsDB db = new hpsDB())
            {
                string tableName = db.ExecuteScalar<string>(@"SELECT TableName FROM ReferenceTable WHERE TableId = @0", TableId);
                var result = db.Fetch<ReferenceTable>(@"SELECT [TypeId]
                                                  ,[Name]
                                              FROM @0", tableName);
                t = result;
            }
            return t;

        }


        #endregion
    }
}