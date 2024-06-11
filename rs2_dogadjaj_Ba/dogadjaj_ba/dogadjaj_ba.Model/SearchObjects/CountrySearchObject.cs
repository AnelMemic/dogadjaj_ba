using dogadjaj_ba.Model.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.SearchObjects
{
    public class CountrySearchObject : BaseSearchObject
    {
        public int countryId { get; set; }

        public string? name { get; set; }

    }
}
