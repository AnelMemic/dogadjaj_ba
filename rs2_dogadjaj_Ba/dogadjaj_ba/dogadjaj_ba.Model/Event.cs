﻿using dogadjaj_ba.Model.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model
{
    public class Event
    {
        public int EventId { get; set; }

        public string EventName { get; set; } = null!;

        public int? LokacijaId { get; set; }

        public DateTime EventDate { get; set; }
        public TypeEvent eventType { get; set; }
        public SubtypeOfEventType subType { get; set; }
        public string? Opis { get; set; }

        public string? StateMachine { get; set; }
        public byte[]? EventImage { get; set; } = null;

    }
}
