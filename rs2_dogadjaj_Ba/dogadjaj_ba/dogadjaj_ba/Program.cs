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



// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c => {
    c.AddSecurityDefinition("basicAuth", new Microsoft.OpenApi.Models.OpenApiSecurityScheme()
    {
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.Http,
        Scheme = "Basic"
    });

    c.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference{ Type = ReferenceType.SecurityScheme, Id ="basicAuth"}
            },
            new string[]{}
        }
    });
});

builder.Services.AddScoped<IMessageProducer, MessageProducer>();


var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<Ib190074DogadjaBaContext>(options =>
    options.UseSqlServer(connectionString));


builder.Services.AddAutoMapper(typeof(IUserService));


builder.Services.AddAuthentication("QueryStringAuthentication")
        .AddScheme<AuthenticationSchemeOptions, QueryStringAuthenticationHandler>("QueryStringAuthentication", null);

//builder.Services.AddAuthentication("QueryStringAuthentication")
//        .AddScheme<AuthenticationSchemeOptions, QueryStringAuthenticationHandler>("QueryStringAuthentication", null);


//builder.Services.AddDbContext<Ib190074DogadjaBaContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(); 
}


app.UseSwagger();
app.UseSwaggerUI();

app.UseHttpsRedirection();

app.UseAuthorization();
app.UseAuthentication();

app.MapControllers();


using (var scope = app.Services.CreateScope())
{
    var dataContext = scope.ServiceProvider.GetRequiredService<Ib190074DogadjaBaContext>();
  

    var conn = dataContext.Database.GetConnectionString();

     await dataContext.Database.MigrateAsync();

    dataContext.Database.EnsureCreated();


}

string hostname = Environment.GetEnvironmentVariable("RABBITMQ_HOST") ?? "";
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
    Console.WriteLine(message.ToString());
    var notification = JsonSerializer.Deserialize<NotificationInsertRequest>(message);
    using (var scope = app.Services.CreateScope())
    {
        var notificationsService = scope.ServiceProvider.GetRequiredService<INotificationService>();

        if (notification != null)
        {
            try
            {

                await notificationsService.Insert(notification);
            }
            catch (Exception e)
            {

            }
        }
    }
    Console.WriteLine(Environment.GetEnvironmentVariable("Some"));
};
channel.BasicConsume(queue: "notification",
                     autoAck: true,
                     consumer: consumer);

app.Run();
