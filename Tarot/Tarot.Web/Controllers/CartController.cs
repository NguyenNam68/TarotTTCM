using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Tarot.Model.Service;
using Tarot.Web.Models;

namespace Tarot.Web.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<Cart>();
            if(cart!=null)
            {
                list = (List<Cart>)cart;
            }    

            return View(list);
        }
        public ActionResult AddItem(int productID, int quantity)
        {
            var Product = new ProductService().ViewDetail(productID);
            var cart = Session[CartSession];
            if(cart!=null)
            {
                var list = (List<Cart>)cart;
                if(list.Exists(x=>x.product.ID==productID))
                {
                    foreach (var item in list)
                    {
                        if (item.product.ID == productID)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    //tạo mới item
                    var item = new Cart();
                    item.product = Product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                //gán vào session
                Session[CartSession] = list;
            }
            else
            {
                //tạo mới item
                var item = new Cart();
                item.product = Product;
                item.Quantity = quantity;
                var list = new List<Cart>();
                list.Add(item);
                //gán vào session
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }
        public JsonResult Update(string cartModel)
        {
            var Jsoncart = new JavaScriptSerializer().Deserialize<List<Cart>>(cartModel);
            var sessionCart = (List<Cart>)Session[CartSession];
            foreach(var item in sessionCart)
            {
                var jsonItem = Jsoncart.SingleOrDefault(x => x.product.ID == item.product.ID);
                if(jsonItem !=null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            }) ;
        }
        public JsonResult Delete(int id)
        {
            var sessionCart = (List<Cart>)Session[CartSession];
            sessionCart.RemoveAll(x => x.product.ID == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
    }
}