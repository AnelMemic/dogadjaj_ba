using dogadjaj_ba.Model.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.SearchObjects
{
    public class EventiSearchObject : BaseSearchObject
    {
        public int id { get; set; }
        public string? Naziv { get; set; }
        public string? FTS { get; set; }
        public  TypeEvent? kategorija { get; set; }
        public SubtypeOfEventType? PodKategorija { get; set; }


    }
}
