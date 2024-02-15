using dogadjaj_ba;
using dogadjaj_ba.Filters;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using dogadjaj_ba.Services.Database;
using dogadjaj_ba.Services.EventiStateMachine;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using ServiceStack;
using System;

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


app.Run();
