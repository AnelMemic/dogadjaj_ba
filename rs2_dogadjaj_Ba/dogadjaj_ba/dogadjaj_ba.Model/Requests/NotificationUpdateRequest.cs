using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class NotificationUpdateRequest
    {
        public int Id { get; set; }

        public string Content { get; set; } = null!;
        public bool? Read { get; set; } = false;
        public bool? Deleted { get; set; } = false;
        public DateTime? DateRead { get; set; }
        public DateTime? SendOnDate { get; set; }

        public int UserId { get; set; }
    }
}
