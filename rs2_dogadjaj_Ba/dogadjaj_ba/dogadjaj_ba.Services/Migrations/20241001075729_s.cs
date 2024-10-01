using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class s : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9578));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9605));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9607));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9616));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9619));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9621));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9667));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9669));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9670));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9671));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 5,
                column: "PublishDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9672));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9673));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1,
                column: "ReservationDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9681));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2,
                column: "ReservationDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9683));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3,
                column: "ReservationDate",
                value: new DateTime(2024, 10, 1, 9, 57, 29, 176, DateTimeKind.Local).AddTicks(9684));

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 1,
                columns: new[] { "ImePrezime", "KorisnickoIme", "Sifra" },
                values: new object[] { "admin", "admin", "admin" });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 2,
                columns: new[] { "KorisnickoIme", "Sifra" },
                values: new object[] { "mobile", "mobile" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5596));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5646));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5649));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5656));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5659));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5661));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5689));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5691));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5692));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5693));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 5,
                column: "PublishDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5694));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5695));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1,
                column: "ReservationDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5704));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2,
                column: "ReservationDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5705));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3,
                column: "ReservationDate",
                value: new DateTime(2024, 9, 30, 13, 50, 53, 155, DateTimeKind.Local).AddTicks(5706));

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 1,
                columns: new[] { "ImePrezime", "KorisnickoIme", "Sifra" },
                values: new object[] { "t1", "dogadjaj1", "test" });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 2,
                columns: new[] { "KorisnickoIme", "Sifra" },
                values: new object[] { "dogadjaj2", "test" });
        }
    }
}
