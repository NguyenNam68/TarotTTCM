using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class FeedbackService
    {
        TarotDbContext db = null;
        public FeedbackService()
        {
            db = new TarotDbContext();
        }
        public IEnumerable<Feedback> ListFbPaging(string search)
        {
            IQueryable<Feedback> model = db.Feedbacks;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.Name.Contains(search)||x.Email.Contains(search)||x.Content.Contains(search)||x.Phone.Contains(search));
            }
            return model.OrderByDescending(x => x.CreatedDate).ToList();
        }
        public int Insert(Feedback entity)
        {
            db.Feedbacks.Add(entity);
            db.SaveChanges();
            
            return entity.ID;
        }
        public bool ChangeStatus(int id)
        {
            var feedback = db.Feedbacks.Find(id);
            feedback.Status = !feedback.Status;
            db.SaveChanges();
            return feedback.Status;
        }
    }
}
