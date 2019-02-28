using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using QLHocVien.Models;
using QLHocVien.Repones;
using QLHocVien.Requests;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QLHocVien.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class UserController : Controller
  {
    QLHocVienContext _context;
    public UserController(QLHocVienContext context)
    {
      this._context = context;
      if (_context.Users.Count() == 0)
      {
        User a = new User
        {
          username = "admin",
          name = "quantrivien",
          password = Utils.Helepr.GenHash("123456")

        };
        _context.Users.Add(a);
        _context.SaveChanges();


      }

    }

    [HttpGet()]
    public async Task<ActionResult<IEnumerable<User>>> Get()
    {
      return await _context.Users.ToListAsync();
    }

    [HttpPost("Login")]
    public async Task<ActionResult<Baserepone>> Login(Loginrequest request)
    {
      if(!String.IsNullOrEmpty(request.username) && !String.IsNullOrEmpty(request.password)){
        var user = await _context.Users.Where(x => x.username == request.username && x.password == Utils.Helepr.GenHash(request.password)).AsNoTracking().SingleOrDefaultAsync();
        if (user != null)
        {
          //generate token (key)
          var claimData = new[] { new Claim(ClaimTypes.Name, request.username) };
          // mã hóa và đầu vào là dạng một mảng byte
          var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("1234567890asdfghjkl"));
          // mã hóa bằng thuật toán hmacSha256
          var singingCredential = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
          var token = new JwtSecurityToken(
              issuer: "http://localhost:2348",
              audience: "http://localhost:2348",
              expires: DateTime.Now.AddMinutes(30),
              signingCredentials: singingCredential
              );
          var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

          return new Baserepone(new Loginrepone { id = user.userId, username = user.username, name=user.name, token = "Bearer " + tokenString });
        }
        else
        {
          return new Baserepone { errorcode = 1, errormessage = "Wrong username or password" };
        }
      }

      return new Baserepone { errorcode = 1, errormessage = "Wrong username or empty" };
    }
  }
}

