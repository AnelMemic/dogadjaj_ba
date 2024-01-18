using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;


namespace dogadjaj_ba.Services
{
    public class MappingProfile : Profile
    {
       public MappingProfile()
        {
            CreateMap<Services.Database.User, Model.Users>();
            CreateMap<Model.Requests.UsersInsertRequest, Services.Database.User>();
            CreateMap<Model.Requests.UsersUpdateRequest, Services.Database.User>();
            CreateMap<Model.Requests.EventInsertRequest, Services.Database.Event>();
            CreateMap<Model.Requests.EventUpdateRequest, Services.Database.Event>().
                ForAllMembers(opts => opts.Condition((src, dest,srcMember) => srcMember != null));
            CreateMap<Services.Database.Event, Model.Event>();
            CreateMap<Services.Database.Grad, Model.Grad>();
            CreateMap<Model.Requests.GradInsertRequest, Services.Database.Grad>();
            CreateMap<Model.Requests.GradUpdateRequest, Services.Database.Grad>();
            CreateMap<Services.Database.Lokacija, Model.Lokacija>();
            CreateMap<Model.Requests.LokacijaInsertRequest, Services.Database.Lokacija>();
            CreateMap<Model.Requests.LokacijaUpdateRequest, Services.Database.Lokacija>();
            CreateMap<Services.Database.Payment, Model.Payment>();
            CreateMap<Model.Requests.PaymentInsertRequest, Services.Database.Payment>();
            CreateMap<Model.Requests.PaymentUpdateRequest, Services.Database.Payment>();
            CreateMap<Services.Database.ReportDatum, Model.ReportDatum>();
            CreateMap<Model.Requests.ReportDatumInsertRequest, Services.Database.ReportDatum>();
            CreateMap<Model.Requests.ReportDatumUpdateRequest, Services.Database.ReportDatum>();
            CreateMap<Services.Database.Reservation, Model.Reservation>();
            CreateMap<Model.Requests.ReservationInsertRequest, Services.Database.Reservation>();
            CreateMap<Model.Requests.ReservationUpdateRequest, Services.Database.Reservation>();
            CreateMap<Services.Database.Ticket, Model.Ticket>();
            CreateMap<Model.Requests.TicketInsertRequest, Services.Database.Ticket>();
            CreateMap<Model.Requests.TicketUpdateRequest, Services.Database.Ticket>();
        }
    }
    //public UserProfile()
    //{

    //}
}
