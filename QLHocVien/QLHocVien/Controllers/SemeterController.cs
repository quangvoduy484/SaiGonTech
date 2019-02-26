using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;
using QLHocVien.Repones;
using QLHocVien.Requests;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QLHocVien.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SemeterController : Controller
    {
        private readonly QLHocVienContext _context;
        public SemeterController(QLHocVienContext context)
        {
            this._context = context;

        }

        // Lấy danh sách semeter
        [HttpGet("GetListSemeter")]
        public async Task<ActionResult<Baserepone>> Get()
        {
            var List_Semeter = _context.Semeters.ToList();

            if (_context.Semeters.ToList().Count == 0)
            {
                return new Baserepone { errorcode = 1, errormessage = "Danh sách rỗng" };
            }

            List<Semeterrepon> repone = new List<Semeterrepon>();

            Semeterrepon semeterepone;

            foreach (Semeter se in List_Semeter)
            {

                semeterepone = new Semeterrepon { Id = se.Id, semeter_name = se.semeter_name };
                repone.Add(semeterepone);
            }

            return new Baserepone(repone);

        }

        [HttpGet("GetObjectSemeter/{id}")]
        public async Task<ActionResult<Baserepone>> GetSemeter(int id)
        {
            var SemeterItem = await _context.Semeters.FindAsync(id);

            if(SemeterItem == null)
            {
                return new Baserepone { errorcode = 1, errormessage = "Danh sách rỗng" };
            }
            else
            {
                return new Baserepone(new Semeterrepon
                {
                    Id=SemeterItem.Id,
                    semeter_name=SemeterItem.semeter_name

                });
            }


        }

        // Search semeter theo tên
        [HttpPost("SemeterByName")]
        public async Task<ActionResult<Baserepone>> Get(Semeterequest semetere)
        {
            if (!String.IsNullOrEmpty(semetere.semetername))
            {
                var SemeterItem = await _context.Semeters.Where(se => se.semeter_name.Contains(semetere.semetername)).SingleOrDefaultAsync();

                if (SemeterItem == null)
                {
                    return new Baserepone { errorcode = 1, errormessage = "Không tìm thấy dữ liệu" };
                }
                else
                {
                    //tra về cái lớp 
                    return new Baserepone(new Semeterrepon
                    {
                        Id = SemeterItem.Id,
                        semeter_name = SemeterItem.semeter_name

                    });
                }
            }

            return new Baserepone { errorcode = 1, errormessage = "Dữ liệu không được để trống" };

        }

        // Thêm semeter
        [HttpPost("AddSemeter")]
        public async Task<ActionResult<Baserepone>> post(Semeter semeter)
        {
            if (!String.IsNullOrEmpty(semeter.Id.ToString()) || !String.IsNullOrEmpty(semeter.semeter_name))
            {
                _context.Semeters.Add(semeter);
                await _context.SaveChangesAsync();
                return new Baserepone(new Semeterrepon
                {

                    Id = semeter.Id,
                    semeter_name = semeter.semeter_name,
                    token = ""

                });

            }
            else
            {
                return new Baserepone { errorcode = 1, errormessage = "Dữ liệu không được để trống" };

            }

        }

        //  update semeter

        [HttpPut("Update")]
        public async Task<ActionResult<Baserepone>> Put(int id, Semeter SemeterItem_Update)
        {
            var SemeterItem = await _context.Semeters.FindAsync(id);
            if (SemeterItem == null)
            {
                return new Baserepone { errorcode = 1, errormessage = "không tìm thấy id hiện tại" };
            }
            SemeterItem.semeter_name = SemeterItem_Update.semeter_name;
            _context.Semeters.Update(SemeterItem);
            await _context.SaveChangesAsync();
            return new Baserepone(new Semeterrepon
            {

                Id = SemeterItem_Update.Id,
                semeter_name = SemeterItem_Update.semeter_name,
                token = ""

            });


        }

        // xóa semeter

        [HttpDelete("Delete")]
        public async Task<ActionResult<Baserepone>> Delete(int id)
        {
            var Semeter = await _context.Semeters.FindAsync(id);
            if (Semeter == null)
            {
                return new Baserepone { errorcode = 1, errormessage = "không tìm thấy id hiện tại" };
            }
            _context.Semeters.Remove(Semeter);
            await _context.SaveChangesAsync();
            return new Baserepone(new Semeterrepon
            {

                Id = Semeter.Id,
                semeter_name = Semeter.semeter_name,
                token = ""

            });
        }


    }
}
