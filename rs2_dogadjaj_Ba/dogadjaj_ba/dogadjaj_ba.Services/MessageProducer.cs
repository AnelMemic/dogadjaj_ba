using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public class MessageProducer : IMessageProducer
    {
        public void SenndingMessage<T>(T message)
        {
            var factory = new ConnectionFactory() 
            {
                HostName = "localhost",
                UserName = "guest",
                Password = "guest",  
                VirtualHost = "/",
            };

            var connection = factory.CreateConnection();

            using var channel = connection.CreateModel();

            channel.QueueDeclare("notifications", durable: true, exclusive: true);

            var jsonString = JsonSerializer.Serialize(message);
            var body = Encoding.UTF8.GetBytes(jsonString);

            channel.BasicPublish("", "notifications", body: body);

        }
    }
}
