using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models.Request
{
    public class ChangePasswordRequest
    {
        public string newpassword { get; set; }
        public string confirmpassword { get; set; }
    }
}
