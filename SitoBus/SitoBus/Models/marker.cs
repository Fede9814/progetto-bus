namespace SitoBus.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("marker")]
    public partial class marker
    {
        [Key]
        public int IdMarker { get; set; }

        [StringLength(50)]
        public string NomeMarker { get; set; }

        [StringLength(50)]
        public string Latitudine { get; set; }

        [StringLength(50)]
        public string Longitudine { get; set; }

     
        public int? VeicoloId { get; set; }
    }
}
