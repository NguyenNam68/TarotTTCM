using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class NewCategoryService
    {
        TarotDbContext db = null;
        public NewCategoryService()
        {
            db = new TarotDbContext();
        }
        public NewCategory ViewDetail(int id)
        {
            return db.NewCategories.Find(id);
        }
        public IEnumerable<NewCategory> ListNewCategoryPaging(int page, int pageSize)
        {
            return db.NewCategories.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(NewCategory entity)
        {
            db.NewCategories.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(NewCategory entity)
        {
            try
            {
                var newCategory = db.NewCategories.Find(entity.ID);
                newCategory.Name = entity.Name;
                newCategory.CreatedBy = entity.CreatedBy;
                newCategory.CreatedDate = DateTime.Now;

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
                var newCategory = db.NewCategories.Find(id);
                db.NewCategories.Remove(newCategory);
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
