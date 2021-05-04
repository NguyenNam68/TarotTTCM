namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            Carts = new HashSet<Cart>();
        }

        public int ID { get; set; }
        [Display(Name = "Loại sản phẩm")]
        public int? TypeID { get; set; }

        [Display(Name = "Danh mục sản phẩm")]
        public int CategoryID { get; set; }

        [Display(Name = "Nhà xuất bản")]
        public int PublisherID { get; set; }

        [Display(Name = "Tên sản phẩm")]
        [StringLength(500)]
        public string ProductName { get; set; }

        [Display(Name = "Mô tả")]
        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        [Display(Name = "Nội dung")]
        public string Detail { get; set; }

        [Display(Name = "Số lượng đã bán")]
        public int? QuantitySold { get; set; }

        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [Display(Name = "Giá đã giảm")]
        public decimal? PromotionPrice { get; set; }

        [Display(Name = "Giá")]
        public decimal? Price { get; set; }

        [Display(Name = "Sản phẩm nổi bật")]
        [StringLength(500)]
        public string TopHot { get; set; }

        [Display(Name = "Lượt xem")]
        public int? ViewCount { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Người tạo")]
        [StringLength(50)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart> Carts { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        public virtual ProductType ProductType { get; set; }

        public virtual Publisher Publisher { get; set; }
    }
}
