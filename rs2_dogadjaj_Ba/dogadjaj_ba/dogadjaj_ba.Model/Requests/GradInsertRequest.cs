using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public  class GradInsertRequest
    {
        public string? ImeGrada { get; set; }

        public string? Drzava { get; set; }
        public int? countryId { get; set; } = null!;

    }
}
