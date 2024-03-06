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

        public override async Task<Model.UserTicket> Insert(UserTicketInsertRequest insert)
        {
           var userTicket = new UserTicket();
           _mapper.Map(insert, userTicket);
           await  _context.AddAsync(userTicket);
           _context.SaveChanges();

            return _mapper.Map<Model.UserTicket>(userTicket);
        }

        //public override Task<Model.UserTicket> Update(int id, UserTicketUpdateRequest update)
        //{
        //    var entity = _context.UserTicket.Find(id);

        //    _mapper.Map(update, entity);

        //    _context.SaveChanges();

        //    return _mapper.Map<Model.UserTicket>(entity);
        //}

        public async Task<List<Model.UserTicket>> GetByUserId(UserTicketSearchObject searchObject, CancellationToken cancellationToken) 
        {
        
            var userTickets = await _context.UserTicket.Include(x=>x.Ticket).ThenInclude(x=>x.Event).Where( x=> 
                (searchObject.UserID == null || searchObject.UserID==x.UserId)).ToListAsync(cancellationToken);

            return _mapper.Map<List<Model.UserTicket>>(userTickets);

        }
    }
}

 