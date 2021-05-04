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
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            var service = new ProductCategoryService();
            var model = service.DanhSachSPPaging(page, pageSize);
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
                    return RedirectToAction("Index", "ProductCategoryAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm danh mục sản phẩm thành công!");
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
                    return RedirectToAction("Index", "ProductCategoryAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật danh mục sản phẩm thành công!");
                }
            }
            return View("Index");
        }
        public ActionResult DeleteProductCategory(int id)
        {
            new ProductCategoryService().Delete(id);

            return RedirectToAction("Index");
        }
    }
}