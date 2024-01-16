using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LokacijaController : BaseCRUDController<Model.Lokacija, LokacijaSearchObject, LokacijaInsertRequest, Model.Requests.LokacijaUpdateRequest>
    {
        public LokacijaController(ILogger<BaseController<Lokacija, LokacijaSearchObject>> logger, ILokacijaService service) : base(logger, service)
        {
        }
    }
}
