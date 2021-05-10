using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Tarot.Web.Models
{
    public class RegisterModel
    {
        [Key]
        public int ID { set; get; }

        [Display(Name="Tên đăng nhập")]
        [Required(ErrorMessage ="Vui lòng nhập tên đăng nhập")]
        public string UserName { set; get; }
        [Display(Name = "Mật khẩu")]
        public string Password { set; get; }
        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("Password",ErrorMessage ="Xác nhận mật khẩu không đúng")]
        public string ConfirmPassword { set; get; }
        [Display(Name = "Họ tên")]
        public string Name { set; get; }
        [Display(Name = "Địa chỉ")]
        public string Address { set; get; }
        [Display(Name = "Email")]
        public string Email { set; get; }
        [Display(Name = "Số điện thoại")]
        public string Phone { set; get; }
    }
}