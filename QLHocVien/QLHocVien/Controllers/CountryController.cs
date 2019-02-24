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
    public class CountryController : ControllerBase
    {
        private readonly QLHocVienContext _context;
        public CountryController(QLHocVienContext context)
        {
            _context = context;
        }
        // GET: api/<controller>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Country>>> Get()
        {
            return await _context.Countrys.ToListAsync();
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Country>> Get(int id)
        {
            var country = await _context.Countrys.FindAsync(id);

            if (country == null)
            {
                return NotFound();
            }
            return country;
        }

        // POST api/<controller>
        [HttpPost]
        public async Task<ActionResult<Country>> Post(Country country)
        {
            _context.Countrys.Add(country);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { id = country.CountryID}, country);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public async Task<ActionResult<Country>> Put(int id, Country country_update)
        {
            var country = await _context.Countrys.FindAsync(id);
            if (country == null)
            {
                return NotFound();
            }
            country.CountryName = country_update.CountryName;
            _context.Countrys.Update(country);
            await _context.SaveChangesAsync();
            return Ok(country);
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Country>> Delete(int id)
        {
            var country = await _context.Countrys.FindAsync(id);
            if (country == null)
            {
                return NotFound();
            }
            _context.Countrys.Remove(country);
            await _context.SaveChangesAsync();
            return country;
        }
    }
}
