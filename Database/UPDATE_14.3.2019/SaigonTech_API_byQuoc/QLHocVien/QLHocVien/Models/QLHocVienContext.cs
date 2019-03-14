using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using QLHocVien.Models;
using Microsoft.Extensions.Logging;

namespace QLHocVien.Models
{
    public class QLHocVienContext: DbContext
    {
        //private readonly ILoggerFactory _loggerFactory;

        public QLHocVienContext(DbContextOptions<QLHocVienContext> options, ILoggerFactory loggerFactory)
            :base(options)
        {
            //_loggerFactory = loggerFactory;
        }
        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    base.OnConfiguring(optionsBuilder);

        //    optionsBuilder.UseLoggerFactory(_loggerFactory);
        //}
        public virtual DbSet<Catalog> Catalogs { get; set; }
        public virtual DbSet<CandidateType> CandidateTypes { get; set; }
        public virtual DbSet<Country> Countrys { get; set; }
        public virtual DbSet<Province> Provinces { get; set; }
        public virtual DbSet<District> Districts { get; set; }
        public virtual DbSet<Education> Educations { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<Major> Majors { get; set; }
        public virtual DbSet<ExamSubject> ExamSubjects { get; set; }
        public virtual DbSet<ScoreExam> ScoreExams { get; set; }
        public virtual DbSet<Year> Years { get; set; }
        public virtual DbSet<Semester> Semesters { get; set; }
        public virtual DbSet<Stage> Stages { get; set; }
        public virtual DbSet<Intake> Intakes { get; set; }
        public virtual DbSet<Parameter> Parameters { get; set; }
        public virtual DbSet<CandidateDocument> CandidateDocuments { get; set; }
        public virtual DbSet<StageDetail> StageDetails { get; set; }
        public virtual DbSet<Candidate> Candidate { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<InputType> InputType { get; set; }
        public virtual DbSet<Status> Status { get; set; }
    }
}
