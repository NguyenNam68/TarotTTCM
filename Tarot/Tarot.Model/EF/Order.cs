namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ID { get; set; }

        [Display(Name = "Ngày đặt hàng")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }
        [Display(Name ="Tổng giá trị hóa đơn")]
        public decimal? TotalMoney { get; set; }

        [Display(Name ="Tài khoản")]
        [StringLength(50)]
        public string CustomerID { get; set; }

        [Display(Name = "Tên khách hàng")]
        [StringLength(50)]
        public string ShipName { get; set; }

        [Display(Name = "Số điện thoại")]
        [StringLength(50)]
        public string ShipMobile { get; set; }

        [Display(Name = "Địa chỉ giao hàng")]
        [StringLength(500)]
        public string ShipAddress { get; set; }

        [Display(Name = "Email")]
        [StringLength(500)]
        public string ShipEmail { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
