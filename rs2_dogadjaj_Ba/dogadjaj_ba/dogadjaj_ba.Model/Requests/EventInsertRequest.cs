using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class EventInsertRequest
    {
        //public int EventId { get; set; }
        [Required(AllowEmptyStrings =false)]
        public string EventName { get; set; } = null!;

        public int? LokacijaId { get; set; }

        public DateTime EventDate { get; set; }

        public string? Opis { get; set; }
      //  public string? StateMachine { get; set; }
        public int? EventTypeId { get; set; }
    }
}
