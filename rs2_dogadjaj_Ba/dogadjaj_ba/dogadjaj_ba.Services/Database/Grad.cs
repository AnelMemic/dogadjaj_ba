using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class Grad
{
    public int GradId { get; set; }

    public string? ImeGrada { get; set; }

    public string? Drzava { get; set; }

    public virtual ICollection<Lokacija> Lokacijas { get; set; } = new List<Lokacija>();
}
