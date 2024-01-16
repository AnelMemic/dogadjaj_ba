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
    public class TicketServices : BaseCRUDService<Model.Ticket, Database.Ticket, TicketSearchObject, TicketInsertRequest, TicketUpdateRequest>, ITicketService
    {
        public TicketServices(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
