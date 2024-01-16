using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class PotKategorija
{
    public int PotkategorijaId { get; set; }

    public string? ImeKategorija { get; set; }

    public int? EventTypeId { get; set; }

    public virtual EventType? EventType { get; set; }
}
