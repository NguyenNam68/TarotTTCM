using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class ProductTagService
    {
        TarotDbContext db = null;
        public ProductTagService()
        {
            db = new TarotDbContext();
        }
        public List<Product> ListAllProduct()
        {
            return db.Products.Where(x => x.Status == true).ToList();
        }
        public List<ProductType> ListAllType()
        {
            return db.ProductTypes.Where(x => x.Status == true).ToList();
        }
        public ProductTag ViewDetail(int id)
        {
            return db.ProductTags.Find(id);
        }
        public bool ChangeStatus(int id)
        {
            var productTag = db.ProductTags.Find(id);
            productTag.Status = !productTag.Status;
            db.SaveChanges();
            return productTag.Status;
        }
        public IEnumerable<ProductTag> DanhSachPTPaging(string search, int page, int pageSize)
        {
            IQueryable<ProductTag> model = db.ProductTags;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.NameTag.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(ProductTag entity)
        {
            db.ProductTags.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(ProductTag entity)
        {
            try
            {
                var productTag = db.ProductTags.Find(entity.ID);
                productTag.ProductID = entity.ProductID;
                productTag.TypeID = entity.TypeID;
                productTag.NameTag = entity.NameTag;
                productTag.CreatedDate = DateTime.Now;

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
                var productTag = db.ProductTags.Find(id);
                db.ProductTags.Remove(productTag);
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
