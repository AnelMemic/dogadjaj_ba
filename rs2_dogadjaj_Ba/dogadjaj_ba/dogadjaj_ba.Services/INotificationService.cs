using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Extensions;
using dogadjaj_ba.Model.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface INotificationService : ICRUDServices<Model.Notification, Model.SearchObjects.NotificationsSearchObject, Model.Requests.NotificationInsertRequest, Model.Requests.NotificationUpdateRequest>
    {
        Task<List<Notification>> GetAllNotificationsAsync(NotificationsSearchObject searchObject, CancellationToken cancellationToken = default);
        Task<Message> SetNotificationAsDeleted(int id, CancellationToken cancellationToken);
        Task<Message> SetNotificationsAsSeenAsMessageAsync(int userId, CancellationToken cancellationToken);

    }
}
