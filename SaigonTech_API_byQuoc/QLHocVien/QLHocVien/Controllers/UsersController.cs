using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
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
        private readonly IHostingEnvironment _hostingEnvironment;
        public UsersController(IHostingEnvironment hostingEnvironment, QLHocVienContext context)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
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
        public async Task<IActionResult> PutUser(int id, [FromForm] UpdateUserRequest user)
        {
            var users = await _context.Users.FindAsync(id);
            if (users == null)
            {
                return NotFound();
            }
            users.Name = user.Name;
            users.Phone = user.Phone;
            users.Address = user.Address;
            users.Email = user.Email;
            var file = user.File;
            if (file != null)
            {
                string path = _hostingEnvironment.ContentRootPath + "\\wwwroot\\Data\\" + users.Avatar;
                if ((System.IO.File.Exists(path)))
                {
                    System.IO.File.Delete(path);
                }
                string newFileName = users.Id + "_" + file.FileName;
                string path1 = _hostingEnvironment.ContentRootPath + "\\wwwroot\\Data\\" + newFileName;
                using (var stream = new FileStream(path1, FileMode.Create))
                {
                    file.CopyTo(stream);
                    users.Avatar = newFileName;
                }

            }
            _context.Users.Update(users);
            await _context.SaveChangesAsync();
            return Ok(users);
        }

        [HttpPut("ChangeActive/{id}")]
        public async Task<IActionResult> PutActive(int id, ChangeActiveRequest act)
        {
            var users = await _context.Users.FindAsync(id);
            if (users == null)
            {
                return NotFound();
            }

            if (act.active != 1 && act.active != 0)
            {
                return BadRequest("Invalid Integer Active");
            }
            users.Active = act.active;

            _context.Users.Update(users);
            await _context.SaveChangesAsync();
            return Ok(users);
        }

        [HttpPost("checkpass")]
        public async Task<ActionResult<BaseResponse>> CheckPass(CheckPassRequest cpr)
        {
            var user = await _context.Users.FindAsync(cpr.id);
            if (user == null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Not Found User"
                };
            }
            if (user.PassWord == Utils.Helper.GenHash(cpr.password))
            {
                return new BaseResponse(user);
            }
            else
            {
                return new BaseResponse
                {
                    ErrorCode = 2,
                    Messege = "Wrong Password"
                };
            }
        }

        [HttpPut("ChangePassword/{id}")]
        public async Task<ActionResult<BaseResponse>> PutPassword(int id, ChangePasswordRequest pass)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return new BaseResponse
                {
                    ErrorCode = 1,
                    Messege = "Not Found User"
                };
            }

            if (pass.newpassword == null || pass.confirmpassword == null)
            {
                return BadRequest("Missing fields!");
            }
            if (pass.newpassword != pass.confirmpassword)
            {
                return BadRequest("Not Match!");
            }

            user.PassWord = pass.newpassword;
            _context.Users.Update(user);
            await _context.SaveChangesAsync();
            return Ok(user);
        }

        // POST: api/Users
        [HttpPost]
        public async Task<ActionResult<User>> PostUser([FromForm] User user)
        {
            var check = await _context.Users.Where(x => x.Id == user.Id).FirstOrDefaultAsync();
            if (check != null)
            {
                return BadRequest();
            }
            
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            var file = user.File;
            if (file != null)
            {
                string newFileName = user.Id + "_" + file.FileName;
                string path = _hostingEnvironment.ContentRootPath + "\\wwwroot\\Data\\" + newFileName;
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    file.CopyTo(stream);
                    user.Avatar = newFileName;
                    _context.Entry(user).Property(x => x.Avatar).IsModified = true;
                    _context.SaveChanges();
                }

            }
            user.File = null;
            return user;
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
