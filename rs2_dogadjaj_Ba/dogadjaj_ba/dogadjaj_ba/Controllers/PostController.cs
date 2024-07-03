using dogadjaj_ba.Controllers;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;
using ServiceStack;

namespace dogadjaj_ba.Controllers
{
    public class PostController : BaseCRUDController<Model.Post, BaseSearchObject, PostInsertRequest, PostUpdateRequest>
    {
        public PostController(ILogger<BaseController<Model.Post, BaseSearchObject>> logger, IPostService service) : base(logger, service)
        {
        }
    }
}

