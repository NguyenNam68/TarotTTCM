using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;
using Tarot.Web.Models;

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

        /*HOME MENU PRODUCT CATEGORY*/
        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryService().ListAllCategory();
            return PartialView(model);

        }

        /*HOME MENU KIEN THUC CATEGORY*/
        [ChildActionOnly]
        public ActionResult KTTarot()
        {
            var model = new NewCategoryService().ListByGroupID(1);

            return PartialView(model);
        }

        /*HOME MENU Y NGHIA CATEGORY*/
        [ChildActionOnly]
        public ActionResult YNTarot()
        {
            var model = new NewCategoryService().ListByGroupID(2);

            return PartialView(model);
        }

        /*HOME MENU CART PRODUCT CATEGORY*/
        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var cart = Session[Common.CommonConstants.CartSession];
            var list = new List<Cart>();
            if (cart != null)
            {
                list = (List<Cart>)cart;
            }
            return PartialView(list);

        }
    }
}