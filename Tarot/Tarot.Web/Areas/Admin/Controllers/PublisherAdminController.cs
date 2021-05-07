using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.EF;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class PublisherAdminController : BaseController
    {
        // GET: Admin/PublisherAdmin
        public ActionResult Index(string search,int page=1, int pageSize=5)
        {
            var service = new PublisherService();
            var model = service.DanhSachNXBPaging(search,page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreatePublisher(Publisher publisher)
        {
            if (ModelState.IsValid)
            {
                var service = new PublisherService();
                int id = service.Insert(publisher);
                if (id > 0)
                {
                    SetAlert("Thêm nhà xuất bản thành công!", "success");
                    return RedirectToAction("Index", "PublisherAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm nhà xuất bản thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var publisher = new PublisherService().ViewDetail(id);

            return View(publisher);
        }
        [HttpPost]
        public ActionResult Edit(Publisher publisher)
        {
            if (ModelState.IsValid)
            {
                var service = new PublisherService();
                var result = service.Update(publisher);
                if (result)
                {
                    SetAlert("Cập nhật nhà xuất bản thành công!", "success");
                    return RedirectToAction("Index", "PublisherAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật nhà xuất bản thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new PublisherService().Delete(id);

            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new PublisherService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}