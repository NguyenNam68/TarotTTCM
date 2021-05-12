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
    public class StoreAdminController : BaseController
    {
        // GET: Admin/StoreAdmin
        public ActionResult Index(string search,int page = 1, int pageSize = 5)
        {
            var service = new StoreService();
            var model = service.ListStorePaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateStore(Store store)
        {
            if (ModelState.IsValid)
            {
                var service = new StoreService();
                int id = service.Insert(store);
                if (id > 0)
                {
                    SetAlert("Thêm cửa hàng thành công!", "success");
                    return RedirectToAction("Index", "StoreAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm cửa hàng thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var store = new StoreService().ViewDetail(id);

            return View(store);
        }
        [HttpPost]
        public ActionResult Edit(Store store)
        {
            if (ModelState.IsValid)
            {
                var service = new StoreService();
                var result = service.Update(store);
                if (result)
                {
                    SetAlert("Cập nhật cửa hàng thành công!", "success");
                    return RedirectToAction("Index", "StoreAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật cửa hàng thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new StoreService().Delete(id);

            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new StoreService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}