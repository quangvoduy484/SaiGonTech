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
    public class ParametersController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public ParametersController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Parameters
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetParameter()
        {
            var datas = await _context.Parameters.Include(x=>x.Year).Include(x=>x.Semester).Include(x=>x.Intake).ToListAsync();
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

        // GET: api/Parameters/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetParameter(int id)
        {
            var parameter = await _context.Parameters.Include(x => x.Year).Include(x => x.Semester).Include(x => x.Intake).Where(x=>x.Id==id).FirstOrDefaultAsync();

            if (parameter != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = parameter
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

        // GET: api/Parameters/GetParameterByYear/{id}
        [HttpGet("GetParameterByYear/{id}")]
        public async Task<ActionResult<BaseResponse>> GetParameterByYear(int year_id)
        {
            var parameter = await _context.Parameters.Include(x => x.Year).Include(x => x.Semester).Include(x => x.Intake).Where(x => x.YEAR_ID == year_id).ToListAsync();

            if (parameter != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = parameter
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

        // GET: api/Parameters/GetParameterBySemester/{id}
        [HttpGet("GetParameterBySemester/{id}")]
        public async Task<ActionResult<BaseResponse>> GetParameterBySemester(int sem_id)
        {
            var parameter = await _context.Parameters.Include(x => x.Year).Include(x => x.Semester).Include(x => x.Intake).Where(x => x.SEM_ID == sem_id).ToListAsync();

            if (parameter != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = parameter
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

        // GET: api/Parameters/GetParameterByIntake/{id}
        [HttpGet("GetParameterByIntake/{id}")]
        public async Task<ActionResult<BaseResponse>> GetParameterByIntake(int int_id)
        {
            var parameter = await _context.Parameters.Include(x => x.Year).Include(x => x.Semester).Include(x => x.Intake).Where(x => x.INTAKE_ID == int_id).ToListAsync();

            if (parameter != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = parameter
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

        // PUT: api/Parameters/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutParameter(int id, Parameter parameter_update)
        {
            var Par = await _context.Parameters.FindAsync(id);
            if(Par == null)
            {
                return NotFound();
            }

            Par.YEAR_ID = parameter_update.YEAR_ID;
            Par.SEM_ID = parameter_update.SEM_ID;
            Par.INTAKE_ID = parameter_update.INTAKE_ID;
            Par.SignTureName = parameter_update.SignTureName;
            Par.MoreContact = parameter_update.MoreContact;
            Par.DocumentCode = parameter_update.DocumentCode;

            _context.Parameters.Update(Par);
            await _context.SaveChangesAsync();
            return Ok(Par);
        }

        // POST: api/Parameters
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostParameter(Parameter parameter)
        {
            if (String.IsNullOrEmpty(parameter.SignTureName) || String.IsNullOrEmpty(parameter.MoreContact) || String.IsNullOrEmpty(parameter.DocumentCode))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Parameters.Add(parameter);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetParameter", new { id = parameter.Id }, parameter)
                };
            }
        }

        // DELETE: api/Parameters/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteParameter(int id)
        {
            var parameter = await _context.Parameters.FindAsync(id);
            if (parameter != null)
            {
                _context.Parameters.Remove(parameter);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = parameter
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
