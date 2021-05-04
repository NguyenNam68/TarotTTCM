namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        public int ID { get; set; }

        [Display(Name = "Tài khoản")]

        [Required]
        [StringLength(50)]
        public string UserName { get; set; }

        [Display(Name = "Mật khẩu")]

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        [Display(Name = "Tên người dùng")]

        [StringLength(500)]
        public string Name { get; set; }

        [Display(Name = "Địa chỉ")]

        public string Address { get; set; }

        [Display(Name = "Email")]

        [StringLength(500)]
        public string Email { get; set; }

        [Display(Name = "Số điện thoại")]

        [StringLength(500)]
        public string Phone { get; set; }

        [Display(Name = "Ngày tạo")]

        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]

        public bool Status { get; set; }
    }
}
