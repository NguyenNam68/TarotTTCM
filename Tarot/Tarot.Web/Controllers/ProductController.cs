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
        public ActionResult Index()
        {
            var productcategory = new ProductCategoryService().ListAllCategory();
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Product = new ProductService().ListProduct();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();

            return View(productcategory);
        }
        public ActionResult Publisher(int publisherid)
        {
            ViewBag.PrCategory = new ProductCategoryService().ViewDetail(publisherid);
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();

            var model = new ProductService().ListByPublisherID(publisherid);
            return View(model);

        }
        public ActionResult Category(int categoryid)
        {
            ViewBag.PrCategory = new ProductCategoryService().ViewDetail(categoryid);
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();

            var model = new ProductService().ListByCategoryID(categoryid);
            return View(model);
        }

        public ActionResult Type(int typeid)
        {
            ViewBag.PrType = new ProductTypeService().ViewDetail(typeid);
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();

            var model = new ProductService().ListByTypeID(typeid);

            return View(model);
        }


        public ActionResult Detail(int productid)
        {
            var product = new ProductService().ViewDetail(productid);
            ViewBag.Tags = new ProductTagService().ListTagByID(productid);
            ViewBag.Category = new ProductCategoryService().ViewDetail(product.CategoryID);
            ViewBag.RelatedProduct = new ProductService().ListRelatedProduct(productid);
            return View(product);
        }    
    }
}