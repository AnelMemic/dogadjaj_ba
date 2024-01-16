using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Azure.Core;
using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using EasyNetQ;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using RabbitMQ.Client;

namespace dogadjaj_ba.Services.EventiStateMachine
{
    public class DraftEventState : BaseState
    {
        protected ILogger<DraftEventState> _logger;
        public DraftEventState(ILogger<DraftEventState> logger,IServiceProvider serviceProvider, Database.Ib190074DogadjaBaContext context, IMapper mapper):base(serviceProvider, context,mapper) { 
            _logger = logger;
        }
       
        
        
        public override async Task<Event> Update(int id, EventUpdateRequest request)
        {
            var set = _context.Set<Database.Event>();

            var entity = await set.FindAsync(id);

            _mapper.Map(request, entity);

            

            await _context.SaveChangesAsync();
            return _mapper.Map<Model.Event>(entity);
        }
        public override async Task<Event> Activate(int id)
        {
            _logger.LogInformation($"Aktivacija eventa {id}");
            _logger.LogInformation($"W : Aktivacija eventa {id}");
            _logger.LogInformation($"E: Aktivacija eventa {id}");
            var set = _context.Set<Database.Event>();

            var entity = await set.FindAsync(id);

            entity.StateMachine = "active";
            await _context.SaveChangesAsync();

            //var factory = new ConnectionFactory { HostName = "localhost" };
            //using var connection = factory.CreateConnection();
            //using var channel = connection.CreateModel();
            //try
            //{
            //    // Your connection and channel creation code
            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine($"Exception: {ex.Message}");
            //}
            //channel.QueueDeclare(queue: "event_added",
            //    durable: false,
            //    exclusive: false,
            //    autoDelete: false,
            //    arguments: null


            //    );

            //const string message = "Hello World";
            //var body = Encoding.UTF8.GetBytes(message);
            //channel.BasicPublish(exchange: string.Empty,
            //    routingKey: "event_added",
            //    basicProperties: null,
            //    body: body);




            return _mapper.Map<Model.Event>(entity);

            //var mappedEntity = _mapper.Map<Model.Event>(entity);

            //using var bus = RabbitHutch.CreateBus("host=localhost");
            
            //bus.PubSub.Publish(mappedEntity);
            
            //return mappedEntity;





        }

        public override async Task<List<string>> AllowedActions()
        {
            var list = await base.AllowedActions();
            list.Add("Update");
            list.Add("Activate");
            return list;
        }


    }


}
