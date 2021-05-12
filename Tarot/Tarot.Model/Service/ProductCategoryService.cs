using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class ProductCategoryService
    {
        TarotDbContext db = null;
        public ProductCategoryService()
        {
            db = new TarotDbContext();
        }
        public List<ProductCategory> ListAllCategory()
        {
            return db.ProductCategories.Where(x => x.Status == true).ToList();
        }
        
        public ProductCategory ViewDetail(int id)
        {
            return db.ProductCategories.Find(id);
        }
        public bool ChangeStatus(int id)
        {
            var productCategory = db.ProductCategories.Find(id);
            productCategory.Status = !productCategory.Status;
            db.SaveChanges();
            return productCategory.Status;
        }
        public IEnumerable<ProductCategory> DanhSachSPPaging(string search)
        {
            IQueryable<ProductCategory> model = db.ProductCategories;
            if(!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.CategoryName.Contains(search));
            }    
            return model.OrderByDescending(x => x.CreatedDate).ToList();
        }
        public int Insert(ProductCategory entity)
        {
            db.ProductCategories.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(ProductCategory entity)
        {
            try
            {
                var productCategory = db.ProductCategories.Find(entity.ID);
                productCategory.CategoryName = entity.CategoryName;
                productCategory.CreatedBy = entity.CreatedBy;
                productCategory.CreatedDate = DateTime.Now;

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
                var productCategory = db.ProductCategories.Find(id);
                db.ProductCategories.Remove(productCategory);
                db.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }
    }
}
