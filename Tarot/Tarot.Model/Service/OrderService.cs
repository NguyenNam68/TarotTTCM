using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class OrderService
    {
        TarotDbContext db = null;
        public OrderService()
        {
            db = new TarotDbContext();
        }
        public List<Order> ListOrders()
        {
            return db.Orders.Where(x => x.Status == true).ToList();
        }
        public int Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.ID;
        }
    }
}
