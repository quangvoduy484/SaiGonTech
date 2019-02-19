﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    public class Country
    {
        [Column("COUNTRY_ID")]
        public int CountryID { get; set; }
        [Column("COUNTRYNAME")]
        public string CountryName { get; set; }
    }
}
