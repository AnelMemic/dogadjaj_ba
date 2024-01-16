using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface IReservationService: ICRUDServices<Model.Reservation, Model.SearchObjects.ReservationSearchObject, Model.Requests.ReservationInsertRequest, Model.Requests.ReservationUpdateRequest>
    {
    }
}
