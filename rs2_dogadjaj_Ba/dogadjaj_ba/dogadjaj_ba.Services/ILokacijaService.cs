using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface ILokacijaService : ICRUDServices<Model.Lokacija, Model.SearchObjects.LokacijaSearchObject, Model.Requests.LokacijaInsertRequest, Model.Requests.LokacijaUpdateRequest>
    {
    }
}
