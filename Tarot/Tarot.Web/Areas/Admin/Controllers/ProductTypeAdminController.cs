using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.EF;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class ProductTypeAdminController : BaseController
    {
        // GET: Admin/ProductTypeAdmin
        public ActionResult Index(int page=1, int pageSize=5)
        {
            var service = new ProductTypeService();
            var model = service.DanhSachLSPPaging(page, pageSize);
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateProductType(ProductType productType)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductTypeService();
                int id = service.Insert(productType);
                if (id > 0)
                {
                    return RedirectToAction("Index", "ProductTypeAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm loại sản phẩm thành công!");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var productType = new ProductTypeService().ViewDetail(id);

            return View(productType);
        }
        [HttpPost]
        public ActionResult EditProductType(ProductType productType)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductTypeService();
                var result = service.Update(productType);
                if (result)
                {
                    return RedirectToAction("Index", "ProductTypeAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật loại sản phẩm thành công!");
                }
            }
            return View("Index");
        }
        public ActionResult DeleteProductType(int id)
        {
            new ProductTypeService().Delete(id);

            return RedirectToAction("Index");
        }
    }
}