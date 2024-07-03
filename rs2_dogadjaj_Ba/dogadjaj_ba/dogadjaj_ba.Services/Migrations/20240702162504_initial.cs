using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Country",
                columns: table => new
                {
                    countryId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Country", x => x.countryId);
                });

            migrationBuilder.CreateTable(
                name: "Grad",
                columns: table => new
                {
                    GradId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ImeGrada = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Drzava = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Grad__B0F3C9A40962E958", x => x.GradId);
                });

            migrationBuilder.CreateTable(
                name: "Images",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    url = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Images", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "Payment",
                columns: table => new
                {
                    PaymentId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PaymentDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PaymentMethod = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PaymentStatus = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Payment__9B556A38A734EA5B", x => x.PaymentId);
                });

            migrationBuilder.CreateTable(
                name: "Posts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PublishDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Posts", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ImePrezime = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    KorisnickoIme = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Sifra = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Users__1788CC4C6285AE3B", x => x.UserId);
                });

            migrationBuilder.CreateTable(
                name: "Lokacija",
                columns: table => new
                {
                    LokacijaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    GradId = table.Column<int>(type: "int", nullable: true),
                    Adresa = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NazivObjekta = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Lokacija__49DE2CCAF13201B9", x => x.LokacijaId);
                    table.ForeignKey(
                        name: "FK__Lokacija__GradId__45F365D3",
                        column: x => x.GradId,
                        principalTable: "Grad",
                        principalColumn: "GradId");
                });

            migrationBuilder.CreateTable(
                name: "Notiffications",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Read = table.Column<bool>(type: "bit", nullable: true),
                    Deleted = table.Column<bool>(type: "bit", nullable: true),
                    DateRead = table.Column<DateTime>(type: "datetime2", nullable: true),
                    SendOnDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Notiffications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Notiffications_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Reservations",
                columns: table => new
                {
                    ReservationId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    ReservationDate = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Reservat__B7EE5F2457AB750C", x => x.ReservationId);
                    table.ForeignKey(
                        name: "FK__Reservati__UserI__3F466844",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "UserId");
                });

            migrationBuilder.CreateTable(
                name: "Events",
                columns: table => new
                {
                    EventId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    EventName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    LokacijaId = table.Column<int>(type: "int", nullable: true),
                    EventDate = table.Column<DateTime>(type: "datetime", nullable: false),
                    Opis = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    EventImage = table.Column<byte[]>(type: "varbinary(max)", nullable: true),
                    StateMachine = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    eventType = table.Column<int>(type: "int", nullable: false),
                    subType = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Events__7944C81091647413", x => x.EventId);
                    table.ForeignKey(
                        name: "FK__Events__Lokacija__48CFD27E",
                        column: x => x.LokacijaId,
                        principalTable: "Lokacija",
                        principalColumn: "LokacijaId");
                });

            migrationBuilder.CreateTable(
                name: "ReportData",
                columns: table => new
                {
                    ReportDataId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    EventId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__ReportDa__8F5488171D792E1C", x => x.ReportDataId);
                    table.ForeignKey(
                        name: "FK__ReportDat__Event__5165187F",
                        column: x => x.EventId,
                        principalTable: "Events",
                        principalColumn: "EventId");
                    table.ForeignKey(
                        name: "FK__ReportDat__UserI__5070F446",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "UserId");
                });

            migrationBuilder.CreateTable(
                name: "Tickets",
                columns: table => new
                {
                    TicketId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    ticketNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Available = table.Column<int>(type: "int", nullable: false),
                    EventId = table.Column<int>(type: "int", nullable: true),
                    Cijena = table.Column<decimal>(type: "decimal(10,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Tickets__712CC6078752A99F", x => x.TicketId);
                    table.ForeignKey(
                        name: "FK__Tickets__EventId__5535A963",
                        column: x => x.EventId,
                        principalTable: "Events",
                        principalColumn: "EventId");
                    table.ForeignKey(
                        name: "FK__Tickets__UserId__5441852A",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "UserId");
                });

            migrationBuilder.CreateTable(
                name: "UserTicket",
                columns: table => new
                {
                    UserTicketID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    TicketId = table.Column<int>(type: "int", nullable: false),
                    Kolicina = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__UserTick__5B0E19B06A29E69D", x => x.UserTicketID);
                    table.ForeignKey(
                        name: "FK__UserTicket__TicketId__87654321",
                        column: x => x.TicketId,
                        principalTable: "Tickets",
                        principalColumn: "TicketId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK__UserTicket__UserId__12345678",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Country",
                columns: new[] { "countryId", "name" },
                values: new object[,]
                {
                    { 1, "BIH" },
                    { 2, "CRO" },
                    { 3, "SRB" }
                });

            migrationBuilder.InsertData(
                table: "Grad",
                columns: new[] { "GradId", "Drzava", "ImeGrada" },
                values: new object[,]
                {
                    { 1, "BIH", "Mostar" },
                    { 2, "BIH", "Sarajevo" },
                    { 3, "BIH", "Banja Luka" }
                });

            migrationBuilder.InsertData(
                table: "Payment",
                columns: new[] { "PaymentId", "PaymentDate", "PaymentMethod", "PaymentStatus" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9875), "card", "true" },
                    { 2, new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9878), "card", "true" },
                    { 3, new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9881), "card", "true" }
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "UserId", "Email", "ImePrezime", "KorisnickoIme", "Sifra" },
                values: new object[,]
                {
                    { 1, "test@test", "t1", "dogadjaj1", "test" },
                    { 2, "test1@test", "t2", "dogadjaj2", "test" },
                    { 3, "test2@test", "t3", "dogadjaj3", "test" }
                });

            migrationBuilder.InsertData(
                table: "Lokacija",
                columns: new[] { "LokacijaId", "Adresa", "GradId", "NazivObjekta" },
                values: new object[,]
                {
                    { 1, "Mostar ", 2, "Era Mostar" },
                    { 2, "Bisce polje", 1, "Plaza " },
                    { 3, "MostarGrad", 1, "Mepas" }
                });

            migrationBuilder.InsertData(
                table: "Notiffications",
                columns: new[] { "Id", "Content", "DateRead", "Deleted", "Read", "SendOnDate", "UserId" },
                values: new object[,]
                {
                    { 1, "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!", null, false, false, new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9827), 1 },
                    { 2, "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!", null, false, false, new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9859), 2 },
                    { 3, "Novi događaj u Mostaru, pogledajte naše događaje i kupite kartu!", null, false, false, new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9861), 3 }
                });

            migrationBuilder.InsertData(
                table: "Events",
                columns: new[] { "EventId", "EventDate", "EventImage", "EventName", "LokacijaId", "Opis", "StateMachine", "eventType", "subType" },
                values: new object[,]
                {
                    { 1, new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local), null, "Test1", 1, "Test", "draft", 1, 1 },
                    { 2, new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local), null, "Test2", 1, "Test2", "draft", 1, 1 },
                    { 3, new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local), null, "Test3", 1, "Test3", "draft", 1, 1 }
                });

            migrationBuilder.InsertData(
                table: "ReportData",
                columns: new[] { "ReportDataId", "EventId", "UserId" },
                values: new object[,]
                {
                    { 1, 1, 1 },
                    { 2, 1, 1 },
                    { 3, 1, 1 }
                });

            migrationBuilder.InsertData(
                table: "Tickets",
                columns: new[] { "TicketId", "Available", "Cijena", "EventId", "UserId", "description", "ticketNumber", "title" },
                values: new object[,]
                {
                    { 1, 1, 100m, 1, 1, "Opis", "2", "Title" },
                    { 2, 1, 100m, 3, 2, "Opis2", "2", "Title2" },
                    { 3, 1, 100m, 2, 1, "Opis3", "2", "Title3" }
                });

            migrationBuilder.InsertData(
                table: "UserTicket",
                columns: new[] { "UserTicketID", "Kolicina", "TicketId", "UserId" },
                values: new object[,]
                {
                    { 1, 1, 1, 1 },
                    { 2, 1, 1, 1 },
                    { 3, 1, 1, 1 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Events_LokacijaId",
                table: "Events",
                column: "LokacijaId");

            migrationBuilder.CreateIndex(
                name: "IX_Lokacija_GradId",
                table: "Lokacija",
                column: "GradId");

            migrationBuilder.CreateIndex(
                name: "IX_Notiffications_UserId",
                table: "Notiffications",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_ReportData_EventId",
                table: "ReportData",
                column: "EventId");

            migrationBuilder.CreateIndex(
                name: "IX_ReportData_UserId",
                table: "ReportData",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Reservations_UserId",
                table: "Reservations",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_EventId",
                table: "Tickets",
                column: "EventId");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_UserId",
                table: "Tickets",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserTicket_TicketId",
                table: "UserTicket",
                column: "TicketId");

            migrationBuilder.CreateIndex(
                name: "IX_UserTicket_UserId",
                table: "UserTicket",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Country");

            migrationBuilder.DropTable(
                name: "Images");

            migrationBuilder.DropTable(
                name: "Notiffications");

            migrationBuilder.DropTable(
                name: "Payment");

            migrationBuilder.DropTable(
                name: "Posts");

            migrationBuilder.DropTable(
                name: "ReportData");

            migrationBuilder.DropTable(
                name: "Reservations");

            migrationBuilder.DropTable(
                name: "UserTicket");

            migrationBuilder.DropTable(
                name: "Tickets");

            migrationBuilder.DropTable(
                name: "Events");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "Lokacija");

            migrationBuilder.DropTable(
                name: "Grad");
        }
    }
}
