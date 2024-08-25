using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class Payment
{
    public int PaymentId { get; set; }
    public DateTime PaymentDate { get; set; } = DateTime.Now;
    public string PaymentMethod { get; set; }
    public string PaymentStatus { get; set; }

    public int? userId { get; set; }
    public User? User { get; set; } = null!;

}
