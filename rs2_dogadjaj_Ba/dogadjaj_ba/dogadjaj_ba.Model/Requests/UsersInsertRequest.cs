using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class UsersInsertRequest
    {

        //public int UserId { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Ime i prezime je obavezna")]
        public string ImePrezime { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Korisnicko ime  je obavezna")]
        public string KorisnickoIme { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email je obavezna")]
        public string Email { get; set; }

        [Required(AllowEmptyStrings =false, ErrorMessage ="Sifra je obavezna")]
        [Compare("SifraPotvrda", ErrorMessage ="Sifra nije ista")]
        public string Sifra { get; set; }

        [Compare("Sifra", ErrorMessage = "Sifra nije ista")]
        public string SifraPotvrda { get; set; }
    }
}
