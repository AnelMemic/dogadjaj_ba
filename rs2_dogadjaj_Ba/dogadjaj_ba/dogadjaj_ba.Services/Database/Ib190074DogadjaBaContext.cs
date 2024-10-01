using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using Microsoft.EntityFrameworkCore;
using dogadjaj_ba.Services;
using System.Numerics;
using System.Reflection.Metadata;
namespace dogadjaj_ba.Services.Database;

public partial class Ib190074DogadjaBaContext : DbContext
{
    public Ib190074DogadjaBaContext()
    {
    }

    public Ib190074DogadjaBaContext(DbContextOptions<Ib190074DogadjaBaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<UserTicket> UserTicket { get; set; }
    public virtual DbSet<Grad> Grads { get; set; }

    public virtual DbSet<Lokacija> Lokacijas { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

    // public virtual DbSet<Payment1> Payments1 { get; set; }

    public virtual DbSet<Notiffication> Notiffications { get; set; }

    public virtual DbSet<ReportDatum> ReportData { get; set; }
    public virtual DbSet<Post> Posts { get; set; }

    public virtual DbSet<Reservation> Reservations { get; set; }

    public virtual DbSet<Ticket> Tickets { get; set; }

    public virtual DbSet<User> Users { get; set; }
    public virtual DbSet<Country> Country { get; set; }
    public virtual DbSet<Images> Images { get; set; }

//    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=dogadjajBa;TrustServerCertificate=True;Trusted_Connection=True;");


    private readonly DateTime _dateTime = new(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local);

    public void SeedData(ModelBuilder modelBuilder)
    {
        SeedCities(modelBuilder);
        SeedLocation(modelBuilder);
        SeedEvents(modelBuilder);
        SeedUsers(modelBuilder);
        SeedTicket(modelBuilder);
        SeedNotifications(modelBuilder);
        SeedPayment(modelBuilder);
        SeedCountry(modelBuilder);
        SeedReportData(modelBuilder);
        SeedUserTicket(modelBuilder);
        SeedPosts(modelBuilder);
        SeedReservation(modelBuilder);
        SeedImages(modelBuilder);
    }
    private void SeedImages(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Images>().HasData(
           new()
           {
              eventId = 1,
              id = 2,
                url= "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg"
           },
           new()
           {
               eventId = 3,
               id = 1,
               url = "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg"
           },
           new()
           {
               eventId = 2,
               id = 3,
               url = "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg"
           });
    }
    private void SeedUserTicket(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<UserTicket>().HasData(
           new()
           {
               TicketId = 1,
               UserId = 1,
               Kolicina=1,
               UserTicketID=1,
           },
           new()
           {
               TicketId = 1,
               UserId = 1,
               Kolicina = 1,
               UserTicketID = 2,
           },
           new()
           {
               TicketId = 1,
               UserId = 1,
               Kolicina = 1,
               UserTicketID = 3,
           });
    }
    private void SeedReservation(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Reservation>().HasData(
           new()
           {
              
               UserId = 1,
                ReservationDate = DateTime.Now,
                ReservationId = 1,
                
              
           },
           new()
           {
               UserId = 1,
               ReservationDate = DateTime.Now,
               ReservationId = 2,
           },
           new()
           {
               UserId = 1,
               ReservationDate = DateTime.Now,
               ReservationId = 3,
           });
    }
    private void SeedReportData(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ReportDatum>().HasData(
           new()
           {
                ReportDataId=1,
                UserId=1,
                EventId=1,
           },
           new()
           {
               ReportDataId = 2,
               UserId = 1,
               EventId = 1,
           },
           new()
           {
               ReportDataId = 3,
               UserId = 1,
               EventId = 1,
           });
    }
    private void SeedCountry(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Country>().HasData(
           new()
           {
               countryId=1,
               name="BIH"
           },
           new()
           {
               countryId = 2,
               name = "CRO"
           },
           new()
           {
               countryId = 3,
               name = "SRB"
           });
    }
    private void SeedPayment(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Payment>().HasData(
           new()
           {
              PaymentId=1,
PaymentDate=DateTime.Now,
       PaymentMethod="card",
       PaymentStatus="true"
           },
           new()
           {
               PaymentId = 2,
               PaymentDate = DateTime.Now,
               PaymentMethod = "card",
               PaymentStatus = "true"
           },
           new()
           {
               PaymentId = 3,
               PaymentDate = DateTime.Now,
               PaymentMethod = "card",
               PaymentStatus = "true"
           });
    }

    private void SeedTicket(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Ticket>().HasData(
           new()
           {
               TicketId = 1,
               title= "Title",
               description= "Opis",
               UserId= 1,
               ticketNumber = "2",
               Available=1,
               EventId= 1,
               Cijena = 100
           },
           new()
           {
               TicketId = 2,
               title = "Title2",
               description = "Opis2",
               UserId = 2,
               ticketNumber = "2",
               Available = 1,
               EventId = 3,
               Cijena = 100
           },
           new()
           {
               TicketId = 3,
               title = "Title3",
               description = "Opis3",
               UserId = 1,
               ticketNumber = "2",
               Available = 1,
               EventId = 2,
               Cijena = 100
           });
    }
    private void SeedUsers(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>().HasData(
           new()
           {
               UserId = 1,
               KorisnickoIme = "admin",
               ImePrezime = "admin",
               Sifra ="admin",
               Email= "test@test",
               
               

           },
           new()
           {
               UserId = 2,
               KorisnickoIme = "mobile",
               ImePrezime = "t2",
               Sifra = "mobile",
               Email = "test1@test",

           },
           new()
           {
               UserId = 3,
               KorisnickoIme = "dogadjaj3",
               ImePrezime = "t3",
               Sifra = "test",
               Email = "test2@test",

           });
    }
    private void SeedLocation(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Lokacija>().HasData(
           new()
           {
               LokacijaId = 1,
               GradId = 2,
               Adresa= "Mostar ",
               NazivObjekta= "Era Mostar"


           },
           new()
           {
               LokacijaId = 2,
               GradId = 1,
               Adresa = "Bisce polje",
               NazivObjekta = "Plaza "

           },
           new()
           {
               LokacijaId = 3,
               GradId = 1,
               Adresa = "MostarGrad",
               NazivObjekta = "Mepas"

           });
    }


    private void SeedEvents(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Event>().HasData(
           new()
           {
               EventId = 1,
               EventName = "Test1",
               LokacijaId = 1,
               EventDate = _dateTime,
               Opis = "Test",
               eventType = dogadjaj_ba.Model.Enums.TypeEvent.Konferencija,
               subType = dogadjaj_ba.Model.Enums.SubtypeOfEventType.Gradjevinarstvo,StateMachine="draft"
               

           },
           new()
           {
               EventId = 2,
               EventName = "Test2",
               LokacijaId = 1,
               EventDate = _dateTime,
               Opis = "Test2",
               eventType = dogadjaj_ba.Model.Enums.TypeEvent.Konferencija,
               subType = dogadjaj_ba.Model.Enums.SubtypeOfEventType.Gradjevinarstvo,
               StateMachine = "draft"
           },
           new()
           {
               EventId = 3,
               EventName = "Test3",
               LokacijaId = 1,
               EventDate = _dateTime,
               Opis = "Test3",
               eventType = dogadjaj_ba.Model.Enums.TypeEvent.Konferencija,
               StateMachine = "draft",
               subType = dogadjaj_ba.Model.Enums.SubtypeOfEventType.Gradjevinarstvo
           });
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

    private void SeedNotifications(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Notiffication>().HasData(
           new()
           {
               Id = 1,
               Content = "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!",
               DateRead = null,
               SendOnDate = DateTime.Now,
               Deleted = false,
               Read = false,
               UserId = 1,

           },
           new()
           {
               Id = 2,
               Content = "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!",
               DateRead = null,
               SendOnDate = DateTime.Now,
               Deleted = false,
               Read = false,
               UserId = 2,
           },
           new()
           {
               Id = 3,
               Content = "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!",
               DateRead = null,
               SendOnDate = DateTime.Now,
               Deleted = false,
               Read = false,
               UserId = 3,
           });
    }

    private void SeedPosts(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Post>().HasData(
           new()
           {
               Id = 1,
               content = "Pridružite nam se na koncertu u Mostaru, zabava je zagarantovana!",
               title = "Koncert u Mostaru!",
               PublishDate = DateTime.Now,

           },
           new()
           {
                Id= 2,
                content = "Novi događaj u Sarajevu, pogledajte naše događaje i kupite kartu!",
                title= "Novi događaj!",
                PublishDate = DateTime.Now,
           },
           new()
           {
               Id = 3,
               content = "Dođite na filmski festival u Banjoj Luci i uživajte u najnovijim filmovima!",
               title = "Filmski Festival",
               PublishDate = DateTime.Now,
           },
           new()
              {
               Id = 4,
               content = "Pozivamo vas na umjetničku izložbu u Tuzli, inspirativna djela očekuju vas!",
               title = "Umjetnička Izložba",
               PublishDate = DateTime.Now,
           },
           new()
           {
               Id = 5,
               content = "Sportski događaj godine u Zenici! Ne propustite spektakl.",
               title = "Sportski Spektakl",
               PublishDate = DateTime.Now,
           }, 
           new()
           {
               Id = 6,
               content = "Pripremite se za tehnološku konferenciju u Mostaru, najnoviji trendovi i inovacije.",
               title = "Tehnološka Konferencija",
               PublishDate = DateTime.Now,
           }
           );
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Event>(entity =>
        {
            entity.HasKey(e => e.EventId).HasName("PK__Events__7944C81091647413");

            entity.Property(e => e.EventDate).HasColumnType("datetime");
            entity.Property(e => e.EventName).HasMaxLength(100);
            entity.Property(e => e.Opis).HasMaxLength(100);

            

            entity.HasOne(d => d.Lokacija).WithMany(p => p.Events)
                .HasForeignKey(d => d.LokacijaId)
                .HasConstraintName("FK__Events__Lokacija__48CFD27E");
        });
        


        modelBuilder.Entity<Grad>(entity =>
        {
            entity.HasKey(e => e.GradId).HasName("PK__Grad__B0F3C9A40962E958");

            entity.ToTable("Grad");

            entity.Property(e => e.Drzava).HasMaxLength(50);
            entity.Property(e => e.ImeGrada).HasMaxLength(50);
        });

        modelBuilder.Entity<Lokacija>(entity =>
        {
            entity.HasKey(e => e.LokacijaId).HasName("PK__Lokacija__49DE2CCAF13201B9");

            entity.ToTable("Lokacija");

            entity.HasOne(d => d.Grad).WithMany(p => p.Lokacijas)
                .HasForeignKey(d => d.GradId)
                .HasConstraintName("FK__Lokacija__GradId__45F365D3");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.PaymentId).HasName("PK__Payment__9B556A38A734EA5B");

            entity.ToTable("Payment");

            //entity.Property(e => e.CardNumber).HasMaxLength(50);
            //entity.Property(e => e.Cvv)
            //    .HasMaxLength(3)
            //    .HasColumnName("CVV");
            //entity.Property(e => e.ExpiryDate).HasMaxLength(10);
        });

        //modelBuilder.Entity<Payment1>(entity =>
        //{
        //    entity.HasKey(e => e.PaymentId).HasName("PK__Payments__9B556A38DCE35FC6");

        //    entity.ToTable("Payments");

        //    entity.Property(e => e.Amount).HasColumnType("decimal(10, 2)");

        //    entity.HasOne(d => d.Reservation).WithMany(p => p.Payment1s)
        //        .HasForeignKey(d => d.ReservationId)
        //        .HasConstraintName("FK__Payments__Reserv__4D94879B");

        //    entity.HasOne(d => d.User).WithMany(p => p.Payment1s)
        //        .HasForeignKey(d => d.UserId)
        //        .HasConstraintName("FK__Payments__UserId__4CA06362");
        //});

       

        modelBuilder.Entity<ReportDatum>(entity =>
        {
            entity.HasKey(e => e.ReportDataId).HasName("PK__ReportDa__8F5488171D792E1C");

            entity.HasOne(d => d.Event).WithMany(p => p.ReportData)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("FK__ReportDat__Event__5165187F");

            entity.HasOne(d => d.User).WithMany(p => p.ReportData)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__ReportDat__UserI__5070F446");
        });

        modelBuilder.Entity<Reservation>(entity =>
        {
            entity.HasKey(e => e.ReservationId).HasName("PK__Reservat__B7EE5F2457AB750C");

            entity.Property(e => e.ReservationDate).HasColumnType("datetime");

            entity.HasOne(d => d.User).WithMany(p => p.Reservations)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Reservati__UserI__3F466844");
        });

        modelBuilder.Entity<Ticket>(entity =>
        {
            entity.HasKey(e => e.TicketId).HasName("PK__Tickets__712CC6078752A99F");

            entity.Property(e => e.Cijena).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Event).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.EventId)
                .HasConstraintName("FK__Tickets__EventId__5535A963");

            entity.HasOne(d => d.User).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Tickets__UserId__5441852A");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CC4C6285AE3B");

            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.ImePrezime).HasMaxLength(50);
            entity.Property(e => e.KorisnickoIme).HasMaxLength(50);
            entity.Property(e => e.Sifra).HasMaxLength(50);
        });

        modelBuilder.Entity<UserTicket>(entity =>
        {
            entity.HasKey(e => e.UserTicketID).HasName("PK__UserTick__5B0E19B06A29E69D");

           
            

            entity.HasOne(d => d.User).WithMany(p => p.UserTicket)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__UserTicket__UserId__12345678");

            entity.HasOne(d => d.Ticket).WithMany(p => p.UserTicket)
                .HasForeignKey(d => d.TicketId)
                .HasConstraintName("FK__UserTicket__TicketId__87654321");
        });

        OnModelCreatingPartial(modelBuilder);
        SeedData(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    
}
