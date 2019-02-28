using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;
using QLHocVien.Repones;
using QLHocVien.Requests;

namespace QLHocVien.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IntakeController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public IntakeController(QLHocVienContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<Baserepone>> Get()
        {
            var intakes = await _context.Intakes.ToListAsync();
            return new Baserepone(intakes);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Baserepone>> Get(int id)
        {
            var intakeItem = await _context.Intakes.FindAsync(id);
            if (intakeItem == null)
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Intake Not Found",
                };
            }
            else
            {
                return new Baserepone(intakeItem);
            }
        }

        [HttpPost]
        public async Task<ActionResult<Baserepone>> Post(Intake intakeInput)
        {
            _context.Intakes.Add(intakeInput);
            await _context.SaveChangesAsync();

            return new Baserepone(intakeInput);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Baserepone>> Put(int id, Intake intakeInput)
        {
            var intake = await _context.Intakes.FindAsync(id);
            if (intake == null)
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Not Found Intake Id: " + id
                };
            }
            else
            {
                intake.IntakeName = intakeInput.IntakeName;
                _context.Intakes.Update(intake);
                await _context.SaveChangesAsync();
                return new Baserepone(intake);
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Baserepone>> Delete(int id)
        {
            var intake = await _context.Intakes.FindAsync(id);
            if (intake == null)
            {
                return new Baserepone
                {
                    errorcode = 1,
                    errormessage = "Not Found Intake Id: " + id
                };
            }
            else
            {
                _context.Intakes.Remove(intake);
                await _context.SaveChangesAsync();
                return new Baserepone
                {
                    errorcode = 0,
                    errormessage = "Delete Success: " + intake.IntakeName
                };
            }
        }
    }
}