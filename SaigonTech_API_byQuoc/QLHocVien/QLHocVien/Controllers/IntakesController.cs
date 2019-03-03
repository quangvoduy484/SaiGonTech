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
    public class IntakesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public IntakesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Intakes
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetIntake()
        {
            var datas = await _context.Intakes.ToListAsync();
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

        // GET: api/Intakes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetIntake(int id)
        {
            var intake = await _context.Intakes.FindAsync(id);

            if (intake != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = new Intake()
                    {
                        Id = intake.Id,
                        IntakeName = intake.IntakeName
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

        // PUT: api/Intakes/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutIntake(int id, Intake intake_update)
        {
            var Ink = await _context.Intakes.FindAsync(id);
            if(Ink == null)
            {
                return NotFound();
            }

            Ink.IntakeName = intake_update.IntakeName;

            _context.Intakes.Update(Ink);
            await _context.SaveChangesAsync();

            return Ok(Ink);
        }

        // POST: api/Intakes
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostIntake(Intake intake)
        {
            if (String.IsNullOrEmpty(intake.IntakeName))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Intakes.Add(intake);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetIntake", new { id = intake.Id }, intake)
                };
            }
        }

        // DELETE: api/Intakes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteIntake(int id)
        {
            var intake = await _context.Intakes.FindAsync(id);
            if (intake != null)
            {
                _context.Intakes.Remove(intake);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = intake
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
