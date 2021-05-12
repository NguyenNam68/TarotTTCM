using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class CartAdminController : BaseController
    {
        // GET: Admin/CartAdmin
        public ActionResult Index(string search, int page = 1, int pageSize = 5)
        {
            var service = new CartService();
            var model = service.DanhSachDHPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public ActionResult Detail(int id)
        {
            var model = new OrderDetailService().ListOrderDetail(id);
            return View(model);
        }
        [HttpPost]
        public JsonResult CheckOrder(int id)
        {
            var check = new OrderDetailService().CheckOrder(id);
            return Json(new
            {
                status = check
            });
        }
    }
}