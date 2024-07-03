using AutoMapper;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;


namespace dogadjaj_ba.Services
{
    public class PostService : BaseCRUDService<Model.Post, Database.Post, BaseSearchObject, PostInsertRequest, PostUpdateRequest>, IPostService
    {
        public PostService(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
