using dogadjajPomocno.Requests;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RabbitMQ.Client;
using System.Text;

namespace dogadjajPomocno.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class NotificationController : ControllerBase
    {
        private readonly RabbitMQConfig _config;

        public NotificationController(IOptions<RabbitMQConfig> config)
        {
            _config = config.Value;
        }

        [HttpPost("SendNotification")]
        public async Task<IActionResult> SendNotification(NotificationUpsertDto notification)
        {
            if (notification == null)
                return BadRequest("Cannot send null object");

            if (notification.Id < 0)
                return BadRequest("Id must be 0");

            if (notification.UserId <= 0)
                return BadRequest("UserId must be greater than 0");

            var factory = new ConnectionFactory
            {
                HostName = _config.HostName,
                UserName = _config.UserName,
                Password = _config.Password,
                VirtualHost = _config.VirtualHost,
            };

            using var connection = factory.CreateConnection();
            using var channel = connection.CreateModel();

            channel.QueueDeclare(queue: "notification",
                                 durable: false,
                                 exclusive: false,
                                 autoDelete: true,
                                 arguments: null);

            var json = JsonConvert.SerializeObject(notification);
            var body = Encoding.UTF8.GetBytes(json);

            channel.BasicPublish(exchange: string.Empty,
                                 routingKey: "notification",
                                 body: body);

            return Ok(notification);
        }
    }
}
