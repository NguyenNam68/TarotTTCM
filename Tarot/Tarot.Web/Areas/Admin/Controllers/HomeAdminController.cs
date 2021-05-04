using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class HomeAdminController : BaseController
    {
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }
    }
}