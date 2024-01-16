using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class UsersUpdateRequest
    {
        public string ImePrezime { get; set; }

        public string KorisnickoIme { get; set; }
        public string Email { get; set; }

        public string Sifra { get; set; }
    }
}
