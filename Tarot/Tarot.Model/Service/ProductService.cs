using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;
using Tarot.Model.ViewModel;

namespace Tarot.Model.Service
{
    public class ProductService
    {
        TarotDbContext db = null;
        public ProductService()
        {
            db = new TarotDbContext();
        }
        public Product ViewDetail(int id)
        {
            return db.Products.Find(id);
        }

        /*List các dữ liệu*/
        public List<Product> ListProduct()
        {
            var model=db.Products.Where(x => x.Status == true).
                OrderByDescending(x => x.CreatedDate).ToList();
            return model;
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
            int top = 12;
            var product = db.Products.Find(productID);
            return db.Products.Where(x => x.ID != productID &&x.CategoryID==product.CategoryID &&x.Status == true).Take(top).ToList();
        }
        public List<Product> ListByCategoryID(int categoryID)
        {
            var model= db.Products.Where(x => x.CategoryID == categoryID && x.Status == true).
                OrderByDescending(x=>x.CreatedDate).ToList();
            return model;
        }
        public List<Product> ListByPublisherID(int publisherID)
        {
            var model = db.Products.Where(x => x.PublisherID == publisherID && x.Status == true).
                OrderByDescending(x => x.CreatedDate).ToList();
            return model;
        }
        public List<ProductTypeViewModel> ListByTypeID(int typeID)
        {
            var model = from a in db.Products
                        join b in db.ProductTags
                        on a.ID equals b.ProductID
                        where b.TypeID == typeID
                        select new ProductTypeViewModel()
                        {
                            ID=a.ID,
                            Image=a.Image,
                            ProductName=a.ProductName,
                            TypeID=b.TypeID,
                            ViewCount=a.ViewCount,
                            Price=a.Price,
                            CreatedDate=DateTime.Now,

                        };
            return model.OrderByDescending(x => x.CreatedDate).ToList();
        }

        /*Phân trang dữ liệu*/
        public IEnumerable<Product> DanhSachSPPaging(string search)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.ProductName.Contains(search));
            }
            return model.OrderByDescending(x=>x.CreatedDate).ToList();
        }
        public IEnumerable<ProductTypeViewModel> TypePaging(string search,int typeID)
        {
            var model = from a in db.Products
                        join b in db.ProductTags
                        on a.ID equals b.ProductID
                        where b.TypeID == typeID
                        select new ProductTypeViewModel()
                        {
                            ID = a.ID,
                            Image = a.Image,
                            ProductName = a.ProductName,
                            TypeID = b.TypeID,
                            ViewCount = a.ViewCount,
                            Price = a.Price,
                            CreatedDate = DateTime.Now,

                        };
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.ProductName.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToList();
        }
        public IEnumerable<Product> CategoryPaging(string search,int categoryid)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.ProductName.Contains(search));
            }
            return model.Where(x=>x.CategoryID==categoryid).OrderByDescending(x => x.CreatedDate).ToList();
        }
        public IEnumerable<Product> PublisherPaging(string search, int publisherid)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.ProductName.Contains(search));
            }
            return model.Where(x => x.PublisherID == publisherid).OrderByDescending(x => x.CreatedDate).ToList();
        }

        /*Phương thức Admin*/
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
    }
}
