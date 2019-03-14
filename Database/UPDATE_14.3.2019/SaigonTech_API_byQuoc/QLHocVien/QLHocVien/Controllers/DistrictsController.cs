﻿using System;
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
    public class DistrictsController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public DistrictsController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Districts
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetDistrict()
        {
            var datas = await _context.Districts.Include(x=>x.Province).ThenInclude(x=>x.Country).ToListAsync();
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

        // GET: api/Districts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetDistrict(int id)
        {
            var district = await _context.Districts.Include(x => x.Province).ThenInclude(x => x.Country).Where(x=>x.Id==id).FirstOrDefaultAsync();

            if (district != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = district
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
        // GET: api/Districts/GetDistrictByProvince/{id}
        [HttpGet("GetDistrictByProvince/{pro_id}")]
        public async Task<ActionResult<BaseResponse>> GetDistrictByProvince(int pro_id)
        {
            var district = await _context.Districts.Include(x => x.Province).ThenInclude(x => x.Country).Where(x => x.PROVINCE_ID == pro_id).ToListAsync();

            if (district != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = district
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

        // PUT: api/Districts/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDistrict(int id, District district_update)
        {
            var Dis = await _context.Districts.FindAsync(id);
            if (Dis == null)
            {
                return NotFound();
            }
            Dis.PROVINCE_ID = district_update.PROVINCE_ID;
            Dis.DistrictName = district_update.DistrictName;

            _context.Districts.Update(Dis);
            await _context.SaveChangesAsync();

            return Ok(Dis);
        }

        // POST: api/Districts
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostDistrict(District district)
        {
            if (String.IsNullOrEmpty(district.DistrictName))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Districts.Add(district);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetDistrict", new { id = district.Id }, district)
                };
            }
        }

        // DELETE: api/Districts/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteDistrict(int id)
        {
            var district = await _context.Districts.FindAsync(id);
            if (district != null)
            {
                _context.Districts.Remove(district);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = district
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
