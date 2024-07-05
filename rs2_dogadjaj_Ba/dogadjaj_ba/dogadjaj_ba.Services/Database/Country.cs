using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services.Database
{
    public partial class Country
    {
        public int countryId { get; set; }

        public string? name { get; set; }

        public ICollection<Grad>? Cities { get; set; } = null;

    }
}
