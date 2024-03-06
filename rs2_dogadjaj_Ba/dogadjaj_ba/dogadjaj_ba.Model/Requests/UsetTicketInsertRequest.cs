using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class UserTicketInsertRequest
    {
        public int UserId { get; set; }
        public int TicketId { get; set; }

        public int Kolicina { get; set; }
    }
}
