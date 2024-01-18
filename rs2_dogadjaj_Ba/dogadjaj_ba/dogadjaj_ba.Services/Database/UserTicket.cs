using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services.Database
{
    public class UserTicket
    {
        public int UserTicketID { get; set; }
        public int UserID { get; set; }
        public int TicketID { get; set; }

        public User User { get; set; }
        public Ticket Ticket { get; set; }
    }
}
