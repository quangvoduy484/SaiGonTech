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
        public async Task<ActionResult<Year>> Get(int id)
        {
            var YearItem = await _context.Years.FindAsync(id);

            if (YearItem == null)
            {
                return NotFound();
            }
            return YearItem;
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