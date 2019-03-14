using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using QLHocVien.Models;
using QLHocVien.Models.Request;
using QLHocVien.Models.Response;
using QLHocVien.Utils;

namespace QLHocVien.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly QLHocVienContext _context;

        public UsersController(QLHocVienContext context)
        {
            _context = context;
            if (_context.Users.ToList().Count() == 0)
            {
                User newUser = new User
                {
                    UserName = "admin",
                    PassWord = Utils.Helper.GenHash("123456"),
                    Name = "System admin"
                };
                _context.Users.Add(newUser);
                _context.SaveChanges();
            }
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUser()
        {
            return await _context.Users.AsNoTracking().ToListAsync();
        }

        // PUT: api/Users/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            var users = await _context.Users.FindAsync(id);
            if(users == null)
            {
                return NotFound();
            }
            users.Name = user.Name;
            users.PassWord = user.PassWord;
            users.Phone = user.Phone;
            users.Addres = user.Addres;
            users.Email = user.Email;
            users.UserName = user.UserName;

            _context.Users.Update(users);
            await _context.SaveChangesAsync();
            return Ok(users);
        }

        // POST: api/Users
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUser", new { id = user.Id }, user);
        }

        [HttpPost("login")]
        public async Task<ActionResult<BaseResponse>> Login(Login login)
        {
            if (!String.IsNullOrEmpty(login.UserName) && !String.IsNullOrEmpty(login.PassWord))
            {
                var user = await _context.Users.Where(x => x.UserName == login.UserName && x.PassWord == Utils.Helper.GenHash(login.PassWord)).AsNoTracking().SingleOrDefaultAsync();
                if (user != null)
                {
                    //generate token
                    var claimData = new[] { new Claim(ClaimTypes.Name, login.UserName) };
                    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Helper.AppKey));
                    var signCreadential = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                    var token = new JwtSecurityToken(
                            issuer: Helper.issuer,
                            audience: Helper.issuer,
                            expires: DateTime.Now.AddMinutes(30),
                            claims: claimData,
                            signingCredentials: signCreadential
                        );

                    var tokenString = new JwtSecurityTokenHandler().WriteToken(token);


                    return new BaseResponse
                    {
                        ErrorCode = 1,
                        Messege = "Đăng Nhập Thành Công!!",
                        Data = new Loginreponse()
                        {
                            Id = user.Id,
                            UserName = user.UserName,
                            token = "Bearer " + tokenString
                        }
                    };
                }
                else
                {
                    return new BaseResponse
                    {
                        ErrorCode = 0,
                        Messege = "Sai tài khoản hoặc mật khẩu",
                    };
                }
            }
            return NoContent();
        }
    }
}
