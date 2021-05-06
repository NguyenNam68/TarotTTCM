using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.EF;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class NewCategoryAdminController : BaseController
    {
        // GET: Admin/NewCategoryAdmin
        public ActionResult Index(string search,int page = 1, int pageSize = 5)
        {
            var service = new NewCategoryService();
            var model = service.ListNewCategoryPaging(search,page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateNewCategory(NewCategory newCategory)
        {
            if (ModelState.IsValid)
            {
                var service = new NewCategoryService();
                int id = service.Insert(newCategory);
                if (id > 0)
                {
                    return RedirectToAction("Index", "NewCategoryAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm danh mục tin tức thành công!");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var newCategory = new NewCategoryService().ViewDetail(id);

            return View(newCategory);
        }
        [HttpPost]
        public ActionResult Edit(NewCategory newCategory)
        {
            if (ModelState.IsValid)
            {
                var service = new NewCategoryService();
                var result = service.Update(newCategory);
                if (result)
                {
                    return RedirectToAction("Index", "NewCategoryAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật danh mục tin tức thành công!");
                }
            }
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new NewCategoryService().Delete(id);

            return RedirectToAction("Index");
        }
    }
}