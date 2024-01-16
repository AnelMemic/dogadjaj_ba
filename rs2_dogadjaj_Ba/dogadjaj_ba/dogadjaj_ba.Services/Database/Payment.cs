using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class Payment
{
    public int PaymentId { get; set; }

    public string CardNumber { get; set; } = null!;

    public string ExpiryDate { get; set; } = null!;

    public string Cvv { get; set; } = null!;
}
