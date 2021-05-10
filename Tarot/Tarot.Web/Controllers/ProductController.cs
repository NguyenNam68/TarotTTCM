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
        public ActionResult Index(int page = 1, int pageSize = 9)
        {
            var productcategory = new ProductCategoryService().ListAllCategory();
            ViewBag.Type = new ProductTypeService().ListType();
            int totalRecord = 0;
            ViewBag.Product = new ProductService().ListProduct(ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 8;
            int totalPage = 0;
            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));

            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(productcategory);
        }
        [ChildActionOnly]
        public PartialViewResult Publisher()
        {
            var model = new PublisherService().ListAllPublisher();
            return PartialView(model);

        }
        public ActionResult Category(int categoryid, int page=1, int pageSize=9)
        {
            ViewBag.PrCategory = new ProductCategoryService().ViewDetail(categoryid);
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();

            int totalRecord = 0;
            var model = new ProductService().ListByCategoryID(categoryid, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 8;
            int totalPage = 0;
            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));

            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;
            
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