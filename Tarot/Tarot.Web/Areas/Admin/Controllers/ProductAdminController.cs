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
    public class ProductAdminController : BaseController
    {
        // GET: Admin/ProductAdmin
        [HttpGet]
        public ActionResult Index(string search,int page = 1, int pageSize = 5)
        {
            var service = new ProductService(); 

            var model = service.DanhSachSPPaging(search).ToPagedList(page,pageSize);
            ViewBag.Search = search;

            return View(model);
        }

        /*VIEW DROPDOWN CATEGORY*/
        public void SetViewBagCategory(int? selectedCategoryID = null)
        {
            var service = new ProductCategoryService();
            ViewBag.CategoryID = new SelectList(service.ListAllCategory(), "ID", "CategoryName", selectedCategoryID);
        }

        /*VIEW DROPDOWN PUBLISHER*/
        public void SetViewBagPublisher(int? selectedPublisherID = null)
        {
            var service = new PublisherService();
            ViewBag.PublisherID = new SelectList(service.ListAllPublisher(), "ID", "Name", selectedPublisherID);
        }

        /*VIEW CREATE PRODUCT*/
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagCategory();
            SetViewBagPublisher();
            return View();
        }

        /*PHƯƠNG THỨC TẠO MỚI PRODUCT*/
        [HttpPost]
        public ActionResult CreateProduct(Product product)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductService();
                int id = service.Insert(product);
                if (id > 0)
                {
                    SetAlert("Thêm sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm sản phẩm thất bại!");
                }
            }
            SetViewBagCategory(product.CategoryID);
            SetViewBagPublisher(product.PublisherID);
            return View("Index");
        }

        /*VIEW EDIT PRODUCT*/
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var product = new ProductService().ViewDetail(id);
            SetViewBagCategory(product.CategoryID);
            SetViewBagPublisher(product.PublisherID);
            return View(product);
        }

        /*PHƯƠNG THỨC TRUYỀN DỮ LIỆU VÀO EDIT*/
        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductService();
                var result = service.Update(product);
                if (result)
                {
                    SetAlert("Cập nhật sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "ProductAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật sản phẩm thất bại!");
                }
            }
            SetViewBagCategory(product.CategoryID);
            SetViewBagPublisher(product.PublisherID);
            return View("Index");
        }

        /*PHƯƠNG THỨC XÓA PRODUCT*/
        public ActionResult Delete(int id)
        {
            new ProductService().Delete(id);

            return RedirectToAction("Index");
        }

        /*PHƯƠNG THỨC THAY ĐỔI TRẠNG THÁI*/
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new ProductService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }

        /*PHƯƠNG THỨC THAY ĐỔI HOT*/
        [HttpPost]
        public JsonResult ChangeHot(int id)
        {
            var result = new ProductService().ChangeHot(id);
            return Json(new
            {
                hot = result
            });
        }
    }
}