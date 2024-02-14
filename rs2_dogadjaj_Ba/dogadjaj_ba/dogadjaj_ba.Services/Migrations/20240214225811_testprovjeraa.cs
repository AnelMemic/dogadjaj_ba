using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class testprovjeraa : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Lokacija",
                columns: new[] { "LokacijaId", "GradId" },
                values: new object[,]
                {
                    { 1, 2 },
                    { 2, 1 },
                    { 3, 1 }
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "UserId", "Email", "ImePrezime", "KorisnickoIme", "Sifra" },
                values: new object[,]
                {
                    { 1, "test@test", "t1", "dogadjaj1", "test" },
                    { 2, "test@test", "t2", "dogadjaj2", "test" },
                    { 3, "test@test", "t3", "dogadjaj3", "test" }
                });

            migrationBuilder.InsertData(
                table: "Events",
                columns: new[] { "EventId", "EventDate", "EventImage", "EventName", "LokacijaId", "Opis", "StateMachine", "eventType", "subType" },
                values: new object[,]
                {
                    { 1, new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local), null, "Test1", 1, "Test", null, 0, 0 },
                    { 2, new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local), null, "Test2", 1, "Test", null, 0, 0 },
                    { 3, new DateTime(2023, 2, 1, 0, 0, 0, 0, DateTimeKind.Local), null, "Test3", 1, "Test", null, 0, 0 }
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
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Tickets",
                keyColumn: "TicketId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Tickets",
                keyColumn: "TicketId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Tickets",
                keyColumn: "TicketId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Events",
                keyColumn: "EventId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Events",
                keyColumn: "EventId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Events",
                keyColumn: "EventId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 1);
        }
    }
}
