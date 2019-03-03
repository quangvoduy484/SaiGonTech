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
    public class YearsController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public YearsController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Years
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetYear()
        {
            var datas = await _context.Years.ToListAsync();
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

        // GET: api/Years/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetYear(int id)
        {
            var year = await _context.Years.FindAsync(id);

            if (year != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = new Year()
                    {
                        Id = year.Id,
                        YearName = year.YearName
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

        // PUT: api/Years/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutYear(int id, Year year_update)
        {
            var year = await _context.Years.FindAsync(id);
            if(year == null)
            {
                return NotFound();
            }

            year.YearName = year_update.YearName;
            _context.Years.Update(year);
            await _context.SaveChangesAsync();
            return Ok(year);
        }

        // POST: api/Years
        [HttpPost]
        public async Task<ActionResult<Year>> PostYear(Year year)
        {
            //if (year.YearName != null)
            //{
            //    _context.Years.Add(year);
            //    await _context.SaveChangesAsync();
            //    return new BaseResponse
            //    {
            //        ErrorCode = 1,
            //        Messege = "Thêm mới thành công!!",
            //        Data = CreatedAtAction("Get", new { id = year.Id }, year)
            //    };
            //}
            //else
            //{
            //    return new BaseResponse
            //    {
            //        ErrorCode = 0,
            //        Messege = "Thêm mới thất bại!!"
            //    };
            //}
            _context.Years.Add(year);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetYear", new { id = year.Id }, year);
        }

        // DELETE: api/Years/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteYear(int id)
        {
            var year = await _context.Years.FindAsync(id);
            if (year != null)
            {
                _context.Years.Remove(year);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = year
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
