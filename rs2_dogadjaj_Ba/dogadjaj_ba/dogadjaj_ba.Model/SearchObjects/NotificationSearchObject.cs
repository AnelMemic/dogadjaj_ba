﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.SearchObjects
{
    public class NotificationsSearchObject : BaseSearchObject
    {
        public string? content { get; set; }
        public long? userId { get; set; }
        public bool? seen { get; set; }



    }
}
