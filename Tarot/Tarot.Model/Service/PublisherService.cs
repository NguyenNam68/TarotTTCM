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
        public List<Publisher> ListAllPublisher()
        {
            return db.Publishers.Where(x => x.Status == true).ToList();
        }
        public IEnumerable<Publisher> DanhSachNXBPaging(string search)
        {
            IQueryable<Publisher> model = db.Publishers;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.Name.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToList();
        }
        public bool ChangeStatus(int id)
        {
            var publisher = db.Publishers.Find(id);
            publisher.Status = !publisher.Status;
            db.SaveChanges();
            return publisher.Status;
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
