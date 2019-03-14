using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models.Request
{
    public class StageDetailByMajorSubject
    {
        public int MajorId { get; set; }
        public string MajorName { get; set; }
        public int StageId { get; set; }
        public string StageName { get; set; }
        public int SubjectId { get; set; }
        public string SubjectName { get; set; }
    }
}
