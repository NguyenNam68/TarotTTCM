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
        public IEnumerable<ProductCategory> DanhSachSPPaging(string search,int page, int pageSize)
        {
            IQueryable<ProductCategory> model = db.ProductCategories;
            if(!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.CategoryName.Contains(search));
            }    
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
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
