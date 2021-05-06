namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OnlinePaying")]
    public partial class OnlinePaying
    {
        public int ID { get; set; }

        [Display(Name = "Phương thức thanh toán")]
        public int Method { get; set; }

        [Display(Name = "Tên thanh toán")]
        [StringLength(500)]
        public string NamePay { get; set; }

        [Display(Name = "Tên tài khoản")]
        [StringLength(500)]
        public string NameAccount { get; set; }

        [Display(Name = "Mã tài khoản")]
        [StringLength(500)]
        public string CodeAccount { get; set; }

        [Display(Name = "Chi nhánh")]
        [StringLength(500)]
        public string Address { get; set; }

        [Display(Name = "Hình ảnh")]
        [StringLength(500)]
        public string Image { get; set; }

        [Display(Name = "Ngày tạo")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Người tạo")]
        [StringLength(500)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }

        public virtual PaymentMethod PaymentMethod { get; set; }
    }
}
