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
    public class ProvinceController : ControllerBase
    {
        private readonly QLHocVienContext _context;
        public ProvinceController(QLHocVienContext context)
        {
            _context = context;
        }
        // GET: api/<controller>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Province>>> Get()
        {
            return await _context.Provinces.ToListAsync();
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Province>> Get(int id)
        {
            var province = await _context.Provinces.FindAsync(id);

            if (province == null)
            {
                return NotFound();
            }
            return province;
        }

        // POST api/<controller>
        [HttpPost]
        public async Task<ActionResult<Province>> Post(Province province)
        {
            _context.Provinces.Add(province);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { id = province.ProvinceID }, province);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public async Task<ActionResult<Province>> Put(int id, Province province_update)
        {
            var province = await _context.Provinces.FindAsync(id);
            if (province == null)
            {
                return NotFound();
            }
            province.ProvinceName = province_update.ProvinceName;
            province.CountryID = province_update.CountryID;
            _context.Provinces.Update(province);
            await _context.SaveChangesAsync();
            return Ok(province);
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Province>> Delete(int id)
        {
            var province = await _context.Provinces.FindAsync(id);
            if (province == null)
            {
                return NotFound();
            }
            _context.Provinces.Remove(province);
            await _context.SaveChangesAsync();
            return province;
        }
    }
}
