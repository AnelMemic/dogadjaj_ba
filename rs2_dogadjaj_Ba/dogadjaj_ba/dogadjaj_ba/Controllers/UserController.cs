using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using dogadjaj_ba.Services.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Logging;
using System.Threading;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : BaseCRUDController<Model.Users, Model.SearchObjects.UserSearchObject,Model.Requests.UsersInsertRequest,Model.Requests.UsersUpdateRequest>
    {
      
        public UserController(ILogger<BaseController<Model.Users, Model.SearchObjects.UserSearchObject>> logger, IUserService service):
            base(logger,service)
        {
            
        }
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginSearchRequest searchObject)
        {
                var response = await (_service as IUserService).Login(searchObject.username, searchObject.password);
                return Ok(response);
            //return await (_service as IEventiService).AllowedActions(id);

        }

        [HttpGet("getRecommendedEvents")]
        public async Task<List<Model.Event>> getRecommendedEvents(int userID)
        {

            return await (_service as IUserService).Recommend(userID);

        }

        //[HttpGet()]
        //public async Task<IEnumerable<Model.Users>> Get()
        //{
        //    return await _service.Get();
        //}
        //[HttpPost()]
        //public Model.Users Insert(UsersInsertRequest request)
        //{
        //    return _service.Insert(request);    
        //}

        //[HttpPut("{id}")]
        //public Model.Users Update(int id,UsersInsertRequest request)
        //{
        //    return _service.Update(id,request);
        //}
    }
}
