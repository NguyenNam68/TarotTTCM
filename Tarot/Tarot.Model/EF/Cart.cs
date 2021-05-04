namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cart")]
    public partial class Cart
    {
        public int ID { get; set; }

        [Display(Name ="Mã sản phẩm")]
        public int ProductID { get; set; }

        [Display(Name ="Tên sản phẩm")]
        public string ProductName { get; set; }

        [Display(Name ="Số lượng")]
        public int? Quantity { get; set; }

        [Display(Name = "Giảm giá")]
        public decimal? Discount { get; set; }

        [Display(Name = "Giá")]
        public decimal? Price { get; set; }

        [Display(Name = "Phương thức thanh toán")]
        public int PaymentID { get; set; }

        [Display(Name = "Ngày mua")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Người mua")]
        [StringLength(500)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }

        public virtual PaymentMethod PaymentMethod { get; set; }

        public virtual Product Product { get; set; }
    }
}
