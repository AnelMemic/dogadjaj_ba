using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class a : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Country",
                columns: new[] { "countryId", "name" },
                values: new object[,]
                {
                    { 1, "BIH" },
                    { 2, "CRO" },
                    { 3, "SRB" }
                });

            migrationBuilder.UpdateData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 1,
                column: "Adresa",
                value: "Mostar ");

            migrationBuilder.UpdateData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 2,
                column: "Adresa",
                value: "Bisce polje");

            migrationBuilder.UpdateData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 3,
                column: "Adresa",
                value: "MostarGrad");

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 6, 11, 21, 14, 52, 851, DateTimeKind.Local).AddTicks(1362));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 6, 11, 21, 14, 52, 851, DateTimeKind.Local).AddTicks(1395));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 6, 11, 21, 14, 52, 851, DateTimeKind.Local).AddTicks(1397));

            migrationBuilder.InsertData(
                table: "Payment",
                columns: new[] { "PaymentId", "PaymentDate", "PaymentMethod", "PaymentStatus" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 6, 11, 21, 14, 52, 851, DateTimeKind.Local).AddTicks(1405), "card", "true" },
                    { 2, new DateTime(2024, 6, 11, 21, 14, 52, 851, DateTimeKind.Local).AddTicks(1408), "card", "true" },
                    { 3, new DateTime(2024, 6, 11, 21, 14, 52, 851, DateTimeKind.Local).AddTicks(1410), "card", "true" }
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
                table: "UserTicket",
                columns: new[] { "UserTicketID", "Kolicina", "TicketId", "UserId" },
                values: new object[,]
                {
                    { 1, 1, 1, 1 },
                    { 2, 1, 1, 1 },
                    { 3, 1, 1, 1 }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Country",
                keyColumn: "countryId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Country",
                keyColumn: "countryId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Country",
                keyColumn: "countryId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "ReportData",
                keyColumn: "ReportDataId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "ReportData",
                keyColumn: "ReportDataId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "ReportData",
                keyColumn: "ReportDataId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "UserTicket",
                keyColumn: "UserTicketID",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "UserTicket",
                keyColumn: "UserTicketID",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "UserTicket",
                keyColumn: "UserTicketID",
                keyValue: 3);

            migrationBuilder.UpdateData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 1,
                column: "Adresa",
                value: "Mostar 88000");

            migrationBuilder.UpdateData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 2,
                column: "Adresa",
                value: "Mostar 88000");

            migrationBuilder.UpdateData(
                table: "Lokacija",
                keyColumn: "LokacijaId",
                keyValue: 3,
                column: "Adresa",
                value: "Mostar 88000");

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 6, 11, 19, 8, 9, 866, DateTimeKind.Local).AddTicks(7257));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 6, 11, 19, 8, 9, 866, DateTimeKind.Local).AddTicks(7289));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 6, 11, 19, 8, 9, 866, DateTimeKind.Local).AddTicks(7291));
        }
    }
}
