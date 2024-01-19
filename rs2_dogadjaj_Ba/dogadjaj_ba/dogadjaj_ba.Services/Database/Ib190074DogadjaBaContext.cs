using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using Microsoft.EntityFrameworkCore;

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


    public virtual DbSet<ReportDatum> ReportData { get; set; }

    public virtual DbSet<Reservation> Reservations { get; set; }

    public virtual DbSet<Ticket> Tickets { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-H93N0OC\\MSSQLSERVER_OLAP;Initial Catalog=IB190074_dogadjajj.ba; Trusted_Connection=true;TrustServerCertificate=True ");

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

            entity.Property(e => e.CardNumber).HasMaxLength(50);
            entity.Property(e => e.Cvv)
                .HasMaxLength(3)
                .HasColumnName("CVV");
            entity.Property(e => e.ExpiryDate).HasMaxLength(10);
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
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
