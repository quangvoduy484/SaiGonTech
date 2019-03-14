using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models.Request
{
    public class UpdateUserRequest
    {
        public string Name { get; set; }
        public int Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public IFormFile File { get; set; }
        public string Avatar { get; set; }
    }
}
