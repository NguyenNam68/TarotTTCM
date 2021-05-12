using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Tarot.Model.EF;
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
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<Cart>();
            if (cart != null)
            {
                list = (List<Cart>)cart;
            }
            return View(list);
        }
        [HttpPost]
        public ActionResult Payment(string shipName, string email, string address, string mobile)
        {
            var order = new Order();
            order.CreatedDate = DateTime.Now;
            order.ShipAddress = address;
            order.ShipEmail = email;
            order.ShipMobile = mobile;
            order.ShipName = shipName;
            order.Status = false;

            try
            {
                var id = new OrderService().Insert(order);
                var orderdt = new OrderDetailService();
                var cart = (List<Cart>)Session[CartSession];
                foreach (var item in cart)
                {
                    var orderDetail = new OrderDetail();
                    orderDetail.OrderID = id;
                    orderDetail.ProductID = item.product.ID;
                    orderDetail.Quantity = item.Quantity;
                    orderDetail.Price = item.product.Price;
                    orderdt.Insert(orderDetail);
                }
            }
            catch(Exception)
            {
                return Redirect("/loi-thanhtoan");
            }
            return Redirect("/hoan-thanh/");
        }
        public ActionResult Success()
        {
            return View();
        }
    }
}