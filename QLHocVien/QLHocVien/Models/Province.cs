using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    public class Province
    {
        public int ProvinceID { get; set; }
        public string ProvinceName { get; set; }
        public int CountryID { get; set; }

        [ForeignKey("CountryID")]
        public Country Country { get; set; }
    }
}
