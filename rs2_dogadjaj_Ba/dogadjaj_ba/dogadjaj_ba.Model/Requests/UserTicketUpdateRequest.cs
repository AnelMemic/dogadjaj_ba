using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class UserTicketUpdateRequest
    {
        public int UserID { get; set; }
        public int TicketID { get; set; }
    }
}
