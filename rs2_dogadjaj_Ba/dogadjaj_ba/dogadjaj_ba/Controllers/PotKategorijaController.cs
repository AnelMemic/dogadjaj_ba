using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PotKategorijaController : BaseCRUDController<Model.PotKategorija, PotKategorijaSearchObject, PotKategorijaInsertRequest, Model.Requests.PotKategorijaUpdateRequest>
    {
        public PotKategorijaController(ILogger<BaseController<PotKategorija, PotKategorijaSearchObject>> logger, IPotKategorijaService service) : base(logger, service)
        {
        }
    }
}
