using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class OnlinePayingService
    {
        TarotDbContext db = null;
        public OnlinePayingService()
        {
            db = new TarotDbContext();
        }
        public List<PaymentMethod> ListAllPaying()
        {
            return db.PaymentMethods.Where(x => x.Status == true).ToList();
        }
        public OnlinePaying ViewDetail(int id)
        {
            return db.OnlinePayings.Find(id);
        }
        public bool ChangeStatus(int id)
        {
            var onlinePaying = db.OnlinePayings.Find(id);
            onlinePaying.Status = !onlinePaying.Status;
            db.SaveChanges();
            return onlinePaying.Status;
        }
        public IEnumerable<OnlinePaying> DanhSachOPPaging(string search, int page, int pageSize)
        {
            IQueryable<OnlinePaying> model = db.OnlinePayings;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.CodeAccount.Contains(search)||x.Address.Contains(search)||x.NameAccount.Contains(search)||x.NamePay.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(OnlinePaying entity)
        {
            db.OnlinePayings.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(OnlinePaying entity)
        {
            try
            {
                var onlinePaying = db.OnlinePayings.Find(entity.ID);
                onlinePaying.Method = entity.Method;
                onlinePaying.NamePay = entity.NamePay;
                onlinePaying.NameAccount = entity.NameAccount;
                onlinePaying.CodeAccount = entity.CodeAccount;
                onlinePaying.Address = entity.Address;
                onlinePaying.CreatedBy = entity.CreatedBy;
                onlinePaying.CreatedDate = DateTime.Now;

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
                var onlinePaying = db.OnlinePayings.Find(id);
                db.OnlinePayings.Remove(onlinePaying);
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
