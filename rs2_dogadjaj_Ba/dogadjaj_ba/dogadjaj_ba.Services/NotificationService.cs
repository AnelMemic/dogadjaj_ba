using AutoMapper;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using dogadjaj_ba.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dogadjaj_ba.Model;
using Microsoft.EntityFrameworkCore;
using dogadjaj_ba.Model.Extensions;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace dogadjaj_ba.Services
{
    public class NotificationService : BaseCRUDService<Model.Notification, Database.Notiffication, NotificationsSearchObject, NotificationInsertRequest, NotificationUpdateRequest>, INotificationService
    {
        public NotificationService(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
        }

        public async Task<List<Notification>> GetAllNotificationsAsync(NotificationsSearchObject searchObject, CancellationToken cancellationToken = default)
        {
            var notifications = await _context.Notiffications.Where(n => (searchObject.seen == null || n.Read == searchObject.seen)
                 && (searchObject.userId == null || n.UserId == searchObject.userId)
                 && (searchObject.content == null || n.Content.ToLower().Contains(searchObject.content.ToLower())))
                .ToListAsync(cancellationToken);

            return _mapper.Map<List<Notification>>(notifications);
        }

       

        public async Task<List<Notification>> GetAllByUserId(int id, CancellationToken cancellationToken = default)
        {
          var notifications =  await  _context.Notiffications.Where(x => x.UserId == id).ToListAsync(cancellationToken);

            return _mapper.Map<List<Notification>>(notifications);
        }


        public async Task<Message> SetNotificationsAsSeenAsMessageAsync(int userId, CancellationToken cancellationToken)
        {


            var notifications = await _context.Notiffications.Where(x => x.UserId == userId).ToListAsync(cancellationToken);

            {
                try
                {
                    foreach (var notification in notifications)
                    {
                        notification.Read = true;
                        notification.DateRead = DateTime.Now;
                        notification.Deleted = false;

                        await _context.SaveChangesAsync();

                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                return new Message
                {
                    Info = "Notifications seen!",
                    IsValid = true,
                };
            }
        }

        public async Task<Message> SetNotificationAsDeleted(int id, CancellationToken cancellationToken)
        {
            var notification = await _context.Notiffications.Where(x=>x.Id == id).FirstOrDefaultAsync(cancellationToken);

            var entity = await  _context.Notiffications.FindAsync(id);
            try
            {
                //Seen se koristi kako datum brisanja
                if (notification != null)
                {
                    notification.Deleted = true;

                    

                    _mapper.Map(notification, entity);

                    await _context.SaveChangesAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return new Message
            {
                Info = "Notification set as deleted!",
                IsValid = true,
            };
        }

        //public async Task<List<Model.Event>> GetFiltered(EventiSearchObject? search = null)
        //{
        //    var events = await _context.Events
        //        .Where(e => (search.kategorija == null || search.kategorija == 0 || e.eventType == search.kategorija)
        //                 && (search.PodKategorija == null || search.PodKategorija == 0 || e.subType == search.PodKategorija))
        //        .ToListAsync();

        //    return _mapper.Map<List<Model.Event>>(events);
        //}
    }
}
