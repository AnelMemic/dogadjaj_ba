namespace dogadjaj_ba.Services
{
    public interface ICountryService : ICRUDServices<Model.Country, Model.SearchObjects.CountrySearchObject, Model.Requests.CuntryInsertRequest, Model.Requests.CountryUpdateRequest>
    {
    }
}

