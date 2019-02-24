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
    public class MajorController : ControllerBase
    {
        private readonly QLHocVienContext _context;
        public MajorController(QLHocVienContext context)
        {
            _context = context;
        }
        // GET: api/<controller>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Major>>> Get()
        {
            return await _context.Majors.ToListAsync();
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Major>> Get(int id)
        {
            var major = await _context.Majors.FindAsync(id);

            if (major == null)
            {
                return NotFound();
            }
            return major;
        }

        // POST api/<controller>
        [HttpPost]
        public async Task<ActionResult<Major>> Post(Major major)
        {
            _context.Majors.Add(major);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { id = major.MajorID }, major);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public async Task<ActionResult<Major>> Put(int id, Major major_updates)
        {
            var major = await _context.Majors.FindAsync(id);
            if (major == null)
            {
                return NotFound();
            }
            major.MajorName = major_updates.MajorName;
            _context.Majors.Update(major);
            await _context.SaveChangesAsync();
            return Ok(major);
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Major>> Delete(int id)
        {
            var major = await _context.Majors.FindAsync(id);
            if (major == null)
            {
                return NotFound();
            }
            _context.Majors.Remove(major);
            await _context.SaveChangesAsync();
            return major;
        }
    }
}
