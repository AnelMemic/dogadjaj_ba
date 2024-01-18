using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class TicketInsertRequest
    {
        //public int TicketId { get; set; }

        public int? UserId { get; set; }

        public int? EventId { get; set; }
        public int Available { get; set; }

        public decimal? Cijena { get; set; }
    }
}
