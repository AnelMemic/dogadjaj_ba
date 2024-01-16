using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dogadjaj_ba.Model;

namespace dogadjaj_ba.Services
{
    public  interface IGradService : ICRUDServices<Model.Grad, Model.SearchObjects.GradSearchObject, Model.Requests.GradInsertRequest, Model.Requests.GradUpdateRequest>
    {
    }
}
