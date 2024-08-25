using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model
{
    public  class Payment
    {
        public int PaymentId { get; set; }
        public DateTime PaymentDate { get; set; } = DateTime.Now;
        public string PaymentMethod { get; set; }
        public string PaymentStatus { get; set; }
        public int? userId { get; set; }
    }
}
