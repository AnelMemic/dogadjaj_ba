using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model
{
    public class Grad
    {
        public int GradId { get; set; }

        public string? ImeGrada { get; set; }

        public string? Drzava { get; set; }

       // public virtual ICollection<Lokacija> Lokacijas { get; set; } = new List<Lokacija>();
       public int? countryId { get; set; }
    }
}
