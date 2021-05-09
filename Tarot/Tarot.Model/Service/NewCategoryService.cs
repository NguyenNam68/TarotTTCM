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
        public List<NewCategory> ListByGroupID(int newid)
        {
            return db.NewCategories.Where(x => x.NewID == newid).ToList();
        }
        public bool ChangeStatus(int id)
        {
            var newcategory = db.NewCategories.Find(id);
            newcategory.Status = !newcategory.Status;
            db.SaveChanges();
            return newcategory.Status;
        }
        public IEnumerable<NewCategory> ListNewCategoryPaging(string search,int page, int pageSize)
        {
            IQueryable<NewCategory> model = db.NewCategories;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.Name.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
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
