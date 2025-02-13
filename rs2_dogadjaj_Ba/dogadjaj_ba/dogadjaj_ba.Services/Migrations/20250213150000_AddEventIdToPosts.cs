using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class AddEventIdToPosts : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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
            migrationBuilder.AddColumn<int>(
        name: "eventId",
        table: "Posts",
        type: "int",
        nullable: false,
        defaultValue: 1);

            // Dodaj foreign key constraint
            migrationBuilder.CreateIndex(
                name: "IX_Posts_eventId",
                table: "Posts",
                column: "eventId");

            migrationBuilder.AddForeignKey(
                name: "FK_Posts_Events_eventId",
                table: "Posts",
                column: "eventId",
                principalTable: "Events",
                principalColumn: "EventId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(248));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(279));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(281));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(290));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(293));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(294));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(347));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(348));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(350));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(351));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 15, 53, 48, 264, DateTimeKind.Local).AddTicks(352));
        }
    }
}
