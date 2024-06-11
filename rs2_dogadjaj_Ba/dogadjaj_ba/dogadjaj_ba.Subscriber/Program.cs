// See https://aka.ms/new-console-template for more information
using System.Text;
using dogadjaj_ba.Model;
using EasyNetQ;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

Console.WriteLine("Hello, World!");


//var factory = new ConnectionFactory { HostName = "localhost" };
//using var connection = factory.CreateConnection();
//using var channel = connection.CreateModel();

//channel.QueueDeclare(queue: "event_added",
//    durable: false,
//    exclusive: false,
//    autoDelete: false,
//    arguments: null

//    );

//Console.WriteLine("Waiting for message");

//var consumer = new EventingBasicConsumer(channel);

//consumer.Received += (model, ea) =>
//{
//    var body = ea.Body.ToArray();
//    var message = Encoding.UTF8.GetString(body);
//    Console.WriteLine($"Reecieved {message}");
//};

//channel.BasicConsume(queue: "event_added",
//    autoAck: true,
//    consumer: consumer);

//Console.WriteLine("Press enter to exit");
//Console.ReadLine();

using (var bus = RabbitHutch.CreateBus("host=localhost"))
{
    bus.PubSub.Subscribe<Event>("test", HandleTextMessage);
    Console.WriteLine("Slusam");
    Console.ReadLine();
}

void HandleTextMessage(Event entity)
{
    Console.WriteLine($"Recieved {entity.EventId}");
}