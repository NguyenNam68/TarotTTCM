using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tarot.Model.ViewModel
{
    public class ProductTypeViewModel
    {
        public int ID { set; get; }
        public string Image { set; get; }
        public string ProductName { set; get; }
        public int TypeID { set; get; }
        public decimal? Price { set; get; }
        public int? ViewCount { set; get; }
        public DateTime CreatedDate { set; get; }
    }
}
