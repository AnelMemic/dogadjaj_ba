using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using dogadjaj_ba.Services.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Logging;
using System.Threading;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserTicketController : BaseCRUDController<Model.UserTicket, Model.SearchObjects.UserTicketSearchObject, Model.Requests.UserTicketInsertRequest, Model.Requests.UserTicketUpdateRequest>
    {

        public UserTicketController(ILogger<BaseController<Model.UserTicket, Model.SearchObjects.UserTicketSearchObject>> logger, IUserTicketService service) :
            base(logger, service)
        {

        }

    }
}
