using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Services.Database;
using Microsoft.Extensions.DependencyInjection;

namespace dogadjaj_ba.Services.EventiStateMachine
{
    public class BaseState
    {
        protected Ib190074DogadjaBaContext _context;

        protected IMapper _mapper;

        public IServiceProvider _serviceProvider { get; set; }
        public BaseState(IServiceProvider serviceProvider,Ib190074DogadjaBaContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
            _serviceProvider = serviceProvider;
        }

        public virtual Task<Model.Event> Insert(EventInsertRequest request)
        {
            throw new Exception("NOT ALLOWED");
        }

        public virtual Task<Model.Event> Update(int id,EventUpdateRequest request)
        {
            throw new UserException("NOT ALLOWED");
        }
        public virtual Task<Model.Event> Activate(int id)
        {
            throw new UserException("NOT ALLOWED");
        }
        public virtual Task<Model.Event> Hide(int id)
        {
            throw new UserException("NOT ALLOWED");
        }
        public virtual Task<Model.Event> Delete(int id)
        {
            throw new UserException("NOT ALLOWED");
        }
        public  BaseState CreateState(string statename)
        {
            
            switch (statename)
            {
                case "initial":
                    case null:
                    return _serviceProvider.GetService<InitialEventState>();
                    break;
                case "draft":
                    return _serviceProvider.GetService<DraftEventState>();
                    break;
                case "active":
                    return _serviceProvider.GetService<ActiveEventState>();
                    break;
                default: 
                    throw new UserException("Not supported");
            }
        }

        public virtual async Task<List<string>> AllowedActions()
        {
            return new List<string>();
        }
    }
}
