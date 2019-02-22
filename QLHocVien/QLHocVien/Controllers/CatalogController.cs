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
    public class CatalogController : ControllerBase
    {
        private readonly QLHocVienContext _context;
        public CatalogController(QLHocVienContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Catalog>>> Get()
        {
            return await _context.Catalogs.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Catalog>> Get(int id)
        {
            var CatalogItem = await _context.Catalogs.FindAsync(id);

            if (CatalogItem == null)
            {
                return NotFound();
            }
            return CatalogItem;
        }

        [HttpPost]
        public async Task<ActionResult<Catalog>> Post(Catalog CatalogItem)
        {
            _context.Catalogs.Add(CatalogItem);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { id = CatalogItem.Id }, CatalogItem);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Catalog>> Put(int id,Catalog CatalogItem_Update)
        {
            var CatalogItem = await _context.Catalogs.FindAsync(id);
            if(CatalogItem == null)
            {
                return NotFound();
            }
            CatalogItem.BeginYear = CatalogItem_Update.BeginYear;
            CatalogItem.EndYear = CatalogItem_Update.EndYear;
            _context.Catalogs.Update(CatalogItem);
            await _context.SaveChangesAsync();
            return Ok(CatalogItem);


        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Catalog>> Delete(int id)
        {
            var Catalog =await _context.Catalogs.FindAsync(id);
            if(Catalog == null)
            {
                return NotFound();
            }
             _context.Catalogs.Remove(Catalog);
            await _context.SaveChangesAsync();
            return Catalog;

        }



        
    }
}
