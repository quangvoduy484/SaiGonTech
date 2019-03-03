using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QLHocVien.Models;
using QLHocVien.Repones;
using QLHocVien.Requests;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QLHocVien.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class ParameterController : Controller
  {
   
    private readonly QLHocVienContext _context;
    public ParameterController(QLHocVienContext context)
    {

      this._context = context;
      Parameterequest _paramete = new Parameterequest();
      if (_context.Parameters.ToList().Count() == 0)
      {

        try
        {
          var CurrentIntake = _context.Intakes.Where(it => it.IntakeName.Contains("ISC")).OrderByDescending(s => s.IntakeName).Take(1).ToList();
          foreach(var intake in CurrentIntake)
          {
            _paramete.Intake_Id = intake.Id;
          }
        }
        catch (System.NotImplementedException exception)
        {
          Console.Write(exception);
        }

        try
        {
          var current_year_semeter = (from year in _context.Years
                       join stage in _context.Stages on year.Id equals stage.YEAR_ID
                       join semeter in _context.Semeters on stage.SEM_ID equals semeter.Id
                       orderby year.YearName descending
                       select new
                       {
                         current_year = stage.YEAR_ID,
                         current_semeter = stage.SEM_ID,

                       }
          ).Take(1);

          foreach(var yearsemeter in current_year_semeter )
          {
            _paramete.Semeter_Id = yearsemeter.current_semeter;
            _paramete.Year_Id = yearsemeter.current_year;
          }

        }
        catch (Exception e)
        {
          Console.Write("Loi" + e.Message);


        }
        Parameter para = new Parameter
        {
          Singaturename = "TruongPhong",
          Morecontact = "SV01",
          Documentcode = (_paramete.Intake_Id + _paramete.Semeter_Id + _paramete.Year_Id).ToString(),
          yearid = _paramete.Year_Id,
          semid = _paramete.Semeter_Id,
          intakeid = _paramete.Intake_Id

        };

        _context.Parameters.Add(para);
        _context.SaveChanges();


      }


    }

    [HttpGet()]
    public async Task<ActionResult<Baserepone>>  Get()
    {
      var Parameter = await _context.Parameters.FirstAsync();

      if(Parameter == null)
      {
        return new Baserepone { errorcode = 1, errormessage = "Danh sách rỗng" };
      }

      return new Baserepone(Parameter);



    }
  }
}
