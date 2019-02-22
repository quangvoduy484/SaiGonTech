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
    public class CandidateTypesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public CandidateTypesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/CandidateTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CandidateType>>> GetCandidateTypes()
        {
            return await _context.CandidateTypes.ToListAsync();
        }

        // GET: api/CandidateTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CandidateType>> GetCandidateType(int id)
        {
            var candidateType = await _context.CandidateTypes.FindAsync(id);

            if (candidateType == null)
            {
                return NotFound();
            }

            return candidateType;
        }

        // PUT: api/CandidateTypes/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCandidateType(int id, CandidateType candidateType_Update)
        {
            var CandidateType = await _context.CandidateTypes.FindAsync(id);
            if (CandidateType == null)
            {
                return NotFound();
            }
            CandidateType.TYPENAME = candidateType_Update.TYPENAME;
            _context.CandidateTypes.Update(CandidateType);
            await _context.SaveChangesAsync();
            return Ok(CandidateType);
        }

        // POST: api/CandidateTypes
        [HttpPost]
        public async Task<ActionResult<CandidateType>> PostCandidateType(CandidateType candidateType)
        {
            _context.CandidateTypes.Add(candidateType);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCandidateType", new { id = candidateType.Id }, candidateType);
        }

        // DELETE: api/CandidateTypes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<CandidateType>> DeleteCandidateType(int id)
        {
            var candidateType = await _context.CandidateTypes.FindAsync(id);
            if (candidateType == null)
            {
                return NotFound();
            }

            _context.CandidateTypes.Remove(candidateType);
            await _context.SaveChangesAsync();

            return candidateType;
        }
    }
}
