using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class ProductService
    {
        TarotDbContext db = null;
        public ProductService()
        {
            db = new TarotDbContext();
        }
        public List<ProductCategory> ListAllCategory()
        {
            return db.ProductCategories.Where(x => x.Status == true).ToList();
        }
        public List<Publisher> ListAllPublisher()
        {
            return db.Publishers.Where(x => x.Status == true).ToList();
        }
        public Product ViewDetail(int id)
        {
            return db.Products.Find(id);
        }
        public List<Product> ListNewProduct(int top)
        {
            return db.Products.Where(x=>x.Status==true).OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }
        public List<Product> ListHotProduct(int top)
        {
            return db.Products.Where(x => x.TopHot == true&&x.Status==true).OrderByDescending(x => x.CreatedDate).Take(top).ToList();        
        }
        public List<Product> ListRelatedProduct(int productID)
        {
            var product = db.Products.Find(productID);
            return db.Products.Where(x => x.ID != productID &&x.CategoryID==product.CategoryID &&x.Status == true).ToList();
        }
        public List<Product> ListByCategoryID(int categoryID)
        {
            return db.Products.Where(x => x.CategoryID == categoryID && x.Status == true).OrderByDescending(x=>x.CreatedDate).ToList();
        }
        public bool ChangeStatus(int id)
        {
            var product = db.Products.Find(id);
            product.Status = !product.Status;
            db.SaveChanges();
            return product.Status;
        }

        public bool ChangeHot(int id)
        {
            var product = db.Products.Find(id);
            product.TopHot = !product.TopHot;
            db.SaveChanges();
            return product.TopHot;
        }
        
        public IEnumerable<Product> DanhSachSPPaging(string search, int page,int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.ProductName.Contains(search));
            }
            return model.OrderByDescending(x=>x.CreatedDate).ToPagedList(page,pageSize);
        }
        public int Insert(Product entity)
        {
            db.Products.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(Product entity)
        {
            try
            {
                var product = db.Products.Find(entity.ID);
                product.PublisherID = entity.PublisherID;
                product.ProductName = entity.ProductName;
                product.Price = entity.Price;
                product.PromotionPrice = entity.PromotionPrice;
                product.CreatedDate = DateTime.Now;

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
                var product = db.Products.Find(id);
                db.Products.Remove(product);
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
