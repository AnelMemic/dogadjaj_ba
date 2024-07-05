using dogadjaj_ba.Controllers;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;

namespace dogadjaj_ba.Controllers
{
    public class DrzavaController : BaseCRUDController<Model.Country, CountrySearchObject, CuntryInsertRequest, CountryUpdateRequest>
    {
        public DrzavaController(ILogger<BaseController<Model.Country, CountrySearchObject>> logger, ICountryService service) : base(logger, service)
        {
        }
    }
}
