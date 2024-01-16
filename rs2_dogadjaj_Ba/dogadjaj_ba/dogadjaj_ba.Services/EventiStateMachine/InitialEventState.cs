using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;

namespace dogadjaj_ba.Services.EventiStateMachine
{
    public  class InitialEventState : BaseState
    {
        public InitialEventState(IServiceProvider serviceProvider,Database.Ib190074DogadjaBaContext context, IMapper mapper) : base(serviceProvider, context, mapper)
        {
        }

        public override async Task<Event> Insert(EventInsertRequest request)
        {
            var set = _context.Set<Database.Event>();
            var entity = _mapper.Map<Database.Event>(request);
            entity.StateMachine = "draft";
            set.Add(entity);
            await _context.SaveChangesAsync();
            return _mapper.Map<Event>(entity);
        }
        public override async  Task<List<string>> AllowedActions()
        {
            var list =  await base.AllowedActions();
            list.Add("Insert");
            return list;
        }
    }
}
