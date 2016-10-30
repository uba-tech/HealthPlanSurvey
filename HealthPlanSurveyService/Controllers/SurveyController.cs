using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Api;
using DotNetNuke.Security;
using DotNetNuke.Entities.Users;
using UBA.Modules.HealthPlanSurveyService.Models;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class SurveyController : ControllerBase
    {
        private UserInfo _currentUser;

        private SurveyController()
        {
            _currentUser = DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo();
            //_userId = _currentUser.UserID;
            //_isAdminUser = _currentUser.IsInRole("Administrators") | _currentUser.IsInRole("");
        }

        #region "Web Methods"

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



        [AllowAnonymous]
        [HttpGet()]
        public HttpResponseMessage UsStates()
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetUsStates();
                return Request.CreateResponse(HttpStatusCode.OK, item);
            }
            catch (Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }

        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpGet()]
        public HttpResponseMessage Survey()
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetSurveyListData(_currentUser);
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
        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpGet()]
        public HttpResponseMessage SurveySummary()
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetSurveyListData(_currentUser);
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
        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpGet()]
        public HttpResponseMessage SurveyCarryForward(int responseId)
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetSurvey(responseId);
                item.GeneralResponse.ResponseId = 0;
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
        [DnnAuthorize(StaticRoles = "Registered Users")]
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

        /// <summary>
        /// Get Survey Summary Item
        /// </summary>
        /// <param name="responseId"></param>
        /// <returns></returns>
        //[DnnAuthorize()]
        //[AllowAnonymous]
        //[HttpGet()]
        //public HttpResponseMessage Survey(SurveyFilter filter)
        //{
        //    try
        //    {
        //        HPSDataController dataController = new HPSDataController();
        //        var item = dataController.GetSurveyResponse_Summary(filter);
        //        return Request.CreateResponse(HttpStatusCode.OK, item);
        //    }
        //    catch (Exception ex)
        //    {
        //        //Log to DotNetNuke and reply with Error
        //        Exceptions.LogException(ex);
        //        return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
        //    }

        //}


        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpPut()]
        public HttpResponseMessage Survey(SurveyResponseItem survey)
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                dataController.SaveSurveyResponse(survey);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                //Log to DotNetNuke and reply with Error
                Exceptions.LogException(ex);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpPost()]
        public HttpResponseMessage Survey(int responseId, int status)
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                dataController.ChangeStatus(responseId, status);
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