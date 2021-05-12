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
    public class OnlinePayingAdminController : BaseController
    {
        // GET: Admin/OnlinePayingAdmin
        public ActionResult Index(string search, int page=1, int pageSize=5)
        {
            var service = new OnlinePayingService();
            var model = service.DanhSachOPPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public void SetViewBagMethod(int? selectedMethodID = null)
        {
            var service = new OnlinePayingService();
            ViewBag.Method = new SelectList(service.ListAllPaying(), "ID", "Name", selectedMethodID);
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagMethod();
            return View();
        }
        [HttpPost]
        public ActionResult CreateOnline(OnlinePaying onlinePaying)
        {
            if (ModelState.IsValid)
            {
                var service = new OnlinePayingService();
                int id = service.Insert(onlinePaying);
                if (id > 0)
                {
                    SetAlert("Thêm thanh toán trực tiếp thành công!", "success");
                    return RedirectToAction("Index", "OnlinePayingAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thanh toán trực tuyến mới thất bại!");
                }
            }
            SetViewBagMethod(onlinePaying.Method);
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var onlinePaying = new OnlinePayingService().ViewDetail(id);
            SetViewBagMethod(onlinePaying.Method);
            return View(onlinePaying);
        }
        [HttpPost]
        public ActionResult Edit(OnlinePaying onlinePaying)
        {
            if (ModelState.IsValid)
            {
                var service = new OnlinePayingService();
                var result = service.Update(onlinePaying);
                if (result)
                {
                    SetAlert("Cập nhật thanh toán trực tiếp thành công!", "success");
                    return RedirectToAction("Index", "OnlinePayingAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thanh toán trực tuyến thất bại!");
                }
            }
            SetViewBagMethod(onlinePaying.Method);
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new PaymentService().Delete(id);

            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new OnlinePayingService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}