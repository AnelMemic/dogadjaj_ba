﻿using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class Event
{
    public int EventId { get; set; }

    public string EventName { get; set; } = null!;

    public int? LokacijaId { get; set; }

    public DateTime EventDate { get; set; }

    public string? Opis { get; set; }

    public int? EventTypeId { get; set; }

    public byte[]? EventImage { get; set; }
    public string?  StateMachine { get; set; }

    public virtual EventType? EventType { get; set; }

    public virtual Lokacija? Lokacija { get; set; }

    public virtual ICollection<ReportDatum> ReportData { get; set; } = new List<ReportDatum>();

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
