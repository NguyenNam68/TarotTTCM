using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class FeedbackAdminController : BaseController
    {
        // GET: Admin/FeedbackAdmin
        [HttpGet]
        public ActionResult Index(string search, int page = 1, int pageSize = 5)
        {
            var service = new FeedbackService();

            var model = service.ListFbPaging(search).ToPagedList(page, pageSize);
            ViewBag.Search = search;
            return View(model);
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new FeedbackService().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}