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
    public class ProductTagAdminController : BaseController
    {
        // GET: Admin/ProductTagAdmin
        public ActionResult Index(string search, int page = 1, int pageSize = 5)
        {
            var service = new ProductTagService();

            var model = service.DanhSachPTPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        public void SetViewBagProduct(int? selectedProductID = null)
        {
            var service = new ProductTagService();
            ViewBag.ProductID = new SelectList(service.ListAllProduct(), "ID", "ProductName", selectedProductID);
        }
        public void SetViewBagType(int? selectedTypeID = null)
        {
            var service = new ProductTagService();
            ViewBag.TypeID = new SelectList(service.ListAllType(), "ID", "TypeName", selectedTypeID);
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagProduct();
            SetViewBagType();
            return View();
        }
        [HttpPost]
        public ActionResult CreateTag(ProductTag productTag)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductTagService();
                int id = service.Insert(productTag);
                if (id > 0)
                {
                    SetAlert("Thêm thẻ sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductTagAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thẻ sản phẩm thất bại!");
                }
            }
            SetViewBagType(productTag.TypeID);
            SetViewBagProduct(productTag.ProductID);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var productTag = new ProductTagService().ViewDetail(id);
            SetViewBagProduct(productTag.ProductID);
            SetViewBagType(productTag.TypeID);
            return View(productTag);
        }
        [HttpPost]
        public ActionResult Edit(ProductTag productTag)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductTagService();
                var result = service.Update(productTag);
                if (result)
                {
                    SetAlert("Cập nhật thẻ sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductTagAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thẻ sản phẩm thất bại!");
                }
            }
            SetViewBagProduct(productTag.ProductID);
            SetViewBagType(productTag.TypeID);
            return View("Index");
        }
        public ActionResult Delete(int id)
        {
            new ProductTagService().Delete(id);

            return RedirectToAction("Index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new ProductTagService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}