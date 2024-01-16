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

        public string CardNumber { get; set; } = null!;

        public string ExpiryDate { get; set; } = null!;

        public string Cvv { get; set; } = null!;
    }
}
