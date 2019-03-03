using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    [Table("PARAMETER")]
    public class Parameter
    {
        [Column("PARAMETER_ID")]
        public int Id { get; set; }
        [Column("SIGNATURENAME")]
        public string SignTureName { get; set; }
        [Column("MORECONTACT")]
        public string MoreContact { get; set; }
        [Column("DOCUMENTCODE")]
        public string DocumentCode { get; set; }
        public int YEAR_ID { get; set; }
        [ForeignKey("YEAR_ID")]
        public virtual Year Year { get; set; }
        public int SEM_ID { get; set; }
        [ForeignKey("SEM_ID")]
        public virtual Semester Semester { get; set; }
        public int INTAKE_ID { get; set; }
        [ForeignKey("INTAKE_ID")]
        public virtual Intake Intake { get; set; }
    }
}
