using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class LokacijaInsertRequest
    {
        public int? GradId { get; set; }
        public string Adresa { get; set; }
        public string NazivObjekta { get; set; }
    }
}
