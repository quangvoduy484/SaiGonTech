using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    [Table("STAGEDETAILS")]
    public class StageDetail
    {
        [Column("STAGE_DETAILS_ID")]
        public int Id { get; set; }
        [Column("STAR_TIME")]
        public string StarTime { get; set; }
        [Column("END_TIME")]
        public string EndTime { get; set; }
        [Column("SCORE")]
        public decimal Score { get; set; }
        [Column("INTERVIEW")]
        public string Interview { get; set; }
        [Column("SUBJECT")]
        public string Subject { get; set; }
        public int C_ID { get; set; }
        [ForeignKey("C_ID")]
        public virtual Candidate Candidate { get; set; }
        public int Major_ID { get; set; }
        [ForeignKey("MAJOR_ID")]
        public virtual Major Major { get; set; }
        public int Stage_ID { get; set; }
        [ForeignKey("STAGE_ID")]
        public virtual Stage Stage { get; set; }
        public int Exam_ID { get; set; }
        [ForeignKey("EXAM_ID")]
        public virtual ExamSubject ExamSubject { get; set; }
    }
}
