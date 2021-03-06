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
    public class TagAdminController : BaseController
    {
        // GET: Admin/TagAdmin
        public ActionResult Index(string search,int page = 1, int pageSize = 5)
        {
            var service = new TagService();
            var model = service.ListNameTagPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateTag(Tag tag)
        {
            if (ModelState.IsValid)
            {
                var service = new TagService();
                int id = service.Insert(tag);
                if (id > 0)
                {
                    SetAlert("Thêm thẻ tên thành công!", "success");
                    return RedirectToAction("Index", "TagAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thẻ tên thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var tag = new TagService().ViewDetail(id);

            return View(tag);
        }
        [HttpPost]
        public ActionResult Edit(Tag tag)
        {
            if (ModelState.IsValid)
            {
                var service = new TagService();
                var result = service.Update(tag);
                if (result)
                {
                    SetAlert("Cập nhật thẻ tên thành công!", "success");
                    return RedirectToAction("Index", "TagAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thẻ tên thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new TagService().Delete(id);

            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new TagService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}