using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class Reservation
{
    public int ReservationId { get; set; }

    public int? UserId { get; set; }

    public DateTime ReservationDate { get; set; }

    //public virtual ICollection<Payment1> Payment1s { get; set; } = new List<Payment1>();

    public virtual User? User { get; set; }
}
