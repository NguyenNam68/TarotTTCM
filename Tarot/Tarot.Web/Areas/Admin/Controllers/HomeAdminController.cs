using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class HomeAdminController : BaseController
    {
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            ViewBag.User = new UserService().ListUser();
            ViewBag.Order = new OrderService().ListOrders();
            ViewBag.Detail = new OrderDetailService().ListAllDetail();
            return View();
        }
    }
}