using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Web.Api;

namespace UBA.Modules.HPS_API.Services
{
    public class ControllerBase : DnnApiController
    {
        #region "KeepAlive"
        //[DnnAuthorize()]
        [AllowAnonymous] 
        [HttpGet()]
        public HttpResponseMessage KeepAlive()
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, "True");
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