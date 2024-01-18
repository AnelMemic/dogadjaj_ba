using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using dogadjaj_ba.Services.EventiStateMachine;
using Microsoft.EntityFrameworkCore;

namespace dogadjaj_ba.Services
{
    public class TicketServices : BaseCRUDService<Model.Ticket, Database.Ticket, TicketSearchObject, TicketInsertRequest, TicketUpdateRequest>, ITicketService
    {
        public TicketServices(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public async Task<List<Ticket>> GetTicketsPagedAsync(TicketSearchObject searchObject, CancellationToken cancellationToken = default)
        {
            var query = _context.Tickets
                .Where(u => (searchObject.UserId == null || u.UserId == searchObject.UserId)
                            && (searchObject.EventId == null || u.EventId == searchObject.EventId));


            return await query.ToListAsync(cancellationToken);
        }

        //Task<List<Model.Ticket>> ITicketService.GetTicketsPagedAsync(TicketSearchObject searchObject, CancellationToken cancellationToken)
        //{
        //    throw new NotImplementedException();
        //}
    }
}
