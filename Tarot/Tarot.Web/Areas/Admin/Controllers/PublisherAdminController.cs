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
        public ActionResult Index(int page=1, int pageSize=5)
        {
            var service = new PublisherService();
            var model = service.DanhSachNXBPaging(page, pageSize);
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
                    return RedirectToAction("Index", "PublisherAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm nhà xuất bản thành công!");
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
        public ActionResult EditPublisher(Publisher publisher)
        {
            if (ModelState.IsValid)
            {
                var service = new PublisherService();
                var result = service.Update(publisher);
                if (result)
                {
                    return RedirectToAction("Index", "PublisherAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật nhà xuất bản thành công!");
                }
            }
            return View("Index");
        }
        public ActionResult DeletePublisher(int id)
        {
            new PublisherService().Delete(id);

            return RedirectToAction("Index");
        }
    }
}