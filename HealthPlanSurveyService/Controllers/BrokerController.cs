using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Api;
using DotNetNuke.Entities.Users;
using UBA.Modules.HealthPlanSurveyService.Models;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class BrokerController : ControllerBase
    {
        private UserInfo _currentUser;

        private BrokerController()
        {
            _currentUser = DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo();
            //_userId = _currentUser.UserID;
            //_isAdminUser = _currentUser.IsInRole("Administrators") | _currentUser.IsInRole("");
        }

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

        [DnnAuthorize(StaticRoles = "Registered Users")]
        [HttpGet()]
        public HttpResponseMessage Broker()
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetBrokers(_currentUser);
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
        //[DnnAuthorize(StaticRoles = "Registered Users")]
        //[HttpGet()]
        //public HttpResponseMessage Broker(int brokerId)
        //{
        //    try
        //    {
        //        HPSDataController dataController = new HPSDataController();
        //        var item = dataController.GetBrokerById(brokerId);
        //        return Request.CreateResponse(HttpStatusCode.OK, item);
        //    }
        //    catch (Exception ex)
        //    {
        //        //Log to DotNetNuke and reply with Error
        //        Exceptions.LogException(ex);
        //        return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
        //    }

        //}


        #endregion
    }
}