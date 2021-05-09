using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;

namespace Tarot.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var product = new ProductService();
            ViewBag.NewProducts = product.ListNewProduct(4);
            ViewBag.HotProducts = product.ListHotProduct(4);
            return View();
        }
        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryService().ListAllCategory();
            return PartialView(model);

        }

        [ChildActionOnly]
        public ActionResult KTTarot()
        {
            var model = new NewCategoryService().ListByGroupID(1);

            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult YNTarot()
        {
            var model = new NewCategoryService().ListByGroupID(2);

            return PartialView(model);
        }
    }
}