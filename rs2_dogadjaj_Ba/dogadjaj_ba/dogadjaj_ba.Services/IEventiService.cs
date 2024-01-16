using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;

namespace dogadjaj_ba.Services
{
    public interface IEventiService : ICRUDServices<Model.Event,EventiSearchObject,EventInsertRequest,EventUpdateRequest>
    {
        Task<Event> Activate(int id);
        Task<Event> Hide(int id);

        Task<List<string>> AllowedActions(int id);
    }
}
