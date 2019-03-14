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
    public class CandidateDocumentsController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public CandidateDocumentsController(QLHocVienContext context)
        {
            _context = context;
        }

        // GET: api/CandidateDocuments
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetCandidateDocument()
        {
            var datas = await _context.CandidateDocuments.Include(x=>x.Document).Include(x=>x.Candidate).ToListAsync();
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

        // GET: api/CandidateDocuments/GetDocumentByCandidate/{ID_Candidate}
        [HttpGet("GetDocumentByCandidate/{ID_Candidate}")]
        public async Task<ActionResult<BaseResponse>> GetDocumentByCandidate(int ID_Candidate)
        {
            var DocCan = await _context.CandidateDocuments.Include(x => x.Document).Include(x => x.Candidate).Where(x => x.C_ID == ID_Candidate).ToListAsync();
            if (DocCan != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = DocCan
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

        // GET: api/CandidateDocuments/GetCandidateDocumentByDocument/{ID_Candidate}
        [HttpGet("GetCandidateDocumentByDocument/{ID_Candidate}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateDocumentByDocument(int ID_Doc)
        {
            var DocCan = await _context.CandidateDocuments.Include(x => x.Document).Include(x => x.Candidate).Where(x => x.DOC_ID == ID_Doc).ToListAsync();
            if (DocCan != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = DocCan
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

        // GET: api/CandidateDocuments/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> GetCandidateDocument(int id)
        {
            var candidateDocument = await _context.CandidateDocuments.Include(x => x.Document).Include(x => x.Candidate).Where(x => x.Id == id).FirstOrDefaultAsync();

            if (candidateDocument != null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Tìm kiếm dữ liệu thành công!!",
                    Data = candidateDocument
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

        // PUT: api/CandidateDocuments/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCandidateDocument(int id, CandidateDocument candidateDocument_update)
        {
            var Cand = await _context.CandidateDocuments.FindAsync(id);
            if(Cand == null)
            {
                return NotFound();
            }

            Cand.DOC_ID = candidateDocument_update.DOC_ID;
            Cand.C_ID = candidateDocument_update.C_ID;
            Cand.Note = candidateDocument_update.Note;

            _context.CandidateDocuments.Update(Cand);
            await _context.SaveChangesAsync();

            return Ok(Cand);
        }

        // POST: api/CandidateDocuments
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> PostCandidateDocument(CandidateDocument candidateDocument)
        {
            _context.CandidateDocuments.Add(candidateDocument);
            await _context.SaveChangesAsync();
            return new BaseResponse
            {
                ErrorCode = 1,
                Messege = "Thêm mới thành công!!",
                Data = CreatedAtAction("GetCandidateDocument", new { id = candidateDocument.Id }, candidateDocument)
            };
        }

        // DELETE: api/CandidateDocuments/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> DeleteCandidateDocument(int id)
        {
            var candidateDocument = await _context.CandidateDocuments.FindAsync(id);
            if (candidateDocument != null)
            {
                _context.CandidateDocuments.Remove(candidateDocument);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Xóa thành công!!",
                    Data = candidateDocument
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
