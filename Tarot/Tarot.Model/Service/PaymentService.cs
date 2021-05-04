using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class PaymentService
    {
        TarotDbContext db = null;
        public PaymentService()
        {
            db = new TarotDbContext();
        }
        public PaymentMethod ViewDetail(int id)
        {
            return db.PaymentMethods.Find(id);
        }
        public IEnumerable<PaymentMethod> DanhSachTTPaging(int page, int pageSize)
        {
            return db.PaymentMethods.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(PaymentMethod entity)
        {
            db.PaymentMethods.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(PaymentMethod entity)
        {
            try
            {
                var paymentMethod = db.PaymentMethods.Find(entity.ID);
                paymentMethod.Name = entity.Name;
                paymentMethod.CreatedBy = entity.CreatedBy;
                paymentMethod.CreatedDate = DateTime.Now;

                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var paymentMethod = db.PaymentMethods.Find(id);
                db.PaymentMethods.Remove(paymentMethod);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
