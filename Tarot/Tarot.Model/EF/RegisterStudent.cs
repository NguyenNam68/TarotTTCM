namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RegisterStudent")]
    public partial class RegisterStudent
    {
        public int ID { get; set; }

        [Display(Name = "Email của học viên đăng ký")]
        [Required]
        [StringLength(500)]
        public string Email { get; set; }

        [Display(Name = "Ngày tạo")]
        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }
    }
}
