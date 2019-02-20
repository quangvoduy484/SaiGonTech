using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;

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

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Semeter>>> Get()
        {
            return await _context.Semeters.ToListAsync();
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<Semeter>> Get(int id)
        {
            var SemeterItem = await _context.Semeters.FindAsync(id);

            if (SemeterItem == null)
            {
                return NotFound();
            }
            return SemeterItem;
        }

        [HttpPost]
        public async Task<ActionResult<Semeter>> Post(Semeter SemeterItem)
        {
            _context.Semeters.Add(SemeterItem);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { id = SemeterItem.Id }, SemeterItem);
        }


        [HttpPut("{id}")]
        public async Task<ActionResult<Semeter>> Put(int id, Semeter SemeterItem_Update)
        {
            var SemeterItem = await _context.Semeters.FindAsync(id);
            if (SemeterItem == null)
            {
                return NotFound();
            }
            SemeterItem.semeter_name = SemeterItem_Update.semeter_name;
            _context.Semeters.Update(SemeterItem);
            await _context.SaveChangesAsync();
            return Ok(SemeterItem);


        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Semeter>> Delete(int id)
        {
            var Semeter = await _context.Semeters.FindAsync(id);
            if (Semeter == null)
            {
                return NotFound();
            }
            _context.Semeters.Remove(Semeter);
            await _context.SaveChangesAsync();
            return Semeter;

        }
    }
}
