using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;
using QLHocVien.Repones;

namespace QLHocVien.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class YearController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public YearController(QLHocVienContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<Baserepone>> Get()
        {
            var years = await _context.Years.ToListAsync();
            return new Baserepone(years);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Baserepone>> Get(int id)
        {
            var yearItem = await _context.Years.FindAsync(id);
            if (yearItem == null)
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Year Not Found",
                };
            }
            else
            {
                return new Baserepone(yearItem);
            }
        }

        [HttpPost]
        public async Task<ActionResult<Baserepone>> Post(Year yearInput)
        {
            _context.Years.Add(yearInput);
            await _context.SaveChangesAsync();

            return new Baserepone(yearInput);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Baserepone>> Put(int id, Year yearInput)
        {
            var yearItem = await _context.Years.FindAsync(id);
            if (yearItem == null)
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Not Found Year Id: " + id
                };
            }
            else
            {
                yearItem.YearName = yearInput.YearName;
                _context.Years.Update(yearItem);
                await _context.SaveChangesAsync();
                return new Baserepone(yearItem);
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Baserepone>> Delete(int id)
        {
            var yearItem = await _context.Years.FindAsync(id);
            if (yearItem == null)
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Not Found Year Id: " + id
                };
            }
            else
            {
                _context.Years.Remove(yearItem);
                await _context.SaveChangesAsync();
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Delete Success: " + yearItem.YearName
                };
            }
        }

        [HttpGet("search")]
        public async Task<ActionResult<IEnumerable<Year>>> Search([FromQuery] int yearinput)
        {
            return await _context.Years
                .Where(x => x.YearName == yearinput)
                .ToListAsync();
        }
    }
}
