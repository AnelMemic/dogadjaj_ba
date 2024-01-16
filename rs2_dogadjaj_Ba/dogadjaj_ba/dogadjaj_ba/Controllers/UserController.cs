using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using dogadjaj_ba.Services.Database;
using Microsoft.AspNetCore.Mvc;
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
