using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    [Table("STAGE")]
    public class Stage
    {
        [Column("STAGE_ID")]
        public int Id { get; set; }
        public string STAGENAME { get; set; }
        public DateTime DATETIME { get; set; }
        public DateTime EXAMDATE { get; set; }
        public string EXAMTIME { get; set; }
        public string ENGLISHTIMEEXAM { get; set; }
        public int SEM_ID { get; set; }
        [ForeignKey("SEM_ID")]

    }
}
