namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProductTag
    {
        public int ID { get; set; }

        [Display(Name = "Sản phẩm")]
        public int ProductID { get; set; }

        [Display(Name = "Loại sản phẩm")]
        public int TypeID { get; set; }

        [Display(Name = "Thẻ sản phẩm")]
        [StringLength(500)]
        public string NameTag { get; set; }

        [Display(Name = "Ngày tạo")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Người tạo")]
        [StringLength(50)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }

        public virtual Product Product { get; set; }

        public virtual ProductType ProductType { get; set; }
    }
}
