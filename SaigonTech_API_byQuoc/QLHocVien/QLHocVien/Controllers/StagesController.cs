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
    public class StagesController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public StagesController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Stages
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetStage()
        {
            var stage = await _context.Stages.Include(x => x.Semester).Include(x => x.Year).ToListAsync();
            if(stage != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Load dữ liệu thành công!!",
                    Data = stage
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

        // GET: api/Stages/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetStage(int id)
        {
            var stage = await _context.Stages.Include(x => x.Semester).Include(x => x.Year).Where(x=>x.Id==id).FirstOrDefaultAsync();

            if (stage != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = stage
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

        // GET: api/Stages/GetStageBySemester/{id}
        [HttpGet("GetStageBySemester/{id}")]
        public async Task<ActionResult<BaseResponse>> GetStageBySemester(int sem_id)
        {
            var stage = await _context.Stages.Include(x => x.Semester).Include(x => x.Year).Where(x => x.SEM_ID == sem_id).ToListAsync();

            if (stage != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = stage
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

        // GET: api/Stages/GetStageByYear/{id}
        [HttpGet("GetStageByYear/{id}")]
        public async Task<ActionResult<BaseResponse>> GetStageByYear(int year_id)
        {
            var stage = await _context.Stages.Include(x => x.Semester).Include(x => x.Year).Where(x => x.YEAR_ID == year_id).ToListAsync();

            if (stage != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = stage
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
        public async Task<ActionResult<BaseResponse>> PostStage(Stage stage)
        {
            if (String.IsNullOrEmpty(stage.StageName) || String.IsNullOrEmpty(stage.ExamTime))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Stages.Add(stage);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetStage", new { id = stage.Id }, stage)
                };
            }
            //_context.Stages.Add(stage);
            //await _context.SaveChangesAsync();

            //return CreatedAtAction("Get", new { id = stage.Id }, stage);
        }

        // DELETE: api/Stages/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteStage(int id)
        {
            var stage = await _context.Stages.FindAsync(id);
            if (stage != null)
            {
                _context.Stages.Remove(stage);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = stage
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
