using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    public class Major
    {
        [Column("MAJOR_ID")]
        public int MajorID { get; set; }
        [Column("MAJORNAME")]
        public string MajorName { get; set; }
    }
}
