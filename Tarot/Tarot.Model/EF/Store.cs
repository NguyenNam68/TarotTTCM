namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Store
    {
        public int ID { get; set; }

        [Display(Name = "Cửa hàng")]
        [StringLength(500)]
        public string NameStore { get; set; }

        [Display(Name = "Địa chỉ")]
        [StringLength(500)]
        public string Address { get; set; }

        [Display(Name = "Thời gian mở cửa")]
        [StringLength(500)]
        public string TimeOpen { get; set; }

        [Display(Name = "Số điện thoại")]
        [StringLength(50)]
        public string Phone { get; set; }

        [Display(Name = "Ngày tạo")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Người tạo")]
        [StringLength(50)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }
    }
}
