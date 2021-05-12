using PagedList;
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
        public ActionResult Index(string search, int page = 1, int pageSize = 9)
        {
            var product = new ProductService().DanhSachSPPaging(search).ToPagedList(page,pageSize);
            ViewBag.Search = search;
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();
            ViewBag.Product = new ProductService().ListProduct();

            return View(product);
        }
        public ActionResult Publisher(string search, int publisherid, int page = 1, int pageSize = 9)
        {
            var model = new ProductService().PublisherPaging(search, publisherid).ToPagedList(page, pageSize);

            ViewBag.PrCategory = new ProductCategoryService().ViewDetail(publisherid);
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();
            ViewBag.Product = new ProductService().ListProduct();

            return View(model);

        }
        public ActionResult Category(string search, int categoryid ,int page = 1, int pageSize = 9)
        {
            var model = new ProductService().CategoryPaging(search, categoryid).ToPagedList(page, pageSize);

            ViewBag.PrCategory = new ProductCategoryService().ViewDetail(categoryid);
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();
            ViewBag.Product = new ProductService().ListProduct();

            return View(model);
        }

        public ActionResult Type(string search,int typeid,int page=1,int pageSize=9)
        {
            var model = new ProductService().TypePaging(search ,typeid).ToPagedList(page,pageSize);

            ViewBag.PrType = new ProductTypeService().ViewDetail(typeid);
            ViewBag.Type = new ProductTypeService().ListType();
            ViewBag.Category = new ProductCategoryService().ListAllCategory();
            ViewBag.Publisher = new PublisherService().ListAllPublisher();
            ViewBag.Product = new ProductService().ListProduct();

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