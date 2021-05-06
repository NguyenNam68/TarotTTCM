using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class StoreService
    {
        TarotDbContext db = null;
        public StoreService()
        {
            db = new TarotDbContext();
        }
        public Store ViewDetail(int id)
        {
            return db.Stores.Find(id);
        }
        public IEnumerable<Store> ListStorePaging(string search,int page, int pageSize)
        {
            IQueryable<Store> model = db.Stores;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.NameStore.Contains(search)||x.Address.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(Store entity)
        {
            db.Stores.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(Store entity)
        {
            try
            {
                var store = db.Stores.Find(entity.ID);
                store.NameStore = entity.NameStore;
                store.Address = entity.Address;
                store.Phone = entity.Phone;
                store.TimeOpen = entity.TimeOpen;
                store.CreatedBy = entity.CreatedBy;
                store.CreatedDate = DateTime.Now;

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
                var store = db.Stores.Find(id);
                db.Stores.Remove(store);
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
