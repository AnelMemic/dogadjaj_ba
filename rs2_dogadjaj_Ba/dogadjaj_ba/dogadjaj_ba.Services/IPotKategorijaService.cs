using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface IPotKategorijaService : ICRUDServices<Model.PotKategorija, Model.SearchObjects.PotKategorijaSearchObject, Model.Requests.PotKategorijaInsertRequest, Model.Requests.PotKategorijaUpdateRequest>
    {
    }
}
