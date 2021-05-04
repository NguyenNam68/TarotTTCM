using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.Service;
using Tarot.Web.Common;
using Tarot.Web.Models;

namespace Tarot.Web.Areas.Admin.Controllers
{
    public class UserLoginController : Controller
    {
        // GET: Admin/UserLogin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var service = new UserService();
                var result = service.Login(model.UserName, Encrytor.GetMD5(model.PassWord));
                if (result==0)
                {
                    if(model.UserName=="admin")
                    {
                        var user = service.GetByUsername(model.UserName);
                        var userSession = new UserLogin();
                        userSession.UserName = user.UserName;
                        userSession.UserID = user.ID;
                        Session.Add(CommonConstants.USER_SESSION, userSession);
                        return RedirectToAction("Index", "HomeAdmin");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Vui lòng đăng nhập bằng tài khoản quản trị");
                    }
                }
                else if(result==1)
                {
                    ModelState.AddModelError("", "Tài khoản nhập không đúng");
                }    
                else if(result==-1)
                {
                    ModelState.AddModelError("", "Tài khoản bạn đang bị khóa");
                }
                else if(result==-2)
                {
                    ModelState.AddModelError("", "Mật khẩu bạn nhập không đúng");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng");
                }
            }
            return View("Index");
        }
    }
}