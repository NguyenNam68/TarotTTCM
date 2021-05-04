using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class ProductTypeService
    {
        TarotDbContext db =null;
        public ProductTypeService()
        {
            db = new TarotDbContext();
        }
        public ProductType ViewDetail(int id)
        {
            return db.ProductTypes.Find(id);
        }
        public IEnumerable<ProductType> DanhSachLSPPaging(int page, int pageSize)
        {
            return db.ProductTypes.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(ProductType entity)
        {
            db.ProductTypes.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(ProductType entity)
        {
            try
            {
                var productType = db.ProductTypes.Find(entity.ID);
                productType.TypeName = entity.TypeName;
                productType.CreatedBy = entity.CreatedBy;
                productType.CreatedDate = DateTime.Now;

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
                var productType = db.ProductTypes.Find(id);
                db.ProductTypes.Remove(productType);
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
