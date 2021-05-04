using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tarot.Web.Common
{
    [Serializable]
    public class UserLogin
    {
        public int UserID { set; get; }
        public string UserName { set; get; }

    }
}