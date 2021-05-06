using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class NewService
    {
        TarotDbContext db = null;
        public NewService()
        {
            db = new TarotDbContext();
        }
        public List<NewCategory> ListAllNew()
        {
            return db.NewCategories.Where(x => x.Status == true).ToList();
        }
        public News ViewDetail(int id)
        {
            return db.News.Find(id);
        }
        public IEnumerable<News> DanhSachNPaging(string search, int page, int pageSize)
        {
            IQueryable<News> model = db.News;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.Title.Contains(search) || x.Content.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Insert(News entity)
        {
            db.News.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(News entity)
        {
            try
            {
                var news = db.News.Find(entity.ID);
                news.Title = entity.Title;
                news.Content = entity.Content;
                news.NewCategoryID = entity.NewCategoryID;
                news.CreatedBy = entity.CreatedBy;
                news.CreatedDate = DateTime.Now;

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
                var news = db.News.Find(id);
                db.News.Remove(news);
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
