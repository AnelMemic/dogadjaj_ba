using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface ITicketService : ICRUDServices<Model.Ticket, Model.SearchObjects.TicketSearchObject, Model.Requests.TicketInsertRequest, Model.Requests.TicketUpdateRequest>
    {
         Task<List<Ticket>> GetTicketsPagedAsync(TicketSearchObject searchObject, CancellationToken cancellationToken = default);
        Task<List<Ticket>> GetTicketsByEventId(int id, CancellationToken cancellationToken);
    }
}
