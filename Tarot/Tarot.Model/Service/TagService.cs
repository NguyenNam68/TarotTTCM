using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class TagService
    {
        TarotDbContext db = null;
        public TagService()
        {
            db = new TarotDbContext();
        }
        public Tag ViewDetail(int id)
        {
            return db.Tags.Find(id);
        }
        public IEnumerable<Tag> ListNameTagPaging(int page, int pageSize)
        {
            return db.Tags.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(Tag entity)
        {
            db.Tags.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(Tag entity)
        {
            try
            {
                var tag = db.Tags.Find(entity.ID);
                tag.NameTag = entity.NameTag;
                tag.CreatedBy = entity.CreatedBy;
                tag.CreatedDate = DateTime.Now;

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
                var tag = db.Tags.Find(id);
                db.Tags.Remove(tag);
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
