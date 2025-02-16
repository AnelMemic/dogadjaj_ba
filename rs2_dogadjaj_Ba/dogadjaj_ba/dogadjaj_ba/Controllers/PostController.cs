using dogadjaj_ba.Controllers;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;
using ServiceStack;

namespace dogadjaj_ba.Controllers
{
    public class PostController : BaseCRUDController<Model.Post, BaseSearchObject, PostInsertRequest, PostUpdateRequest>
    {
        private readonly IPostService _postService;
        public PostController(ILogger<BaseController<Model.Post, BaseSearchObject>> logger, IPostService service) : base(logger, service)
        {
            _postService = service;
        }
        [HttpPut("{id}")]
        public override async Task<Post> Update(int id, [FromBody] PostUpdateRequest request)
        {
            return await _postService.Update(id, request);
        }
    }
}

