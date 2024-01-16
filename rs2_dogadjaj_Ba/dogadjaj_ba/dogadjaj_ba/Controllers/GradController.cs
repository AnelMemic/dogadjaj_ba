using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using dogadjaj_ba.Services.Database;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class GradController : BaseCRUDController<Model.Grad, GradSearchObject, GradInsertRequest, Model.Requests.GradUpdateRequest>
    {
        public GradController(ILogger<BaseController<Model.Grad, GradSearchObject>> logger, IGradService service) : base(logger, service)
        {

        }
    }
}
