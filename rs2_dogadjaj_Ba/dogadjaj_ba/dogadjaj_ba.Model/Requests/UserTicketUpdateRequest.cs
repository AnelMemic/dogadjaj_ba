﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class UserTicketUpdateRequest
    {
        public int UserId { get; set; }
        public int TicketId { get; set; }
    }
}