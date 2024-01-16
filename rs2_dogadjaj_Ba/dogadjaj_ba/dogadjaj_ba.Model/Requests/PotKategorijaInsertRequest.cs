using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class PotKategorijaInsertRequest
    {
        public string? ImeKategorija { get; set; }

        public int? EventTypeId { get; set; }
    }
}
