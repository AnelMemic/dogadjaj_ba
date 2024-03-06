using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using EasyNetQ.Logging;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.Extensions.Logging;
using ServiceStack;
using EasyNetQLogging = EasyNetQ.Logging.ILogger<dogadjaj_ba.Controllers.NotificationController>;
using MicrosoftLogging = Microsoft.Extensions.Logging.ILogger<dogadjaj_ba.Controllers.NotificationController>;
namespace dogadjaj_ba.Controllers
{
    [ApiController]
    public class NotificationController : BaseCRUDController<Model.Notification, NotificationsSearchObject, NotificationInsertRequest, NotificationUpdateRequest>
    {

        // In Memory db
        public static List<Notification> _notifications = new();

        public NotificationController(MicrosoftLogging logger, INotificationService service)
            : base(logger, service)
        {
        }


        [HttpGet("GetAllNotifications")]
        public async Task<IActionResult> GetAllNotifications([FromQuery] NotificationsSearchObject searchObject, CancellationToken cancellationToken)
        {
            try
            {
                var dto = await (_service as INotificationService).GetAllNotificationsAsync(searchObject, cancellationToken);
                return Ok(dto);
            }
            catch (Exception e)
            {

                return BadRequest(e);
            }
        }

        [HttpPut("SetNotificationsAsSeen")]
        public async Task<IActionResult> SetNotificaationAsSeen(int id, CancellationToken cancellationToken)
        {
            try
            {
                var message = await (_service as INotificationService).SetNotificationsAsSeenAsMessageAsync(id, cancellationToken);
                return Ok(message);
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("SetNotificationAsDeleted")]
        public async Task<IActionResult> SetNotificaationAsDeleted(int id, CancellationToken cancellationToken)
        {
            try
            {
                var message = await (_service as INotificationService).SetNotificationAsDeleted(id, cancellationToken);
                return Ok(message);
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }



    }


}
