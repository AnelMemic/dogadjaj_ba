using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EventTypeController : BaseController<Model.EventType,BaseSearchObject>
    {
        public EventTypeController(ILogger<BaseController<Model.EventType,BaseSearchObject>> logger, IService<Model.EventType,BaseSearchObject> service):base(logger,service)
        {

        }
    }
}
