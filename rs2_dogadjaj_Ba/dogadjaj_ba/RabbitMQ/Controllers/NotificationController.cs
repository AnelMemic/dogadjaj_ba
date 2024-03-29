﻿using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using RabbitMQ.Client;
using RabbitMQ.Requests;
using System.Text;

namespace RabbitMQ.Controllers
{
    public class NotificationController : ControllerBase
    {
        private readonly string hostname = Environment.GetEnvironmentVariable("RABBITMQ_HOST") ?? "rabbitMQ";
        private readonly string username = Environment.GetEnvironmentVariable("RABBITMQ_USERNAME") ?? "guest";
        private readonly string password = Environment.GetEnvironmentVariable("RABBITMQ_PASSWORD") ?? "guest";
        private readonly string virtualHost = Environment.GetEnvironmentVariable("RABBITMQ_VIRTUALHOST") ?? "/";


        [HttpPost("SendNotification")]
        public async Task<IActionResult> SendNotification(NotificationUpsertDto notification)
        {
            if (notification == null)
                return BadRequest("Cann't send null object");

            if (notification.Id > 0 && notification.Id < 0)
                return BadRequest("Id must be 0");

            if (notification.UserId <= 0)
                return BadRequest("UserId must be greater than 0");



            var factory = new ConnectionFactory
            {
                HostName = "localhost",
                UserName = username,
                Password = password,
                VirtualHost = virtualHost,
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
