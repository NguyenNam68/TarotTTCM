namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Feedback")]
    public partial class Feedback
    {
        public int ID { get; set; }

        [Display(Name = "Tên khách hàng")]
        public string Name { get; set; }

        [Display(Name = "Email")]
        [StringLength(500)]
        public string Email { get; set; }

        [Display(Name = "Số điện thoại")]
        [StringLength(50)]
        public string Phone { get; set; }

        [Display(Name = "Nội dung")]
        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        [Display(Name = "Ngày tạo")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }
    }
}
