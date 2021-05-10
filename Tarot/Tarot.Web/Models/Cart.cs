using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tarot.Model.EF;

namespace Tarot.Web.Models
{
    [Serializable]
    public class Cart
    {
        public Product product { set; get; }
        public int Quantity { set; get; }
        
    }
}