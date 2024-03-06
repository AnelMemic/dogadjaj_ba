using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface IUserTicketService : ICRUDServices<Model.UserTicket,Model.SearchObjects.UserTicketSearchObject, Model.Requests.UserTicketInsertRequest, Model.Requests.UserTicketUpdateRequest>
    {
        Task<List<Model.UserTicket>> GetByUserId(UserTicketSearchObject searchObject , CancellationToken cancellationToken);
    }
}
