using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class CartService
    {
        TarotDbContext db = null;
        public CartService()
        {
            db = new TarotDbContext();
        }
        public Order ViewDetail(int id)
        {
            return db.Orders.Find(id);
        }
        public IEnumerable<Order> DanhSachDHPaging(string search)
        {
            IQueryable<Order> model = db.Orders;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.ShipName.Contains(search)||x.ShipEmail.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToList();
        }
    }
}
