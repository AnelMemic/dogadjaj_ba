using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class EventType
{
    public int EventTypeId { get; set; }

    public string TypeName { get; set; } = null!;

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual ICollection<PotKategorija> PotKategorijas { get; set; } = new List<PotKategorija>();
}
