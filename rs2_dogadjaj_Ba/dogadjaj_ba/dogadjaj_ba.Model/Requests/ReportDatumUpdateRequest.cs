﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Requests
{
    public class ReportDatumUpdateRequest
    {
      //  public int ReportDataId { get; set; }

        public int? UserId { get; set; }

        public int? EventId { get; set; }
    }
}
