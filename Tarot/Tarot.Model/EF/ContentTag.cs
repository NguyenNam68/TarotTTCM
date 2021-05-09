namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ContentTag")]
    public partial class ContentTag
    {
        public int ID { get; set; }

        [Display(Name = "Bài viết")]
        public int NewID { get; set; }

        [Display(Name = "Thẻ bài viết")]
        public int TagID { get; set; }

        [Display(Name = "Ngày tạo")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Người tạo")]
        [StringLength(500)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }

        public virtual News News { get; set; }

        public virtual Tag Tag { get; set; }
    }
}
