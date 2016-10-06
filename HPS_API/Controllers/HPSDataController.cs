using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UBA.Modules.HPS_API.Models;

namespace UBA.Modules.HPS_API.Services
{
    public class HPSDataController
    {
        #region Syntax

        //CRUD operation + TableName;

        #endregion

        #region SurveyResponse Data
        //Get the intial data for the partner firm.
        public IEnumerable<SurveyItemModel> GetSurveyListData()
        {
            IEnumerable<SurveyItemModel> t;
            using (hpsDB db = new hpsDB())
            {
                var result = db.Fetch<SurveyItemModel>(
                    @"SELECT top 10 r.ResponseId, '' as 'Broker', r.OrganizationName as 'Client', r.City, s.StateCode as 'StateProvince', 
                        r.PersonCompletingSurvey as 'ClientContact', r.PersonCompletingSurvey_Email as 'ClientEmail', 
                        r.PersonCompletingSurvey_Phone as 'ClientPhone', r.PersonCompletingSurvey_PhoneExt as 'ClientPhoneExt', 
                        r.CompletedBy, st.[Description] as 'ResponseStatus', r.CreatedOn, r.UpdatedOn, r.CompletedOn  
                        FROM hps_SurveyResponse_General r 
                        INNER JOIN hps_US_State s on r.US_StateId = s.US_StateId 
                        INNER JOIN hps_SurveyResponseStatusType st on r.SurveyResponseStatusTypeId = st.SurveyResponseStatusTypeId 
                        ORDER BY OrganizationName");
                t = result;
            }
            return t;

        }
        #endregion
    }
}