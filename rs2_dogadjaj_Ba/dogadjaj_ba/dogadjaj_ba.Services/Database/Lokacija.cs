using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class Lokacija
{
    public int LokacijaId { get; set; }

    public int? GradId { get; set; }

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual Grad? Grad { get; set; }
}
