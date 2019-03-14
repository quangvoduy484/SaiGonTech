using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models.Request
{
    public class CheckPassRequest
    {
        public int id { get; set; }
        public string password { get; set; }
    }
}
