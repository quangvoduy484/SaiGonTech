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
    public class CountriesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public CountriesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Countries
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetCountry()
        {
            var datas = await _context.Countrys.ToListAsync();
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

        // GET: api/Countries/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetCountry(int id)
        {
            var country = await _context.Countrys.FindAsync(id);

            if (country != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = new Country()
                    {
                        Id = country.Id,
                        CountryName = country.CountryName
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

        // PUT: api/Countries/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCountry(int id, Country country_update)
        {
            var CounTry = await _context.Countrys.FindAsync(id);
            if (CounTry == null)
            {
                return NotFound();
            }
            CounTry.CountryName = country_update.CountryName;
            _context.Countrys.Update(CounTry);
            await _context.SaveChangesAsync();
            return Ok(CounTry);
        }

        // POST: api/Countries
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostCountry(Country country)
        {
            if (String.IsNullOrEmpty(country.CountryName))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Countrys.Add(country);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetCountry", new { id = country.Id }, country)
                };
            }
        }

        // DELETE: api/Countries/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteCountry(int id)
        {
            var country = await _context.Countrys.FindAsync(id);
            if (country != null)
            {
                _context.Countrys.Remove(country);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = country
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
