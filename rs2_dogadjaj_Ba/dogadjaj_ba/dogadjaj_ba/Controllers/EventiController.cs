using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EventiController : BaseCRUDController<Model.Event,EventiSearchObject,EventInsertRequest,Model.Requests.EventUpdateRequest>
    {
        private readonly IEventRecommendationService _eventRecommendationService;
        public EventiController(ILogger<BaseController<Model.Event, EventiSearchObject>> logger,IEventiService service, IEventRecommendationService eventRecommendationService) : base(logger,service)
        {
            _eventRecommendationService = eventRecommendationService;
        }
        [HttpPut("{id}/activate")]
        public virtual async Task<Model.Event> Activate(int id)
        {
            return await (_service as IEventiService).Activate(id);
        }
        [HttpPut("{id}/hide")]
        public virtual async Task<Model.Event> Hide(int id)
        {
            return await (_service as IEventiService).Hide(id);
        }


        [HttpGet("{id}/allowedActions")]
        public virtual async Task<List<string>> AllowedActions(int id)
        {
            return await (_service as IEventiService).AllowedActions(id);
        }

        [HttpGet("getEvents")]
        public  async Task<List<Event>> GetEvents([FromQuery] EventiSearchObject search)
        {
            return await (_service as IEventiService).GetFiltered(search);
        }
        [HttpGet("recommend")]
        public List<Event> Recommend()
        {
            return _eventRecommendationService.GetRecommendedEvents();
        }

    }
}