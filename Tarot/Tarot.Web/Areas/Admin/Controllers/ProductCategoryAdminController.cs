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
    public class ProductCategoryAdminController : BaseController
    {
        // GET: Admin/ProductCategoryAdmin
        public ActionResult Index(string search,int page = 1, int pageSize = 5)
        {
            var service = new ProductCategoryService();
            var model = service.DanhSachSPPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateProductCategory(ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductCategoryService();
                int id = service.Insert(productCategory);
                if (id > 0)
                {
                    SetAlert("Thêm danh mục sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductCategoryAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm danh mục sản phẩm thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult EditProductCategory(int id)
        {
            var productCategory = new ProductCategoryService().ViewDetail(id);

            return View(productCategory);
        }
        [HttpPost]
        public ActionResult EditProductCategory(ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductCategoryService();
                var result = service.Update(productCategory);
                if (result)
                {
                    SetAlert("Cập nhật danh mục sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductCategoryAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật danh mục sản phẩm thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult DeleteProductCategory(int id)
        {
            new ProductCategoryService().Delete(id);
            SetAlert("Xóa danh mục sản phẩm thành công!", "success");
            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new ProductCategoryService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}