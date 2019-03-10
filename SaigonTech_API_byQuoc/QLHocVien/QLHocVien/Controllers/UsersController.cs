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
    public UsersController(QLHocVienContext context, IHostingEnvironment hostingEnvironment)
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
    public async Task<ActionResult<BaseResponse>> GetUsers()
    {
      var ListUser = await _context.Users.AsNoTracking().ToListAsync();
      if (ListUser.Count() == 0)
      {
        return new BaseResponse { ErrorCode = 1, Messege = "Danh sách rỗng" };
      }
      return new BaseResponse(ListUser);
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<BaseResponse>> GetUser(int id)
    {
      var user = await _context.Users.Where(x => x.Id == id).SingleOrDefaultAsync();
      if (user == null)
      {
        return new BaseResponse { ErrorCode = 1, Messege = "Không tìm thấy đối tượng" };
      }

      return new BaseResponse(user);
    }


    [HttpPost("login")]
    public async Task<ActionResult<BaseResponse>> Login(Login login)
    {
      if (!String.IsNullOrEmpty(login.UserName) && !String.IsNullOrEmpty(login.PassWord))
      {
        var user = await _context.Users.Where(x => x.UserName == login.UserName && x.PassWord == Utils.Helper.GenHash(login.PassWord)).AsNoTracking().SingleOrDefaultAsync();
        if (user != null)
        {
          HttpContext.Session.SetString("quyen", user.UserName);

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


    [HttpPost()]
    public async Task<ActionResult<BaseResponse>> Post([FromForm] User user)
    {
      if (!string.IsNullOrEmpty(user.Email) || !string.IsNullOrEmpty(user.Name) || !string.IsNullOrEmpty(user.PassWord) || !string.IsNullOrEmpty(user.UserName))
      {
        user.PassWord = Utils.Helper.GenHash(user.PassWord);
        _context.Users.Add(user);
        await _context.SaveChangesAsync();
        var file = user.File;

        if (file != null)
        {
          string newFileName = user.Id + "_" + file.FileName;
          string path = _hostingEnvironment.ContentRootPath + "\\Data\\" + newFileName;
          var stream = new FileStream(path, FileMode.Create);
          file.CopyTo(stream);

          user.ImagePath = newFileName;
          _context.Entry(user).Property(x => x.ImagePath).IsModified = true;
          _context.SaveChanges();

        }

        return new BaseResponse(new User
        {
          UserName = user.UserName,
          Name = user.Name,
          PassWord = user.PassWord,
          Email = user.Email,
          ImagePath = user.ImagePath
        });

      }

      return new BaseResponse { ErrorCode = 0, Messege = "Dữ liệu rỗng" };

    }


    [HttpPut("{id}")]
    public async Task<ActionResult<BaseResponse>> Put(int id, [FromForm] User user)
    {
      var userItem = await _context.Users.AsNoTracking().Where(s => s.Id == id).SingleOrDefaultAsync();

      // save change
      if (userItem != null)
      {
        if(HttpContext.Session.GetString("quyen") == "admin")
        {
          userItem.Status = user.Status;
          _context.Entry(userItem).Property(us => us.Status).IsModified = true;
        }
        else
        {
          userItem.Name = user.Name;
          userItem.UserName = user.UserName;
          userItem.Email = user.Email;
          userItem.Phone = user.Phone;
          userItem.Addres = user.Addres;
          userItem.PassWord = user.PassWord;
        }

        // Lưu vào cs dl 
        _context.Users.Update(userItem);
        await _context.SaveChangesAsync();

        var file = user.File;

        if (file != null)
        {
          string path = _hostingEnvironment.ContentRootPath + "\\Data\\" + userItem.ImagePath;

          if (System.IO.File.Exists(path))
          {


            System.IO.File.Delete(path);
            path = "";
            path = _hostingEnvironment.ContentRootPath + "\\Data\\" + userItem.Id + "_" + file.FileName;
          }

          // có thì xóa sao đó rồi thêm file mới, không có thì cứ thêm bình thường
          using (var stream = new FileStream(path, FileMode.Create))
          {
            file.CopyTo(stream);
            userItem.ImagePath = file.FileName;
            _context.Entry(userItem).Property(x => x.ImagePath).IsModified = true;
            await _context.SaveChangesAsync();
          }

          return new BaseResponse(new User
          {
            UserName = userItem.UserName,
            Name = userItem.Name,
            PassWord = userItem.PassWord,
            Email = userItem.Email,
            Status = user.Status,
            Phone = user.Phone,
            ImagePath = userItem.ImagePath

          });
        }
      }
      return new BaseResponse { ErrorCode = 0, Messege = "Dữ liệu rỗng" };
    }

  }


}
