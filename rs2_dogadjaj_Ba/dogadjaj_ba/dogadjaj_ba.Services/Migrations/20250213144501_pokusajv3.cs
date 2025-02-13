using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class pokusajv3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(497));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(526));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(528));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(538));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(541));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(543));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(602));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(604));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(605));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(606));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 45, 1, 485, DateTimeKind.Local).AddTicks(607));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(568));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(638));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(640));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(657));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(660));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(662));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(692));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(694));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(695));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(696));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 13, 39, 19, 355, DateTimeKind.Local).AddTicks(697));
        }
    }
}
