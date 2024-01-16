using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Azure.Core;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using Microsoft.EntityFrameworkCore;

namespace dogadjaj_ba.Services
{
    public class  UserService : BaseCRUDService<Model.Users, Database.User, UserSearchObject, UsersInsertRequest,UsersUpdateRequest>, IUserService
    {
        //Ib190074DogadjaBaContext _context;
        //public IMapper _mapper { get; set; }

        public UserService(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper) { }
        
       
        public override async Task<Model.Users> Insert(UsersInsertRequest insert)
        {
            var korisnik = new User();
            _mapper.Map(insert, korisnik);
            _context.Users.Add(korisnik);
            _context.SaveChanges();

            return _mapper.Map<Model.Users>(korisnik);
        }
        public override async Task<Model.Users> Update(int id, UsersUpdateRequest insert)
        {
            var entity = _context.Users.Find(id);

            _mapper.Map(insert, entity);

            _context.SaveChanges();

            return _mapper.Map<Model.Users>(entity);
        }
        


        public override async Task BeforeInsert(User entity, UsersInsertRequest insert)
        {
           
        }

        public async Task<Model.Users> GetUserById(string userId)
        {
            if (!int.TryParse(userId, out var numericUserId))
            {
                // Handle the case where the userId is not a valid integer
                return null;
            }

            // Implement the logic to retrieve a user by ID from your database
            // For example, using Entity Framework Core:
            var user = await _context.Users.FindAsync(numericUserId);
            return _mapper.Map<Model.Users>(user);
        }
        public async  Task<List<Model.Users>> Get()
        {
            var entitylist = await _context.Users.ToListAsync();
            return _mapper.Map<List<Model.Users>>(entitylist);
        }
      
        public async Task<Model.Users> Login(string username, string password)
        {
            var entity = await _context.Users.FirstOrDefaultAsync(x=> x.KorisnickoIme == username);

            if (entity == null)
                return null;

            if (entity.Sifra != password)
            { return null; }
            else
                return _mapper.Map<Model.Users>(entity);
            
            
        }
    }
}
