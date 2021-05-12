using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tarot.Model.ViewModel
{
    public class OrderViewModel
    {
        public int ID { set; get; }
        public string ProductName { set; get; }
        public int OrderID { set; get; }
        public decimal? Price { set; get; }
        public int? Quantity { set; get; }
        public DateTime? DateOrder { set; get; }
    }
}
