using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;

namespace dogadjaj_ba.Services
{
    public interface IPostService : ICRUDServices<Model.Post, Model.SearchObjects.BaseSearchObject, Model.Requests.PostInsertRequest, Model.Requests.PostUpdateRequest>
    {
        Task<Post> Update(int id, PostUpdateRequest request);
    }
}

