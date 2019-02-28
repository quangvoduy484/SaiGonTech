using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QLHocVien.Repones
{
  public class Baserepone
  {
    public int errorcode { get; set; }

    public string errormessage { get; set; }

    public object data { get; set; }

    
    public Baserepone() { }

    public Baserepone(object _data)
    {
      this.data = _data;

    }



  }
}
