namespace dogadjaj_ba.Model
{
    public partial class UserTicket
    {
        public int UserTicketID { get; set; }
        public int UserId { get; set; }
        public int TicketId { get; set; }
        public int Kolicina { get; set; }
        public Ticket ticket { get; set; }

    }
}
