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
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int NewID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int TagID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public virtual News News { get; set; }

        public virtual Tag Tag { get; set; }
    }
}
