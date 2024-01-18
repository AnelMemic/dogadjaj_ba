using AutoMapper;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using dogadjaj_ba.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public class UserTicketService : BaseCRUDService<Model.UserTicket, Database.UserTicket, UserTicketSearchObject, UserTicketInsertRequest, UserTicketUpdateRequest>, IUserTicketService
    {
        public UserTicketService(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}

