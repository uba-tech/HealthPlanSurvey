using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Api;
using UBA.Modules.HealthPlanSurveyService.Models;
using DotNetNuke.Security;
using DotNetNuke.Entities.Users;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class ClientController : ControllerBase
    {
        private UserInfo _currentUser =
                   DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo();
        //private int _userId = _currentUser.UserID;
        //TODO: remove hardcoded userid
        private int _userId = 2900;

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
        //[DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [HttpGet()]
        public HttpResponseMessage Client()
        {
            //TODO:  figure out security
            
            try
            {
                HPSDataController dataController = new HPSDataController();
                //var item = dataController.GetClients(currentUser.UserID);
                var item = dataController.GetClients(_userId);
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
        /// <param name="brokerId"></param>
        /// <returns></returns>
        [AllowAnonymous]
        //[DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [HttpGet()]
        public HttpResponseMessage Client(int brokerId)
        {
            UserInfo currentUser =
                   DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo();
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetClientsByBroker(currentUser.UserID, brokerId);
                return Request.CreateResponse(HttpStatusCode.OK, item);
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