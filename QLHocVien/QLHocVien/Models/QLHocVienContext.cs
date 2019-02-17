using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
    public class QLHocVienContext: DbContext
    {
        public QLHocVienContext(DbContextOptions<QLHocVienContext> options)
            :base(options)
        {

        }
        public DbSet<Catalog> Catalogs { get; set; }
    }
}
