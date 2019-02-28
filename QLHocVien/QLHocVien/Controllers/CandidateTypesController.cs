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
    public class CandidateTypesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public CandidateTypesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/CandidateTypes
        [HttpGet]
        public async Task<ActionResult<Baserepone>> GetCandidateTypes()
        {
            var datas = await _context.CandidateTypes.ToListAsync();
            if (datas != null)
            {
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Load dữ liệu thành công!!",
                    data = datas
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

        // GET: api/CandidateTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Baserepone>> GetCandidateType(int id)
        {
            var candidateType = await _context.CandidateTypes.FindAsync(id);

            if (candidateType != null)
            {
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Tìm kiếm dữ liệu thành công!!",
                    data = new CandidateType()
                    {
                        Id = candidateType.Id,
                        TypeName = candidateType.TypeName
                    }
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

        // PUT: api/CandidateTypes/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCandidateType(int id, CandidateType candidateType_Update)
        {
            var CandidateType = await _context.CandidateTypes.FindAsync(id);
            if (CandidateType == null)
            {
                return NotFound();
            }
            CandidateType.TypeName = candidateType_Update.TypeName;
            _context.CandidateTypes.Update(CandidateType);
            await _context.SaveChangesAsync();
            return Ok(CandidateType);
        }

        // POST: api/CandidateTypes
        [HttpPost]
        public async Task<ActionResult<Baserepone>> PostCandidateType(CandidateType candidateType)
        {
            if (String.IsNullOrEmpty(candidateType.TypeName))
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.CandidateTypes.Add(candidateType);
                await _context.SaveChangesAsync();
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Thêm mới thành công!!",
                    data = CreatedAtAction("GetCandidateType", new { id = candidateType.Id }, candidateType)
                };
            }
        }

        // DELETE: api/CandidateTypes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Baserepone>> DeleteCandidateType(int id)
        {
            var candidateType = await _context.CandidateTypes.FindAsync(id);
            if (candidateType != null)
            {
                _context.CandidateTypes.Remove(candidateType);
                await _context.SaveChangesAsync();
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Xóa thành công!!",
                    data = candidateType
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
