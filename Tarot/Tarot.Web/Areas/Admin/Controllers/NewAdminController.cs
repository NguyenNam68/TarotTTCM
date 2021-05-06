using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.EF;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class NewAdminController : BaseController
    {
        // GET: Admin/NewAdmin
        public ActionResult Index(string search, int page = 1, int pageSize = 4)
        {
            var service = new NewService();
            var model = service.DanhSachNPaging(search, page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public void SetViewBagNew(int? selectedNewID = null)
        {
            var service = new NewService();
            ViewBag.NewCategoryID = new SelectList(service.ListAllNew(), "ID", "Name", selectedNewID);
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagNew();
            return View();
        }
        [HttpPost]
        public ActionResult CreateNew(News news)
        {
            if (ModelState.IsValid)
            {
                var service = new NewService();
                int id = service.Insert(news);
                if (id > 0)
                {
                    return RedirectToAction("Index", "NewAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm bài viết mới thành công!");
                }
            }
            SetViewBagNew(news.NewCategoryID);
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var news = new NewService().ViewDetail(id);
            SetViewBagNew(news.NewCategoryID);
            return View(news);
        }
        [HttpPost]
        public ActionResult Edit(News news)
        {
            if (ModelState.IsValid)
            {
                var service = new NewService();
                var result = service.Update(news);
                if (result)
                {
                    return RedirectToAction("Index", "NewAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật bài viết thành công!");
                }
            }
            SetViewBagNew(news.NewCategoryID);
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new NewService().Delete(id);

            return RedirectToAction("Index");
        }
    }
}