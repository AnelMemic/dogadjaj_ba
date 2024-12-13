using System;
using System.Collections.Generic;
using System.Data;
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
           
            var hashedPassword = PasswordHelper.HashPasswordSimple(insert.Sifra);

            var korisnik = new User
            {
                KorisnickoIme = insert.KorisnickoIme,
                ImePrezime = insert.ImePrezime,
                Email = insert.Email,
                Sifra = hashedPassword 
            };

            _context.Users.Add(korisnik);
            await _context.SaveChangesAsync();

            return _mapper.Map<Model.Users>(korisnik);
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

        //public async Task<List<Model.Event>> Recommend(int userId)
        //{
        //    //var events = new List<Model.Event>();

        //    var logedUser = await _context.Users.FindAsync(userId);

        //    var users = await _context.Users.Include(x=> x.Tickets).ToListAsync();

        //    var events = await _context.Events.Include(x=> x.Tickets).ToListAsync();






        //    return _mapper.Map<List<Model.Event>>(events);
        //}

        public async Task<Model.Users> Login(string username, string password)
        {
            
            var entity = await _context.Users.FirstOrDefaultAsync(x => x.KorisnickoIme == username);

            if (entity == null)
            {
                return null; 
            }

            var hashedPassword = PasswordHelper.HashPasswordSimple(password);
            if (entity.Sifra != hashedPassword)
            {
                return null; 
            }

          
            return _mapper.Map<Model.Users>(entity);
        }
        public async Task<List<Model.Event>> Recommend(int userId)
        {
            // Step 1: Fetch user's purchased events
            var userEvents = await GetUserPurchasedEvents(userId);

            if (!userEvents.Any())
                return new List<Model.Event>();

            // Step 2: Find similar events for each user event
            var similarEvents = new List<Model.Event>();
            foreach (var userEvent in userEvents)
            {
                var events = await GetSimilarEvents(userEvent);
                similarEvents.AddRange(events);
            }

            // Remove duplicates
            similarEvents = similarEvents.Distinct().ToList();

            // Step 3: Rank similar events by popularity
            var recommendedEvents = await GetPopularEvents(similarEvents);

            if(recommendedEvents.Count > 2) {
                var response = recommendedEvents.Take(2).ToList();

                return _mapper.Map<List<Model.Event>>(response);
            }
            
            // Map and return the recommended events
            return _mapper.Map<List<Model.Event>>(recommendedEvents);
        }
        private async Task<List<Model.Event>> GetUserPurchasedEvents(int userId)
        {
            var tickets = await _context.Tickets
                .Include(t => t.Event)
                .Where(t => t.UserId == userId)
                .ToListAsync();

            var ticketsToReturn =  tickets.Select(t => t.Event).ToList();

            return _mapper.Map<List<Model.Event>>(ticketsToReturn);
        }

        private async Task<List<Model.Event>> GetSimilarEvents(Model.Event referenceEvent)
        {
          var events = await _context.Events
                .Where(e =>
                    e.EventId != referenceEvent.EventId && 
                    e.eventType == referenceEvent.eventType && 
                    e.subType == referenceEvent.subType && 
                    e.LokacijaId == referenceEvent.LokacijaId) 
                .ToListAsync();

            return _mapper.Map<List<Model.Event>>(events);
        }

        private async Task<List<Model.Event>> GetPopularEvents(List<Model.Event> similarEvents)
        {
            var similarEventIds = similarEvents.Select(e => e.EventId).ToList();

            var popularEvents = await _context.Tickets
                .Where(t => similarEventIds.Contains(t.EventId))
                .GroupBy(t => t.Event)
                .OrderByDescending(g => g.Count())
                .Select(g => g.Key)
                .ToListAsync();

            return _mapper.Map<List<Model.Event>>(popularEvents);
        }


        //public async Task<List<Model.Event>> Recommend(int userId)
        //{
        //    // Step 1: Fetch user's purchased events
        //    var userEvents = await GetUserPurchasedEvents(userId);

        //    if (!userEvents.Any())
        //        return new List<Model.Event>();

        //    // Step 2: Find similar events for each user event
        //    var similarEvents = new List<Model.Event>();
        //    foreach (var userEvent in userEvents)
        //    {
        //        var events = await GetSimilarEvents(userEvent);
        //        similarEvents.AddRange(events);
        //    }

        //    // Remove duplicates
        //    similarEvents = similarEvents.Distinct().ToList();

        //    // Step 3: Rank similar events by popularity
        //    var recommendedEvents = await GetPopularEvents(similarEvents);

        //    // Map and return the recommended events
        //    return _mapper.Map<List<Model.Event>>(recommendedEvents);
        //}
    }
}
