using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Tarot.Web.Common;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session =(UserLogin)Session[CommonConstants.USER_SESSION];
            if(session==null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary(
                        new { controller = "UserLogin", action = "Index", area = "Admin" }));
            }    
            base.OnActionExecuting(filterContext);
        }
    }
}