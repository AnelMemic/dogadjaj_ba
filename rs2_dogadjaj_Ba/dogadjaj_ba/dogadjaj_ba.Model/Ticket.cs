using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model
{
    public class Ticket
    {
        public int TicketId { get; set; }

        public int? UserId { get; set; }
        public string? title { get; set; }

        public string? description { get; set; }

        public string? ticketNumber { get; set; }

        public int? EventId { get; set; }

        public int Available { get; set; }

        public decimal? Cijena { get; set; }

        public Event Event { get; set; }
    }
}
