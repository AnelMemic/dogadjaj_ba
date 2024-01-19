using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using dogadjaj_ba.Services.EventiStateMachine;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics.Internal;
using Microsoft.Identity.Client;
using Microsoft.IdentityModel.Tokens;
using ServiceStack;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace dogadjaj_ba.Services
{
    public class EventiService : BaseCRUDService<Model.Event, Database.Event,EventiSearchObject,EventInsertRequest,EventUpdateRequest>, IEventiService
    {
       // DogadjajBaContext _context;
       public BaseState _baseState{ get; set; }
        public EventiService(BaseState baseState, Ib190074DogadjaBaContext context, IMapper mapper) :base(context,mapper) {
            _baseState = baseState;
        }

        public override Task<Model.Event> Insert(EventInsertRequest insert)
        {
            var state = _baseState.CreateState("initial");
            return state.Insert(insert);
        }


        public override async Task<Model.Event> Update(int id, EventUpdateRequest update)
        {
            var entity = await _context.Events.FindAsync(id);
            var state = _baseState.CreateState(entity.StateMachine);

          

            return await state.Update(id,update);
        }

        public async Task<Model.Event> Activate(int id)
        {
            var entity = await _context.Events.FindAsync(id);
            var state = _baseState.CreateState(entity.StateMachine);



            return await state.Activate(id);
        }

        public async Task<Model.Event> Hide(int id)
        {
            var entity = await _context.Events.FindAsync(id);
            var state = _baseState.CreateState(entity.StateMachine);



            return await state.Hide(id);
        }

        public async Task<List<string>> AllowedActions(int id)
        {
            var entity = await _context.Events.FindAsync(id);
            var state = _baseState.CreateState(entity?.StateMachine ?? "initial");
            return await state.AllowedActions();

        }
      
        //public override async IQueryable<Model.Event> AddFilter(IQueryable<Model.Event> query, EventiSearchObject ? search)
        //{
        //    var filteredQuery = await base.GetById(search.id);
              
        //    return filteredQuery;
        //}

        public override Task<List<Model.Event>> Get(EventiSearchObject? search = null)
        {
            return base.Get(search);
        }
    }
}
