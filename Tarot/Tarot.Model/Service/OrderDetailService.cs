using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;
using Tarot.Model.ViewModel;

namespace Tarot.Model.Service
{
    public class OrderDetailService
    {
        TarotDbContext db = null;
        public OrderDetailService()
        {
            db = new TarotDbContext();
        }
        public List<OrderDetail> ListAllDetail()
        {
            return db.OrderDetails.ToList();
        }
        public List<OrderDetail> ListDetail(int orderid)
        {
            return db.OrderDetails.Where(x=>x.OrderID==orderid).ToList();
        }
        public List<OrderViewModel> ListOrderDetail(int orderID)
        {
            var model = from a in db.Products
                        join b in db.OrderDetails
                        on a.ID equals b.ProductID
                        join c in db.Orders
                        on b.OrderID equals c.ID
                        where b.OrderID==orderID
                        select new OrderViewModel()
                        {
                            ID = a.ID,
                            ProductName = a.ProductName,
                            OrderID = b.OrderID,
                            Price = b.Price,
                            Quantity=b.Quantity,
                            DateOrder=c.CreatedDate
                        };
            return model.ToList();
        }
        public bool CheckOrder(int id)
        {
            var order = db.Orders.Find(id);
            order.Status = !order.Status;
            db.SaveChanges();
            return order.Status;
        }
        public bool Insert(OrderDetail orderDetail)
        {
            try
            {
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }
    }
}
