namespace dogadjaj_ba.Services
{
    public interface IPostService : ICRUDServices<Model.Post, Model.SearchObjects.BaseSearchObject, Model.Requests.PostInsertRequest, Model.Requests.PostUpdateRequest>
    {
    }
}

