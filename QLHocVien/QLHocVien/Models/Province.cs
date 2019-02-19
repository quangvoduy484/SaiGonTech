using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    public class Province
    {
        [Column("PROVINCE_ID")]
        public int ProvinceID { get; set; }
        [Column("PROVINCENAME")]
        public string ProvinceName { get; set; }
        [Column("COUNTRY_ID")]
        public int CountryID { get; set; }

        [ForeignKey("CountryID")]
        public Country Country { get; set; }
    }
}
