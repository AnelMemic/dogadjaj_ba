using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class fixPasswordError : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5315));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5344));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5346));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5356));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5359));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5361));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5395));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5397));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5398));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5399));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 11, 53, 12, 342, DateTimeKind.Local).AddTicks(5400));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
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
    }
}
