using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    [Table("DOCUMENT")]
    public class Document
    {
        [Column("DOC_ID")]
        public int Document_ID { get; set; }
        [Column("NAMEINENGLISH")]
        public string NameInEnglish { get; set; }
        [Column("NAEMINVIETNAMESE")]
        public string NameInVietNamese { get; set; }
        [Column("SEQUENCENUM")]
        public int SequenceNum { get; set; }
        [Column("INPUTTYPE")]
        public int InputType { get; set; }
        [Column("STATUS")]
        public int Status { get; set; }
        [Column("NOTE", TypeName ="text")]
        public string Note { get; set; }
    }
}
