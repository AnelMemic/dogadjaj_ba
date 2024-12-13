using dogadjaj_ba;
using dogadjaj_ba.Filters;
using dogadjaj_ba.Services;
using dogadjaj_ba.Services.Database;
using dogadjaj_ba.Services.EventiStateMachine;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using RabbitMQ.Client.Events;
using RabbitMQ.Client;
using System.Text;
using dogadjaj_ba.Model.Requests;
using System.Text.Json;
using dogadjaj_ba.Model;
using Microsoft.Extensions.Options;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddTransient<IEventiService, EventiService>();
builder.Services.AddTransient<IUserService, UserService>();
builder.Services.AddTransient<BaseState>();
builder.Services.AddTransient<InitialEventState>();
builder.Services.AddTransient<ActiveEventState>();
builder.Services.AddTransient<DraftEventState>();
builder.Services.AddTransient<IGradService, GradServices>();
builder.Services.AddTransient<ILokacijaService, LokacijaService>();
builder.Services.AddTransient<IPaymentService, PaymentService>();
builder.Services.AddTransient<IReportDatumServices, ReportDatumServices>();
builder.Services.AddTransient<IReservationService, ReservationService>();
builder.Services.AddTransient<ITicketService, TicketServices>();
builder.Services.AddTransient<IUserTicketService, UserTicketService>();
builder.Services.AddTransient<INotificationService, NotificationService>();
builder.Services.AddTransient<IPostService, PostService>();



builder.Services.AddControllers(x =>
{
    x.Filters.Add<ErrorFilter>();
});


builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.AddSecurityDefinition("basicAuth", new OpenApiSecurityScheme()
    {
        Type = SecuritySchemeType.Http,
        Scheme = "Basic"
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "basicAuth" }
            },
            new string[] { }
        }
    });
});

builder.Services.AddDbContext<Ib190074DogadjaBaContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddAutoMapper(typeof(IUserService));

builder.Services.AddAuthentication("QueryStringAuthentication")
        .AddScheme<AuthenticationSchemeOptions, QueryStringAuthenticationHandler>("QueryStringAuthentication", null);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();
app.UseAuthentication();

app.MapControllers();


using (var scope = app.Services.CreateScope())
{
    var dataContext = scope.ServiceProvider.GetRequiredService<Ib190074DogadjaBaContext>();
    await dataContext.Database.MigrateAsync();
    dataContext.Database.EnsureCreated();
}


string hostname = Environment.GetEnvironmentVariable("RABBITMQ_HOST") ?? "localhost";
string username = Environment.GetEnvironmentVariable("RABBITMQ_USERNAME") ?? "guest";
string password = Environment.GetEnvironmentVariable("RABBITMQ_PASSWORD") ?? "guest";
string virtualHost = Environment.GetEnvironmentVariable("RABBITMQ_VIRTUALHOST") ?? "/";

var factory = new ConnectionFactory
{
    HostName = hostname,
    UserName = username,
    Password = password,
    VirtualHost = virtualHost,
};

Console.WriteLine("Povezivanje na RabbitMQ...");
Console.WriteLine($"Host: {factory.HostName}, User: {factory.UserName}");

using var connection = factory.CreateConnection();
using var channel = connection.CreateModel();


channel.QueueDeclare(queue: "notification",
                     durable: false,
                     exclusive: false,
                     autoDelete: true,
                     arguments: null);

Console.WriteLine(" [*] Waiting for messages.");

var consumer = new EventingBasicConsumer(channel);

consumer.Received += async (model, ea) =>
{
    var body = ea.Body.ToArray();
    var message = Encoding.UTF8.GetString(body);
    Console.WriteLine($"Primljena poruka: {message}"); 

    
    try
    {
        var notification = JsonSerializer.Deserialize<NotificationInsertRequest>(message);
        using (var scope = app.Services.CreateScope())
        {
            var notificationsService = scope.ServiceProvider.GetRequiredService<INotificationService>();
            if (notification != null)
            {
                await notificationsService.Insert(notification);
            }
        }
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Greška pri obradi poruke: {ex.Message}");
    }
};


channel.BasicConsume(queue: "notification",
                     autoAck: true,
                     consumer: consumer);

Console.WriteLine("Konzument povezan na queue.");

app.Run();