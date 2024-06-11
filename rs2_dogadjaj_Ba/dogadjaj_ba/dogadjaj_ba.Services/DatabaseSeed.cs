using dogadjaj_ba.Services.Database;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public partial class DatabaseSeed
    {

        private readonly DateTime _dateTime = new(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local);

        public void SeedData(ModelBuilder modelBuilder)
        {
            SeedCities(modelBuilder);
            
            SeedCities(modelBuilder);
            SeedLocation(modelBuilder);
           

            //LokacijaId

        }

        private void SeedCities(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Grad>().HasData(
               new()
               {
                   GradId = 1,
                   ImeGrada = "Mostar",
                   Drzava = "BIH",
                  
               },
               new()
               {
                   GradId = 2,
                   ImeGrada = "Sarajevo",
                   Drzava = "BIH",
               },
               new()
               {
                   GradId = 3,
                   ImeGrada = "Banja Luka",
                   Drzava = "BIH",
               });

        }

        private void SeedLocation(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Lokacija>().HasData(
               new()
               {
                   LokacijaId = 1,
                   GradId = 2,
                   

               },
               new()
               {
                   LokacijaId = 2,
                   GradId = 1,
                   
               },
               new()
               {
                   LokacijaId = 3,
                   GradId = 1,
                   
               });
        }

       
        private void SeedEvents(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Event>().HasData(
               new()
               {
                   EventId = 1,
                   EventName = "Test1",
                   LokacijaId= 1,
                   EventDate= _dateTime,
                   Opis= "Test"


               },
               new()
               {
                   EventId = 2,
                   EventName = "Test2",
                   LokacijaId = 1,
                   EventDate = _dateTime,
                   Opis = "Test"

               },
               new()
               {
                   EventId = 3,
                   EventName = "Test3",
                   LokacijaId = 1,
                   EventDate = _dateTime,
                   Opis = "Test"

               });
        }



    }
}
