using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    [Table("SEMESTER")]
    public class Semeter
    {
        [Column("SEM_ID")]
        public int Id { get; set; }

        [Column("SEMESTERNAME")]
        public string semeter_name { get; set; }
    }
}
