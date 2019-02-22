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
	public class EducationController : ControllerBase
	{
		private readonly QLHocVienContext _context;
		public EducationController (QLHocVienContext context)
		{
			_context = context;
		}
		// GET: api/<controller>
		[HttpGet]
		public async Task<ActionResult<IEnumerable<Education>>> Get()
		{
			return await _context.Educations.ToListAsync();
		}

		// GET api/<controller>/5
		[HttpGet("{id}")]
		public async Task<ActionResult<Education>> Get(int id)
		{
			var education = await _context.Educations.FindAsync(id);
			if (education == null)
			{
				return NotFound();
			}
			return education;
		}

		// POST api/<controller>
		[HttpPost]
		public async Task<ActionResult<Education>> Post(Education education)
		{
			_context.Educations.Add(education);
			await _context.SaveChangesAsync();
			return CreatedAtAction("Get", new { id = education.Id }, education);
		}

		// PUT api/<controller>/5
		[HttpPut("{id}")]
		public async Task<ActionResult<Education>> Put(int id, Education education)
		{
			var find_education = await _context.Educations.FindAsync(id);
			if(find_education == null)
			{
				return NotFound();
			}
			find_education.EducationName = education.EducationName;
			_context.Educations.Update(find_education);
			await _context.SaveChangesAsync();
			return Ok(find_education);
		}

		// DELETE api/<controller>/5
		[HttpDelete("{id}")]
		public async Task<ActionResult<Education>> Delete(int id)
		{
			var education = await _context.Educations.FindAsync(id);
			if (education == null)
			{
				return NotFound();
			}
			_context.Educations.Remove(education);
			await _context.SaveChangesAsync();
			return education;
		}
	}
}
