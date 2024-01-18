using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TicketController : BaseCRUDController<Model.Ticket, TicketSearchObject, TicketInsertRequest, Model.Requests.TicketUpdateRequest>
    {
        public TicketController(ILogger<BaseController<Ticket, TicketSearchObject>> logger, ITicketService service) : base(logger, service)
        {
        }

        [HttpGet("getPaged")]
        public async Task<IActionResult> GetTicketsPagedAsync([FromQuery] TicketSearchObject searchObject, CancellationToken cancellationToken)
        {

            var dto = await (_service as ITicketService).GetTicketsPagedAsync(searchObject, cancellationToken);
            return Ok(dto);
        }
    }
}
