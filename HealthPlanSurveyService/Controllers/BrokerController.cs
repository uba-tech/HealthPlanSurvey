using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Api;
using UBA.Modules.HealthPlanSurveyService.Models;

namespace UBA.Modules.HealthPlanSurveyService.Services
{
    public class BrokerController : ControllerBase
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
        public HttpResponseMessage Broker()
        {
            try
            {
                HPSDataController dataController = new HPSDataController();
                var item = dataController.GetBrokers();
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
        //[DnnAuthorize()]
        //[AllowAnonymous]
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