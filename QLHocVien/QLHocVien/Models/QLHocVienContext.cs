﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using QLHocVien.Models;

namespace QLHocVien.Models
{
    public class QLHocVienContext: DbContext
    {
        public QLHocVienContext(DbContextOptions<QLHocVienContext> options)
            :base(options)
        {

        }
        public DbSet<Catalog> Catalogs { get; set; }
		public DbSet<Education> Educations { get; set; }
        public DbSet<CandidateType> CandidateTypes { get; set; }
        public DbSet<Major> Majors { get; set; }
        public DbSet<Country> Countrys { get; set; }
        public DbSet<Province> Provinces { get; set; }
        public DbSet<Semeter> Semeters { get; set; }
        public DbSet<Stage> Stage { get; set; }
    }
}
