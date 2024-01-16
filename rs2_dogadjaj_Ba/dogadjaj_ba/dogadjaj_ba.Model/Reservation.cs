using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model
{
    public class Reservation
    {
        public int ReservationId { get; set; }

        public int? UserId { get; set; }

        public DateTime ReservationDate { get; set; }
    }
}
