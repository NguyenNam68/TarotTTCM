using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class PublisherService
    {
        TarotDbContext db = null;
        public PublisherService()
        {
            db = new TarotDbContext();
        }
        public Publisher ViewDetail(int id)
        {
            return db.Publishers.Find(id);
        }
        public IEnumerable<Publisher> DanhSachNXBPaging(string search,int page, int pageSize)
        {
            IQueryable<Publisher> model = db.Publishers;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.Name.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(Publisher entity)
        {
            db.Publishers.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(Publisher entity)
        {
            try
            {
                var publisher = db.Publishers.Find(entity.ID);
                publisher.Name = entity.Name;
                publisher.CreatedBy = entity.CreatedBy;
                publisher.CreatedDate = DateTime.Now;

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
                var publisher = db.Publishers.Find(id);
                db.Publishers.Remove(publisher);
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
