using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class PostInsertRequest
    {
        public string title { get; set; }
        public string content { get; set; }
        public DateTime PublishDate { get; set; }
        public int eventId { get; set; }
    }
}
