using System;
using System.Collections.Generic;

namespace dogadjaj_ba.Services.Database;

public partial class User
{
    public int UserId { get; set; }

    public string ImePrezime { get; set; } = null!;

    public string KorisnickoIme { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Sifra { get; set; }

    //public virtual ICollection<Payment1> Payment1s { get; set; } = new List<Payment1>();

    public virtual ICollection<ReportDatum> ReportData { get; set; } = new List<ReportDatum>();

    public virtual ICollection<Reservation> Reservations { get; set; } = new List<Reservation>();

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
    public virtual ICollection<UserTicket> UserTicket { get; set; } = new List<UserTicket>();
}
