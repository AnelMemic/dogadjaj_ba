using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class AddedReccom : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ViewCount",
                table: "Events",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.UpdateData(
                table: "Events",
                keyColumn: "EventId",
                keyValue: 1,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "Events",
                keyColumn: "EventId",
                keyValue: 2,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "Events",
                keyColumn: "EventId",
                keyValue: 3,
                column: "ViewCount",
                value: 0);

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4375));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4409));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4412));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4445));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4448));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4450));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4480));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4481));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4483));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4484));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 19, 34, 34, 599, DateTimeKind.Local).AddTicks(4485));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ViewCount",
                table: "Events");

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1510));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1542));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1544));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1552));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1556));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1558));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1587));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1589));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1590));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1591));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 59, 59, 914, DateTimeKind.Local).AddTicks(1592));
        }
    }
}
