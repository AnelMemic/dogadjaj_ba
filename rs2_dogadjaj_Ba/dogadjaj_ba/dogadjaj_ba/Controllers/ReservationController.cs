using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ReservationController : BaseCRUDController<Model.Reservation, ReservationSearchObject, ReservationInsertRequest, Model.Requests.ReservationUpdateRequest>
    {
        public ReservationController(ILogger<BaseController<Reservation, ReservationSearchObject>> logger,IReservationService service) : base(logger, service)
        {
        }
    }
}
