using RabbitMQ.Client;
using System.Text.Json;
using System.Text;
using RabbitMQ.Client.Events;
using Microsoft.AspNetCore.Authentication;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


//var factory = new ConnectionFactory()
//{
//    HostName = "localhost",
//    UserName = "guest",
//    Password = "guest",
//    VirtualHost = "/",
//};

//var connection = factory.CreateConnection();

//using var channel = connection.CreateModel();

//channel.QueueDeclare("notifications", durable: true, exclusive: true);

//var consumer = new EventingBasicConsumer(channel);

//consumer.Received += (model, args) => {

//    //getting byt[[]
//    var body= args.Body.ToArray();

//    var message = Encoding.UTF8.GetString(body);

//    Console.WriteLine(message);


//};

//channel.BasicConsume("notifications", true, consumer);


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
