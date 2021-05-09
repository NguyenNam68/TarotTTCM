using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;

namespace Tarot.Web.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index(string search,int page = 1, int pageSize = 12)
        {
            var service = new ProductService();

            var model = service.DanhSachSPPaging(search, page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        [ChildActionOnly]
        public PartialViewResult Publisher()
        {
            var model = new PublisherService().ListAllPublisher();
            return PartialView(model);

        }
        public ActionResult Category(int categoryid)
        {
            var model = new ProductService().ListByCategoryID(categoryid);
            return View(model);
        }
        public ActionResult Detail(int productid)
        {
            var product = new ProductService().ViewDetail(productid);
            ViewBag.Category = new ProductCategoryService().ViewDetail(product.CategoryID);
            ViewBag.RelatedProduct = new ProductService().ListRelatedProduct(productid);
            return View(product);
        }    

    }
}