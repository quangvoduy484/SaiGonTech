using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    public class Country
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }
    }
}
