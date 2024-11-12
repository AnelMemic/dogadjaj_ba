using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model
{
    public class Post
    {
        public int Id { get; set; }

        public string title { get; set; } = null!;
        public string content { get; set; } = null!;
        public DateTime PublishDate { get; set; }
        public int eventId { get; set; }
    }
}
