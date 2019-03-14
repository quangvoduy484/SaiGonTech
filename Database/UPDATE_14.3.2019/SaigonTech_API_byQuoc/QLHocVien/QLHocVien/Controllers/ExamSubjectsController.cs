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
    public class ExamSubjectsController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public ExamSubjectsController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/ExamSubjects
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetExamSubject()
        {
            var datas = await _context.ExamSubjects.ToListAsync();
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

        // GET: api/ExamSubjects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetExamSubject(int id)
        {
            var examSubject = await _context.ExamSubjects.FindAsync(id);

            if (examSubject != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = new ExamSubject()
                    {
                        Id = examSubject.Id,
                        ExamName = examSubject.ExamName
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

        // PUT: api/ExamSubjects/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutExamSubject(int id, ExamSubject examSubjec_updatet)
        {
            var Exam = await _context.ExamSubjects.FindAsync(id);
            if(Exam == null)
            {
                return NotFound();
            }

            Exam.ExamName = examSubjec_updatet.ExamName;

            _context.ExamSubjects.Update(Exam);
            await _context.SaveChangesAsync();

            return Ok(Exam);
        }

        // POST: api/ExamSubjects
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostExamSubject(ExamSubject examSubject)
        {
            if (String.IsNullOrEmpty(examSubject.ExamName))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.ExamSubjects.Add(examSubject);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetExamSubject", new { id = examSubject.Id }, examSubject)
                };
            }
        }

        // DELETE: api/ExamSubjects/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteExamSubject(int id)
        {
            var examSubject = await _context.ExamSubjects.FindAsync(id);
            if (examSubject != null)
            {
                _context.ExamSubjects.Remove(examSubject);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = examSubject
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
