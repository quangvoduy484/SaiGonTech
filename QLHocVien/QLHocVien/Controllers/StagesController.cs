using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;
using QLHocVien.Repones;

namespace QLHocVien.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StagesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public StagesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Stages
        [HttpGet]
        public async Task<ActionResult<Baserepone>> GetStage()
        {
            var stage = await _context.Stages.Include(x => x.Semeter).Include(x => x.Year).ToListAsync();
            if (stage != null)
            {
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Load dữ liệu thành công!!",
                    data = stage
                };
            }
            else
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Không có dữ liệu"
                };
            }
        }

        // GET: api/GetStageByYear/1
        [HttpGet("GetStageByYear/{YearID}")]
        public async Task<ActionResult<Baserepone>> GetStageByYear( int YearID)
        {
            var stage = await _context.Stages.Include(x => x.Semeter).Include(x => x.Year).Where(x => x.YEAR_ID == YearID).ToListAsync();

            if (stage != null)
            {
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Tìm kiếm dữ liệu thành công!!",
                    data = stage
                };
            }
            else
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/GetStageBySemester/1
        [HttpGet("GetStageBySemester/{SemID}")]
        public async Task<ActionResult<Baserepone>> GetStageBySemester(int SemID)
        {
            var stage = await _context.Stages.Include(x => x.Semeter).Include(x => x.Year).Where(x => x.SEM_ID == SemID).ToListAsync();

            if (stage != null)
            {
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Tìm kiếm dữ liệu thành công!!",
                    data = stage
                };
            }
            else
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Không tìm thấy!!"
                };
            }
        }

        // GET: api/Stages/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Baserepone>> GetStage(int id)
        {
            var stage = await _context.Stages.Include(x => x.Semeter).Include(x => x.Year).Where(x => x.Id == id).FirstOrDefaultAsync();

            if (stage != null)
            {
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Tìm kiếm dữ liệu thành công!!",
                    data = stage
                };
            }
            else
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Không tìm thấy!!"
                };
            }
        }

        // PUT: api/Stages/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStage(int id, Stage stage_update)
        {
            var Stag = await _context.Stages.FindAsync(id);
            if(Stag == null)
            {
                return NotFound();
            }
            Stag.SEM_ID = stage_update.SEM_ID;
            Stag.YEAR_ID = stage_update.YEAR_ID;
            Stag.StageName = stage_update.StageName;
            Stag.DateTimes = stage_update.DateTimes;
            Stag.ExamDate = stage_update.ExamDate;
            Stag.ExamTime = stage_update.ExamTime;
            Stag.EnglishTimeExam = stage_update.EnglishTimeExam;

            _context.Stages.Update(Stag);
            await _context.SaveChangesAsync();
            return Ok(Stag);
        }

        // POST: api/Stages
        [HttpPost]
        public async Task<ActionResult<Baserepone>> PostStage(Stage stage)
        {
            if (String.IsNullOrEmpty(stage.StageName) || String.IsNullOrEmpty(stage.ExamTime))
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Stages.Add(stage);
                await _context.SaveChangesAsync();
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Thêm mới thành công!!",
                    data = CreatedAtAction("GetStage", new { id = stage.Id }, stage)
                };
            }
        }

        // DELETE: api/Stages/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Baserepone>> DeleteStage(int id)
        {
            var stage = await _context.Stages.FindAsync(id);
            if (stage != null)
            {
                _context.Stages.Remove(stage);
                await _context.SaveChangesAsync();
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Xóa thành công!!",
                    data = stage
                };
            }
            else
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Không tìm thấy dữ liệu cần xóa"
                };
            }
        }
    }
}
