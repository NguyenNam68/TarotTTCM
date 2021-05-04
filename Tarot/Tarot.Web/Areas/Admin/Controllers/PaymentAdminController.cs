﻿using System;
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
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            var service = new PaymentService();
            var model = service.DanhSachTTPaging(page, pageSize);
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
                    return RedirectToAction("Index", "PaymentAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm phương thức thanh toán thành công!");
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
        public ActionResult EditPayment(PaymentMethod payment)
        {
            if (ModelState.IsValid)
            {
                var service = new PaymentService();
                var result = service.Update(payment);
                if (result)
                {
                    return RedirectToAction("Index", "PaymentAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật phương thức thanh toán thành công!");
                }
            }
            return View("Index");
        }
        public ActionResult DeletePayment(int id)
        {
            new PaymentService().Delete(id);

            return RedirectToAction("Index");
        }
    }
}