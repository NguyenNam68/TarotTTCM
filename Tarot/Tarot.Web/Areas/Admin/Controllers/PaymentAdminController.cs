using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.EF;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class PaymentAdminController : BaseController
    {
        // GET: Admin/PaymentAdmin
        public ActionResult Index(string search, int page = 1, int pageSize = 5)
        {
            var service = new PaymentService();
            var model = service.DanhSachTTPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreatePayment(PaymentMethod payment)
        {
            if (ModelState.IsValid)
            {
                var service = new PaymentService();
                int id = service.Insert(payment);
                if (id > 0)
                {
                    SetAlert("Thêm phương thức thanh toán thành công!", "success");
                    return RedirectToAction("Index", "PaymentAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm phương thức thanh toán thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var payment = new PaymentService().ViewDetail(id);

            return View(payment);
        }
        [HttpPost]
        public ActionResult Edit(PaymentMethod payment)
        {
            if (ModelState.IsValid)
            {
                var service = new PaymentService();
                var result = service.Update(payment);
                if (result)
                {
                    SetAlert("Cập nhật phương thức thanh toán thành công!", "success");
                    return RedirectToAction("Index", "PaymentAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật phương thức thanh toán thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new PaymentService().Delete(id);

            return RedirectToAction("Index");
        }
        public JsonResult ChangeStatus(int id)
        {
            var result = new PaymentService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}