using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using dogadjaj_ba.Services.Database;

namespace dogadjaj_ba.Services.EventiStateMachine
{
    public class ActiveEventState : BaseState
    {
        public ActiveEventState(IServiceProvider serviceProvider,Ib190074DogadjaBaContext context, IMapper mapper) : base(serviceProvider, context, mapper)
        {
        }

        public override async Task<Model.Event> Hide(int id)
        {
            var set = _context.Set<Database.Event>();

            var entity = await set.FindAsync(id);

            entity.StateMachine = "draft";

            await _context.SaveChangesAsync();
            return _mapper.Map<Model.Event>(entity);
        }

        public override async Task<List<string>> AllowedActions()
        {
            var list = await base.AllowedActions();
            list.Add("Hide");
          
            return list;
        }

    }
}
