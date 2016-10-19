using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Api;
using UBA.Modules.HealthPlanSurveyService.Models;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class SurveyController : ControllerBase
    {
        #region "Web Methods"

        //[DnnAuthorize()]
        [AllowAnonymous] 
        [HttpGet()]
        public HttpResponseMessage HelloWorld()
        {
            try
            {
                string helloWorld = "Hello World!";
                return Request.CreateResponse(HttpStatusCode.OK, helloWorld);
            }
            catch (System.Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        //[DnnAuthorize()]
        [AllowAnonymous] 
        [HttpGet()]
        public HttpResponseMessage Survey()
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetSurveyListData();
                return Request.CreateResponse(HttpStatusCode.OK, item);
            }
            catch (Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Get Paginated Survey Summary List
        /// </summary>
        /// <returns></returns>
        ///  //[DnnAuthorize()]
        [AllowAnonymous]
        [HttpGet()]
        public HttpResponseMessage SurveySummary()
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetSurveyListData();
                return Request.CreateResponse(HttpStatusCode.OK, item);
            }
            catch (Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Get Survey Summary Item
        /// </summary>
        /// <param name="responseId"></param>
        /// <returns></returns>
        //[DnnAuthorize()]
        [AllowAnonymous]
        [HttpGet()]
        public HttpResponseMessage Survey(int responseId)
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetSurvey(responseId);
                return Request.CreateResponse(HttpStatusCode.OK, item);
            }
            catch (Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        /// <summary>
        /// Get Survey Summary Item
        /// </summary>
        /// <param name="responseId"></param>
        /// <returns></returns>
        //[DnnAuthorize()]
        [AllowAnonymous]
        [HttpGet()]
        public HttpResponseMessage SurveySummary(int responseId)
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetSurveyResponse_Summary(responseId);
                return Request.CreateResponse(HttpStatusCode.OK, item);
            }
            catch (Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        //[DnnAuthorize()]
        [AllowAnonymous]
        [HttpPut]
        public HttpResponseMessage Survey(SurveySummaryModel survey)
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                dataController.SaveSurveySummaryData(survey);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        #endregion
    }
}