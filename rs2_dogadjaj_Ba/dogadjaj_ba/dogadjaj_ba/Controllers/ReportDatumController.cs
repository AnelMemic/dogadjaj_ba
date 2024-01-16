using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ReportDatumController : BaseCRUDController<Model.ReportDatum, ReportDatumSearchObject, ReportDatumInsertRequest, Model.Requests.ReportDatumInsertRequest>
    {
        public ReportDatumController(ILogger<BaseController<ReportDatum, ReportDatumSearchObject>> logger, IReportDatumServices service) : base(logger, service)
        {
        }
    }
}
