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
        public ActionResult Index(int page = 1, int pageSize = 8)
        {
            var service = new ProductService(); 

            var model = service.DanhSachSPPaging(page, pageSize);
            return View(model);
        }
        public void SetViewBagType(long? selectedTypeID = null)
        {
            var service = new ProductService();
            ViewBag.TypeID = new SelectList(service.ListAllType(), "ID", "TypeName", selectedTypeID);
        }
        public void SetViewBagCategory(long? selectedCategoryID = null)
        {
            var service = new ProductService();
            ViewBag.CategoryID = new SelectList(service.ListAllCategory(), "ID", "CategoryName", selectedCategoryID);
        }
        public void SetViewBagPublisher(long? selectedPublisherID = null)
        {
            var service = new ProductService();
            ViewBag.PublisherID = new SelectList(service.ListAllPublisher(), "ID", "Name", selectedPublisherID);
        }
        public ActionResult Create()
        {
            SetViewBagType();
            SetViewBagCategory();
            SetViewBagPublisher();
            return View();
        }
        [HttpPost]
        public ActionResult CreateProduct(Product product)
        {
            if (ModelState.IsValid)
            {
                var service = new ProductService();
                int id = service.Insert(product);
                if (id > 0)
                {
                    return RedirectToAction("Index", "ProductAdmin");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm mới thành công");
                }
            }
            return View("Index");
        }
        public ActionResult EditProduct(int id)
        {
            var product = new ProductService().ViewDetail(id);
            return View(product);
        }
    }
}