using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class Ticket
{
    public int TicketId { get; set; }

    public string? title { get; set; }

    public string? description { get; set; }

    public int? UserId { get; set; }

    public string? ticketNumber { get; set; }

    public int? EventId { get; set; }

    public decimal? Cijena { get; set; }

    public virtual Event? Event { get; set; }

    public virtual User? User { get; set; }
}
