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
    public class CandidateTypesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public CandidateTypesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/CandidateTypes
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetCandidateTypes()
        {
            var datas = await _context.CandidateTypes.ToListAsync();
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

        // GET: api/CandidateTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateType(int id)
        {
            var candidateType = await _context.CandidateTypes.FindAsync(id);

            if (candidateType != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = new CandidateType()
                    {
                        Id = candidateType.Id,
                        TypeName = candidateType.TypeName
                    }
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
        public async Task<ActionResult<BaseResponse>> PostCandidateType(CandidateType candidateType)
        {
            if (String.IsNullOrEmpty(candidateType.TypeName))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.CandidateTypes.Add(candidateType);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetCandidateTypes", new { id = candidateType.Id }, candidateType)
                };
            }
        }

        // DELETE: api/CandidateTypes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteCandidateType(int id)
        {
            var candidateType = await _context.CandidateTypes.FindAsync(id);
            if (candidateType != null)
            {
                _context.CandidateTypes.Remove(candidateType);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = candidateType
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
