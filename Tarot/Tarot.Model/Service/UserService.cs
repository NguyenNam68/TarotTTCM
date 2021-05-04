using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tarot.Model.EF;

namespace Tarot.Model.Service
{
    public class UserService
    {
        TarotDbContext db = null;
        public UserService()
        {
            db = new TarotDbContext();
        }
        public int Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public User GetByUsername(string username)
        {
            return db.Users.SingleOrDefault(x => x.UserName == username);
        }
        public int Login(string username, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == username);
            if(result==null)
            {
                return 1;
            }
            else
            {
                if(result.Status==false)
                {
                    return -1;
                }
                else 
                {
                    if (result.Password == password)
                        return 0;
                    else
                        return -2;
                }
            }
        }
    }
}
