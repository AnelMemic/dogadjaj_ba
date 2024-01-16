using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;

namespace dogadjaj_ba.Services
{
    public class ReservationService : BaseCRUDService<Model.Reservation, Database.Reservation, ReservationSearchObject, ReservationInsertRequest, ReservationUpdateRequest>, IReservationService
    {
        public ReservationService(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
