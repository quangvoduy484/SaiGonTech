﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    [Table("Users")]
    public class User
    {
        [Column("Use_ID")]
        public int Id { get; set; }
        public string Name { get; set; }
        public int Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public string PassWord { get; set; }
        public int Active { get; set; } = 1;
        [NotMapped]
        public IFormFile File { get; set; }
        public string Avatar { get; set; } = "avatar.png";
    }
}
