using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface IReportDatumServices : ICRUDServices<Model.ReportDatum, Model.SearchObjects.ReportDatumSearchObject, Model.Requests.ReportDatumInsertRequest, Model.Requests.ReportDatumInsertRequest>
    {
    }
}
