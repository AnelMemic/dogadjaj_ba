using dogadjaj_ba.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface IEventRecommendationService
    {
        List<Event> GetRecommendedEvents();
    }
}
