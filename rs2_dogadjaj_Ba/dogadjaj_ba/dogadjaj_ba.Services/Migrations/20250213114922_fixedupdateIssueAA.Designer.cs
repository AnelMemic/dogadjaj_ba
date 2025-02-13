﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using dogadjaj_ba.Services.Database;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    [DbContext(typeof(Ib190074DogadjaBaContext))]
    [Migration("20250213114922_fixedupdateIssueAA")]
    partial class fixedupdateIssueAA
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.13")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Country", b =>
                {
                    b.Property<int>("countryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("countryId"));

                    b.Property<string>("name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("countryId");

                    b.ToTable("Country");

                    b.HasData(
                        new
                        {
                            countryId = 1,
                            name = "BIH"
                        },
                        new
                        {
                            countryId = 2,
                            name = "CRO"
                        },
                        new
                        {
                            countryId = 3,
                            name = "SRB"
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Event", b =>
                {
                    b.Property<int>("EventId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("EventId"));

                    b.Property<DateTime>("EventDate")
                        .HasColumnType("datetime");

                    b.Property<byte[]>("EventImage")
                        .HasColumnType("varbinary(max)");

                    b.Property<string>("EventName")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<int?>("LokacijaId")
                        .HasColumnType("int");

                    b.Property<string>("Opis")
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<string>("StateMachine")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("eventType")
                        .HasColumnType("int");

                    b.Property<int>("subType")
                        .HasColumnType("int");

                    b.HasKey("EventId")
                        .HasName("PK__Events__7944C81091647413");

                    b.HasIndex("LokacijaId");

                    b.ToTable("Events");

                    b.HasData(
                        new
                        {
                            EventId = 1,
                            EventDate = new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local),
                            EventName = "Test1",
                            LokacijaId = 1,
                            Opis = "Test",
                            StateMachine = "draft",
                            eventType = 1,
                            subType = 1
                        },
                        new
                        {
                            EventId = 2,
                            EventDate = new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local),
                            EventName = "Test2",
                            LokacijaId = 1,
                            Opis = "Test2",
                            StateMachine = "draft",
                            eventType = 1,
                            subType = 1
                        },
                        new
                        {
                            EventId = 3,
                            EventDate = new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local),
                            EventName = "Test3",
                            LokacijaId = 1,
                            Opis = "Test3",
                            StateMachine = "draft",
                            eventType = 1,
                            subType = 1
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Grad", b =>
                {
                    b.Property<int>("GradId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("GradId"));

                    b.Property<int?>("CountryId")
                        .HasColumnType("int");

                    b.Property<string>("Drzava")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("ImeGrada")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("GradId")
                        .HasName("PK__Grad__B0F3C9A40962E958");

                    b.HasIndex("CountryId");

                    b.ToTable("Grad", (string)null);

                    b.HasData(
                        new
                        {
                            GradId = 1,
                            Drzava = "BIH",
                            ImeGrada = "Mostar"
                        },
                        new
                        {
                            GradId = 2,
                            Drzava = "BIH",
                            ImeGrada = "Sarajevo"
                        },
                        new
                        {
                            GradId = 3,
                            Drzava = "BIH",
                            ImeGrada = "Banja Luka"
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Images", b =>
                {
                    b.Property<int>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("id"));

                    b.Property<int?>("eventId")
                        .HasColumnType("int");

                    b.Property<string>("url")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("id");

                    b.HasIndex("eventId");

                    b.ToTable("Images");

                    b.HasData(
                        new
                        {
                            id = 2,
                            eventId = 1,
                            url = "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg"
                        },
                        new
                        {
                            id = 1,
                            eventId = 3,
                            url = "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg"
                        },
                        new
                        {
                            id = 3,
                            eventId = 2,
                            url = "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg"
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Lokacija", b =>
                {
                    b.Property<int>("LokacijaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("LokacijaId"));

                    b.Property<string>("Adresa")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("GradId")
                        .HasColumnType("int");

                    b.Property<string>("NazivObjekta")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("LokacijaId")
                        .HasName("PK__Lokacija__49DE2CCAF13201B9");

                    b.HasIndex("GradId");

                    b.ToTable("Lokacija", (string)null);

                    b.HasData(
                        new
                        {
                            LokacijaId = 1,
                            Adresa = "Mostar ",
                            GradId = 2,
                            NazivObjekta = "Era Mostar"
                        },
                        new
                        {
                            LokacijaId = 2,
                            Adresa = "Bisce polje",
                            GradId = 1,
                            NazivObjekta = "Plaza "
                        },
                        new
                        {
                            LokacijaId = 3,
                            Adresa = "MostarGrad",
                            GradId = 1,
                            NazivObjekta = "Mepas"
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Notiffication", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Content")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("DateRead")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("Deleted")
                        .HasColumnType("bit");

                    b.Property<bool?>("Read")
                        .HasColumnType("bit");

                    b.Property<DateTime?>("SendOnDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("Notiffications");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Content = "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!",
                            Deleted = false,
                            Read = false,
                            SendOnDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7311),
                            UserId = 1
                        },
                        new
                        {
                            Id = 2,
                            Content = "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!",
                            Deleted = false,
                            Read = false,
                            SendOnDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7343),
                            UserId = 2
                        },
                        new
                        {
                            Id = 3,
                            Content = "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!",
                            Deleted = false,
                            Read = false,
                            SendOnDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7345),
                            UserId = 3
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Payment", b =>
                {
                    b.Property<int>("PaymentId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PaymentId"));

                    b.Property<DateTime>("PaymentDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("PaymentMethod")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PaymentStatus")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("userId")
                        .HasColumnType("int");

                    b.HasKey("PaymentId")
                        .HasName("PK__Payment__9B556A38A734EA5B");

                    b.HasIndex("userId");

                    b.ToTable("Payment", (string)null);

                    b.HasData(
                        new
                        {
                            PaymentId = 1,
                            PaymentDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7352),
                            PaymentMethod = "card",
                            PaymentStatus = "true"
                        },
                        new
                        {
                            PaymentId = 2,
                            PaymentDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7355),
                            PaymentMethod = "card",
                            PaymentStatus = "true"
                        },
                        new
                        {
                            PaymentId = 3,
                            PaymentDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7356),
                            PaymentMethod = "card",
                            PaymentStatus = "true"
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Post", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("PublishDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("content")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("eventId")
                        .HasColumnType("int");

                    b.Property<string>("title")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("eventId");

                    b.ToTable("Posts");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            PublishDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7386),
                            content = "Pridružite nam se na koncertu u Mostaru, zabava je zagarantovana!",
                            eventId = 1,
                            title = "Koncert u Mostaru!"
                        },
                        new
                        {
                            Id = 2,
                            PublishDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7388),
                            content = "Novi događaj u Sarajevu, pogledajte naše događaje i kupite kartu!",
                            eventId = 1,
                            title = "Novi događaj!"
                        },
                        new
                        {
                            Id = 3,
                            PublishDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7389),
                            content = "Dođite na filmski festival u Banjoj Luci i uživajte u najnovijim filmovima!",
                            eventId = 1,
                            title = "Filmski Festival"
                        },
                        new
                        {
                            Id = 4,
                            PublishDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7390),
                            content = "Pozivamo vas na umjetničku izložbu u Tuzli, inspirativna djela očekuju vas!",
                            eventId = 1,
                            title = "Umjetnička Izložba"
                        },
                        new
                        {
                            Id = 6,
                            PublishDate = new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7391),
                            content = "Pripremite se za tehnološku konferenciju u Mostaru, najnoviji trendovi i inovacije.",
                            eventId = 1,
                            title = "Tehnološka Konferencija"
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.ReportDatum", b =>
                {
                    b.Property<int>("ReportDataId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ReportDataId"));

                    b.Property<int?>("EventId")
                        .HasColumnType("int");

                    b.Property<int?>("UserId")
                        .HasColumnType("int");

                    b.HasKey("ReportDataId")
                        .HasName("PK__ReportDa__8F5488171D792E1C");

                    b.HasIndex("EventId");

                    b.HasIndex("UserId");

                    b.ToTable("ReportData");

                    b.HasData(
                        new
                        {
                            ReportDataId = 1,
                            EventId = 1,
                            UserId = 1
                        },
                        new
                        {
                            ReportDataId = 2,
                            EventId = 1,
                            UserId = 1
                        },
                        new
                        {
                            ReportDataId = 3,
                            EventId = 1,
                            UserId = 1
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Reservation", b =>
                {
                    b.Property<int>("ReservationId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ReservationId"));

                    b.Property<DateTime>("ReservationDate")
                        .HasColumnType("datetime");

                    b.Property<int?>("UserId")
                        .HasColumnType("int");

                    b.HasKey("ReservationId")
                        .HasName("PK__Reservat__B7EE5F2457AB750C");

                    b.HasIndex("UserId");

                    b.ToTable("Reservations");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Ticket", b =>
                {
                    b.Property<int>("TicketId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("TicketId"));

                    b.Property<int>("Available")
                        .HasColumnType("int");

                    b.Property<decimal?>("Cijena")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<int>("EventId")
                        .HasColumnType("int");

                    b.Property<int?>("UserId")
                        .HasColumnType("int");

                    b.Property<string>("description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ticketNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("title")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("TicketId")
                        .HasName("PK__Tickets__712CC6078752A99F");

                    b.HasIndex("EventId");

                    b.HasIndex("UserId");

                    b.ToTable("Tickets");

                    b.HasData(
                        new
                        {
                            TicketId = 1,
                            Available = 1,
                            Cijena = 100m,
                            EventId = 1,
                            UserId = 1,
                            description = "Opis",
                            ticketNumber = "2",
                            title = "Title"
                        },
                        new
                        {
                            TicketId = 2,
                            Available = 1,
                            Cijena = 100m,
                            EventId = 3,
                            UserId = 2,
                            description = "Opis2",
                            ticketNumber = "2",
                            title = "Title2"
                        },
                        new
                        {
                            TicketId = 3,
                            Available = 1,
                            Cijena = 100m,
                            EventId = 2,
                            UserId = 1,
                            description = "Opis3",
                            ticketNumber = "2",
                            title = "Title3"
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.User", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("UserId"));

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<string>("ImePrezime")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("KorisnickoIme")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("Sifra")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("UserId")
                        .HasName("PK__Users__1788CC4C6285AE3B");

                    b.ToTable("Users");

                    b.HasData(
                        new
                        {
                            UserId = 1,
                            Email = "test@test",
                            ImePrezime = "admin",
                            KorisnickoIme = "admin",
                            Sifra = "jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg="
                        },
                        new
                        {
                            UserId = 2,
                            Email = "test1@test",
                            ImePrezime = "t2",
                            KorisnickoIme = "mobile",
                            Sifra = "YDA64iuZiGG847KPM+7BvnWKITyGyTwHbb6fVYwRx1I="
                        },
                        new
                        {
                            UserId = 3,
                            Email = "test2@test",
                            ImePrezime = "t3",
                            KorisnickoIme = "dogadjaj3",
                            Sifra = "/WGgOvT3fYcPwh4F5+gGeAlcktgIz7O1wnnuBMdKyhM="
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.UserTicket", b =>
                {
                    b.Property<int>("UserTicketID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("UserTicketID"));

                    b.Property<int>("Kolicina")
                        .HasColumnType("int");

                    b.Property<int>("TicketId")
                        .HasColumnType("int");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("UserTicketID")
                        .HasName("PK__UserTick__5B0E19B06A29E69D");

                    b.HasIndex("TicketId");

                    b.HasIndex("UserId");

                    b.ToTable("UserTicket");

                    b.HasData(
                        new
                        {
                            UserTicketID = 1,
                            Kolicina = 1,
                            TicketId = 1,
                            UserId = 1
                        },
                        new
                        {
                            UserTicketID = 2,
                            Kolicina = 1,
                            TicketId = 1,
                            UserId = 1
                        },
                        new
                        {
                            UserTicketID = 3,
                            Kolicina = 1,
                            TicketId = 1,
                            UserId = 1
                        });
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Event", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Lokacija", "Lokacija")
                        .WithMany("Events")
                        .HasForeignKey("LokacijaId")
                        .HasConstraintName("FK__Events__Lokacija__48CFD27E");

                    b.Navigation("Lokacija");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Grad", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Country", "Country")
                        .WithMany("Cities")
                        .HasForeignKey("CountryId");

                    b.Navigation("Country");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Images", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Event", "Event")
                        .WithMany("Images")
                        .HasForeignKey("eventId");

                    b.Navigation("Event");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Lokacija", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Grad", "Grad")
                        .WithMany("Lokacijas")
                        .HasForeignKey("GradId")
                        .HasConstraintName("FK__Lokacija__GradId__45F365D3");

                    b.Navigation("Grad");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Notiffication", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Payment", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.User", "User")
                        .WithMany("Payment")
                        .HasForeignKey("userId");

                    b.Navigation("User");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Post", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Event", "Event")
                        .WithMany("Posts")
                        .HasForeignKey("eventId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Event");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.ReportDatum", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Event", "Event")
                        .WithMany("ReportData")
                        .HasForeignKey("EventId")
                        .HasConstraintName("FK__ReportDat__Event__5165187F");

                    b.HasOne("dogadjaj_ba.Services.Database.User", "User")
                        .WithMany("ReportData")
                        .HasForeignKey("UserId")
                        .HasConstraintName("FK__ReportDat__UserI__5070F446");

                    b.Navigation("Event");

                    b.Navigation("User");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Reservation", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.User", "User")
                        .WithMany("Reservations")
                        .HasForeignKey("UserId")
                        .HasConstraintName("FK__Reservati__UserI__3F466844");

                    b.Navigation("User");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Ticket", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Event", "Event")
                        .WithMany("Tickets")
                        .HasForeignKey("EventId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__Tickets__EventId__5535A963");

                    b.HasOne("dogadjaj_ba.Services.Database.User", "User")
                        .WithMany("Tickets")
                        .HasForeignKey("UserId")
                        .HasConstraintName("FK__Tickets__UserId__5441852A");

                    b.Navigation("Event");

                    b.Navigation("User");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.UserTicket", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Ticket", "Ticket")
                        .WithMany("UserTicket")
                        .HasForeignKey("TicketId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__UserTicket__TicketId__87654321");

                    b.HasOne("dogadjaj_ba.Services.Database.User", "User")
                        .WithMany("UserTicket")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__UserTicket__UserId__12345678");

                    b.Navigation("Ticket");

                    b.Navigation("User");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Country", b =>
                {
                    b.Navigation("Cities");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Event", b =>
                {
                    b.Navigation("Images");

                    b.Navigation("Posts");

                    b.Navigation("ReportData");

                    b.Navigation("Tickets");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Grad", b =>
                {
                    b.Navigation("Lokacijas");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Lokacija", b =>
                {
                    b.Navigation("Events");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Ticket", b =>
                {
                    b.Navigation("UserTicket");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.User", b =>
                {
                    b.Navigation("Payment");

                    b.Navigation("ReportData");

                    b.Navigation("Reservations");

                    b.Navigation("Tickets");

                    b.Navigation("UserTicket");
                });
#pragma warning restore 612, 618
        }
    }
}
