using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tarot.Model.EF;
using Tarot.Model.Service;
using Tarot.Web.Common;
using Tarot.Web.Models;

namespace Tarot.Web.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(User users )
        {
            if(ModelState.IsValid)
            {
                var service = new UserService();
                if (service.CheckUserName(users.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if(service.CheckEmail(users.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }    
                else
                {
                    users.Password = Encrytor.GetMD5(users.Password);
                    var result = service.Insert(users);
                    if(result>0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        users = new User();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký thất bại");
                    }

                }    
            }
            return View(users);
        } 
        public ActionResult Login()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var service = new UserService();
                var result = service.Login(model.UserName, Encrytor.GetMD5(model.PassWord));
                if (result == 0)
                {
                        var user = service.GetByUsername(model.UserName);
                        var userSession = new UserLogin();
                        userSession.UserName = user.UserName;
                        userSession.UserID = user.ID;
                        Session.Add(CommonConstants.USER_SESSION, userSession);
                        return RedirectToAction("Index", "Home");
                }
                else if (result == 1)
                {
                    ModelState.AddModelError("", "Tài khoản nhập không đúng");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản bạn đang bị khóa");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu bạn nhập không đúng");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng");
                }
            }
            return View(model);
        }
        public ActionResult LogOut()
        {
            Session[Common.CommonConstants.USER_SESSION] = null;
            return Redirect("/");
        }
    }
}