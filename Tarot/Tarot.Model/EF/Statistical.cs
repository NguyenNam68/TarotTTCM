namespace Tarot.Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Statistical")]
    public partial class Statistical
    {
        public int ID { get; set; }

        [Display(Name ="Doanh thu")]
        public decimal? Revenue { get; set; }
        [Display(Name ="Số lượng người dùng")]
        public int? TotalUser { get; set; }
        [Display(Name = "Số lượng đơn hàng")]
        public int? TotalOrder { get; set; }
        [Display(Name = "Số lượng sản phẩm đã bán")]
        public int? TotalSell { get; set; }
        [Display(Name = "Ngày thống kê")]
        public DateTime? CreatedDate { get; set; }
        [Display(Name = "Tình trạng")]
        public bool Status { get; set; }
    }
}
