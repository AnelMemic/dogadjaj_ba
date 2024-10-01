using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class _ : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3275));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3302));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3304));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3313));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3315));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3317));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3349));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3350));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3352));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3353));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 5,
                column: "PublishDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3354));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3355));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1,
                column: "ReservationDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3362));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2,
                column: "ReservationDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3364));

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3,
                column: "ReservationDate",
                value: new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3365));
        }
    }
}
