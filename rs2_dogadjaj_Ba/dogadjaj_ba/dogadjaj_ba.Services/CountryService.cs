using AutoMapper;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;


namespace dogadjaj_ba.Services
{
    public class CountryService : BaseCRUDService<Model.Country, Database.Country, CountrySearchObject, CuntryInsertRequest, CountryUpdateRequest>, ICountryService
    {
        public CountryService(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}


