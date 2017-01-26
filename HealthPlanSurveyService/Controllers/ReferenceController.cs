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
    public class ReferenceController : ControllerBase
    {
        //private UserInfo _currentUser =
        //           DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo();
        ////private int _userId = _currentUser.UserID;

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

        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpGet()]
        public HttpResponseMessage Reference()
        {
            // not likely to be called without a table name
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetReferences();
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
        /// <param name="TableName"></param>
        /// <returns></returns>
        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpGet()]
        public HttpResponseMessage Reference(string tbl)
        {
            UserInfo currentUser =
                   DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo();
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetReferencesByName(tbl);
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