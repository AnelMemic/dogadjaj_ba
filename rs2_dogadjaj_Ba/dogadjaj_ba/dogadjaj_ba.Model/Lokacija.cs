using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model
{
    public class Lokacija
    {
        public int LokacijaId { get; set; }

        public int? GradId { get; set; }

        //public virtual ICollection<Event> Events { get; set; } = new List<Event>();
        //public virtual Grad? Grad { get; set; }
    }
}
