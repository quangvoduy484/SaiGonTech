using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;

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
        public async Task<ActionResult<IEnumerable<Stage>>> GetStage()
        {
            return await _context.Stages.Include(x => x.Year).Include(x => x.Semeter).ToListAsync();
        }

        // GET: api/GetStageByYear/1
        [HttpGet("GetStageByYear/{YearID}")]
        public async Task<ActionResult<IEnumerable<Stage>>> GetStageByYear( int YearID)
        {
            var Stage_Year = await _context.Stages.Where(x => x.YEAR_ID== YearID).ToListAsync();
            if(Stage_Year == null)
            {
                return NotFound();
            }
            return Stage_Year;
        }

        // GET: api/GetStageBySemester/1
        [HttpGet("GetStageBySemester/{SemID}")]
        public async Task<ActionResult<IEnumerable<Stage>>> GetStageBySemester(int SemID)
        {
            var Stage_SEM = await _context.Stages.Where(x => x.SEM_ID == SemID).ToListAsync();
            if (Stage_SEM == null)
            {
                return NotFound();
            }
            return Stage_SEM;
        }

        // GET: api/Stages/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Stage>> GetStage(int id)
        {
            var stage = await _context.Stages.FindAsync(id);

            if (stage == null)
            {
                return NotFound();
            }

            return stage;
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
        public async Task<ActionResult<Stage>> PostStage(Stage stage)
        {
            _context.Stages.Add(stage);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Get", new { id = stage.Id }, stage);
        }

        // DELETE: api/Stages/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Stage>> DeleteStage(int id)
        {
            var stage = await _context.Stages.FindAsync(id);
            if (stage == null)
            {
                return NotFound();
            }

            _context.Stages.Remove(stage);
            await _context.SaveChangesAsync();

            return stage;
        }
    }
}
