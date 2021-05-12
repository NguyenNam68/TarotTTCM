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
    public class ProductTypeAdminController : BaseController
    {
        // GET: Admin/ProductTypeAdmin
        public ActionResult Index(string search,int page=1, int pageSize=8)
        {
            var service = new ProductTypeService();
            var model = service.DanhSachLSPPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
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
                    SetAlert("Thêm loại sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductTypeAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm loại sản phẩm thất bại!");
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
        public ActionResult Edit(ProductType productType)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductTypeService();
                var result = service.Update(productType);
                if (result)
                {
                    SetAlert("Cập nhật loại sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductTypeAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật loại sản phẩm thất bại!");
                }
            }
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new ProductTypeService().Delete(id);

            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new ProductTypeService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}