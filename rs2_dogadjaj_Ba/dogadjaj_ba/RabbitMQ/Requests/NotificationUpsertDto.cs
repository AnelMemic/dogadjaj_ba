namespace RabbitMQ.Requests
{
    public class NotificationUpsertDto
    {
        public int? Id { get; set; }
        public string Content { get; set; } = null!;
        public bool? Read { get; set; } = false;
        public bool? Deleted { get; set; } = false;
        public DateTime? DateRead { get; set; }
        public DateTime? SendOnDate { get; set; }

        public int UserId { get; set; }
    }
}
