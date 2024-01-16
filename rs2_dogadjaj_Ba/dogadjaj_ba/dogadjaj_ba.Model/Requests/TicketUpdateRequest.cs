using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class TicketUpdateRequest
    {
       // public int TicketId { get; set; }

        public int? UserId { get; set; }

        public int? EventId { get; set; }

        public decimal? Cijena { get; set; }
    }
}
