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
    [Migration("20240118012936_edit")]
    partial class edit
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.13")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

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

                    b.Property<int?>("EventTypeId")
                        .HasColumnType("int");

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
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Grad", b =>
                {
                    b.Property<int>("GradId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("GradId"));

                    b.Property<string>("Drzava")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("ImeGrada")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("GradId")
                        .HasName("PK__Grad__B0F3C9A40962E958");

                    b.ToTable("Grad", (string)null);
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Lokacija", b =>
                {
                    b.Property<int>("LokacijaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("LokacijaId"));

                    b.Property<int?>("GradId")
                        .HasColumnType("int");

                    b.HasKey("LokacijaId")
                        .HasName("PK__Lokacija__49DE2CCAF13201B9");

                    b.HasIndex("GradId");

                    b.ToTable("Lokacija", (string)null);
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Payment", b =>
                {
                    b.Property<int>("PaymentId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PaymentId"));

                    b.Property<string>("CardNumber")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("Cvv")
                        .IsRequired()
                        .HasMaxLength(3)
                        .HasColumnType("nvarchar(3)")
                        .HasColumnName("CVV");

                    b.Property<string>("ExpiryDate")
                        .IsRequired()
                        .HasMaxLength(10)
                        .HasColumnType("nvarchar(10)");

                    b.HasKey("PaymentId")
                        .HasName("PK__Payment__9B556A38A734EA5B");

                    b.ToTable("Payment", (string)null);
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

                    b.Property<decimal?>("Cijena")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<int?>("EventId")
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
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Event", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Lokacija", "Lokacija")
                        .WithMany("Events")
                        .HasForeignKey("LokacijaId")
                        .HasConstraintName("FK__Events__Lokacija__48CFD27E");

                    b.Navigation("Lokacija");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Lokacija", b =>
                {
                    b.HasOne("dogadjaj_ba.Services.Database.Grad", "Grad")
                        .WithMany("Lokacijas")
                        .HasForeignKey("GradId")
                        .HasConstraintName("FK__Lokacija__GradId__45F365D3");

                    b.Navigation("Grad");
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
                        .HasConstraintName("FK__Tickets__EventId__5535A963");

                    b.HasOne("dogadjaj_ba.Services.Database.User", "User")
                        .WithMany("Tickets")
                        .HasForeignKey("UserId")
                        .HasConstraintName("FK__Tickets__UserId__5441852A");

                    b.Navigation("Event");

                    b.Navigation("User");
                });

            modelBuilder.Entity("dogadjaj_ba.Services.Database.Event", b =>
                {
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

            modelBuilder.Entity("dogadjaj_ba.Services.Database.User", b =>
                {
                    b.Navigation("ReportData");

                    b.Navigation("Reservations");

                    b.Navigation("Tickets");
                });
#pragma warning restore 612, 618
        }
    }
}
