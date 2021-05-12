
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class UserAdminController : BaseController
    {
        // GET: Admin/UserAdmin
        public ActionResult Index(string search, int page = 1, int pageSize = 5)
        {
            var service = new UserService();
            var model = service.ListUserPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new UserService().ChangeStatus(id);
            return Json(new
            {
                status = result
            }) ;
        }
    }
}