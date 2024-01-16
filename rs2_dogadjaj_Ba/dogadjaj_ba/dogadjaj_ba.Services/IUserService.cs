using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;

namespace dogadjaj_ba.Services
{
    public interface IUserService : ICRUDServices<Model.Users, Model.SearchObjects.UserSearchObject,Model.Requests.UsersInsertRequest,Model.Requests.UsersUpdateRequest>
    {
        Task<Model.Users> GetUserById(string username);
        public Task<Model.Users> Login(string username, string password);

        //Task<List<Model.Users>> Get();
        //Model.Users Insert(UsersInsertRequest request);
        //Model.Users Update(int id, UsersInsertRequest request);
    }
}
