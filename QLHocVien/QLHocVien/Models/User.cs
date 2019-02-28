using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Models
{
  [Table("USERS")]
  public class User
  {
    [Column("Use_ID")]
    public int userId { get; set; }
    [Column("Name")]
    public string name { get; set; }

    [Column("Username")]
    public string username { get; set; }

    [Column("Password")]
    public string password { get; set; }
  }
}
