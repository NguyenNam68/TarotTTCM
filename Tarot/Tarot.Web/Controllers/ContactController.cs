using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.EF;
using Tarot.Model.Service;

namespace Tarot.Web.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            var model = new StoreService().ListAllStore();
            return View(model);
        }
        [HttpGet]
        [ChildActionOnly]
        public PartialViewResult Feedback()
        {
            var model = new FeedbackService();
            return PartialView();
        }

        [HttpPost]
        public ActionResult CreateFeedback(Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                var service = new FeedbackService();
                int id = service.Insert(feedback);
                if (id > 0)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Lỗi xảy ra!");
                }
            }
            return View("Index","Home");
        }
    }
}