using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;
using QLHocVien.Models.Response;

namespace QLHocVien.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CandidatesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public CandidatesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Candidates
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetCandidate()
        {
            var datas = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Stage).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).ToListAsync();
            if (datas != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Load dữ liệu thành công!!",
                    Data = datas
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không có dữ liệu"
                };
            }
        }

        // GET: api/Candidates/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidate(int id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.Id == id).FirstOrDefaultAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        
        // GET: api/Candidates/GetCandidateByMajor/{id}
        [HttpGet("GetCandidateByMajor/{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateByMajor(int major_id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.MAJOR_ID == major_id).ToListAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/Candidates/GetCandidateByCatalog/{id}
        [HttpGet("GetCandidateByCatalog/{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateByCatalog(int catalog_id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.CATALOG_ID == catalog_id).ToListAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/Candidates/GetCandidateByDistrict/{id}
        [HttpGet("GetCandidateByCountry/{cou_id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateByDistrict(int cou_id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.COUNTRY_ID == cou_id).ToListAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/Candidates/GetCandidateByEducation/{id}
        [HttpGet("GetCandidateByEducation/{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateByEducation(int edu_id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.EDUCATION_ID == edu_id).ToListAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/Candidates/GetCandidateByCandidateType/{id}
        [HttpGet("GetCandidateByCandidateType/{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateByCandidateType(int can_id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.TYPE_ID == can_id).ToListAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/Candidates/GetCandidateByIntake/{id}
        [HttpGet("GetCandidateByIntake/{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateByIntake(int int_id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.INTAKE_ID == int_id).ToListAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/Candidates/GetCandidateBySemester/{id}
        [HttpGet("GetCandidateBySemester/{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateBySemester(int sem_id)
        {
            var candidate = await _context.Candidate.Include(x => x.Major).Include(x => x.Catalog).Include(x => x.Country).Include(x => x.Education).Include(x => x.CandidateType).Include(x => x.Intake).Include(x => x.Semester).Include(x => x.Stage).Where(x => x.SEM_ID == sem_id).ToListAsync();

            if (candidate != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy!!"
                };
            }
        }

        // PUT: api/Candidates/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCandidate(int id, Candidate candidate_update)
        {
            var candidate = await _context.Candidate.FindAsync(id);
            if (candidate == null)
            {
                return NotFound();
            }

            candidate.STAGE_ID = candidate_update.STAGE_ID;
            candidate.MAJOR_ID = candidate_update.MAJOR_ID;
            candidate.CATALOG_ID = candidate_update.CATALOG_ID;
            candidate.COUNTRY_ID = candidate_update.COUNTRY_ID;
            candidate.EDUCATION_ID = candidate_update.EDUCATION_ID;
            candidate.YEAR_ID = candidate_update.YEAR_ID;
            candidate.TYPE_ID = candidate_update.TYPE_ID;
            candidate.INTAKE_ID = candidate_update.INTAKE_ID;
            candidate.SEM_ID = candidate_update.SEM_ID;
            candidate.CandidateId = candidate_update.CandidateId;
            candidate.LastName = candidate_update.LastName;
            candidate.FirstName = candidate_update.FirstName;
            candidate.DateOfBirth = candidate_update.DateOfBirth;
            candidate.Gender = candidate_update.Gender;
            candidate.Phone = candidate_update.Phone;
            candidate.HomeAddress = candidate_update.HomeAddress;
            candidate.CountryAddress = candidate_update.CountryAddress;
            candidate.ProvinceAddress = candidate_update.ProvinceAddress;
            candidate.DistrictAddress = candidate_update.DistrictAddress;
            candidate.PlaceOfBirth = candidate_update.PlaceOfBirth;
            candidate.MaritalStatus = candidate_update.MaritalStatus;
            candidate.HighSchoolName = candidate_update.HighSchoolName;
            candidate.HighSchoolCity = candidate_update.HighSchoolCity;
            candidate.GraduateYear = candidate_update.GraduateYear;
            candidate.RegistryDate = candidate_update.RegistryDate;
            candidate.Email = candidate_update.Email;
            candidate.CardId = candidate_update.CardId;
            candidate.FinalResult = candidate_update.FinalResult;
            candidate.DocumentCode = candidate_update.DocumentCode;

            _context.Candidate.Update(candidate);
            await _context.SaveChangesAsync();
            return Ok(candidate);
        }

        // POST: api/Candidates
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostCandidate(Candidate candidate)
        {
            if (String.IsNullOrEmpty(candidate.CandidateId) || String.IsNullOrEmpty(candidate.LastName) || String.IsNullOrEmpty(candidate.FirstName) || String.IsNullOrEmpty(candidate.Phone) || String.IsNullOrEmpty(candidate.HomeAddress) || String.IsNullOrEmpty(candidate.HighSchoolCity) || String.IsNullOrEmpty(candidate.HighSchoolName) || String.IsNullOrEmpty(candidate.Email) || String.IsNullOrEmpty(candidate.CardId) || String.IsNullOrEmpty(candidate.DocumentCode))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Candidate.Add(candidate);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetCandidate", new { id = candidate.Id }, candidate)
                };
            }
        }

        // DELETE: api/Candidates/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteCandidate(int id)
        {
            var candidate = await _context.Candidate.FindAsync(id);
            if (candidate != null)
            {
                _context.Candidate.Remove(candidate);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = candidate
                };
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Không tìm thấy dữ liệu cần xóa"
                };
            }
        }
    }
}
