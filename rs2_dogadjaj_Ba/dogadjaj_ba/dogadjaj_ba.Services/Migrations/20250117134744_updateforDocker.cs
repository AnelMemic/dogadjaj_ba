using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class updateforDocker : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2457));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2488));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2490));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2521));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2523));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2525));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2554));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2555));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2557));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2558));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 1, 17, 14, 47, 44, 279, DateTimeKind.Local).AddTicks(2559));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5444));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5473));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5475));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5482));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5485));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5487));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5513));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5514));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5516));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5517));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2024, 12, 13, 15, 13, 31, 146, DateTimeKind.Local).AddTicks(5518));
        }
    }
}
