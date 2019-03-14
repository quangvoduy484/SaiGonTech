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
    public class DocumentsController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public DocumentsController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/Documents
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetDocument()
        {
            var datas = await _context.Documents.Include(x=>x.InputTypes).Include(x=>x.Statuss).ToListAsync();
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

        // GET: api/Documents/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetDocument(int id)
        {
            var document = await _context.Documents.Include(x => x.InputTypes).Include(x => x.Statuss).Where(x=>x.Id==id).FirstOrDefaultAsync();

            if (document != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = new Document()
                    {
                        Id = document.Id,
                        NameInEnglish = document.NameInEnglish,
                        NameInVietnamese = document.NameInVietnamese,
                        SequenceNumber = document.SequenceNumber,
                        INPUTTYPE = document.INPUTTYPE,
                        STATUS = document.STATUS,
                        Note = document.Note
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

        // PUT: api/Documents/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDocument(int id, Document document_update)
        {
            var Doc = await _context.Documents.FindAsync(id);
            if(Doc == null)
            {
                return NotFound();
            }
            Doc.NameInEnglish = document_update.NameInEnglish;
            Doc.NameInVietnamese = document_update.NameInVietnamese;
            Doc.SequenceNumber = document_update.SequenceNumber;
            Doc.INPUTTYPE = document_update.INPUTTYPE;
            Doc.STATUS = document_update.STATUS;
            Doc.Note = document_update.Note;

            _context.Documents.Update(Doc);
            await _context.SaveChangesAsync();

            return Ok(Doc);
        }

        // POST: api/Documents
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostDocument(Document document)
        {
            if (String.IsNullOrEmpty(document.NameInEnglish) || String.IsNullOrEmpty(document.NameInVietnamese))
            {
                return new BaseResponse
                {
                    ErrorCode = 0,
                    Messege = "Thêm mới thất bại!!"
                };
            }
            else
            {
                _context.Documents.Add(document);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Thêm mới thành công!!",
                    Data = CreatedAtAction("GetDocument", new { id = document.Id }, document)
                };
            }
        }

        // DELETE: api/Documents/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteDocument(int id)
        {
            var document = await _context.Documents.FindAsync(id);
            if (document != null)
            {
                _context.Documents.Remove(document);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = document
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
