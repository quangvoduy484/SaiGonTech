using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace QLHocVien.Utils
{
  public class Helepr
  {
    // Mã hóa pass word
    public static string GenHash(string input)
    {
      return string.Join("", new SHA1Managed().ComputeHash(Encoding.UTF8.GetBytes(input)).Select(x => x.ToString("X2")).ToArray());
    }
  }
}
