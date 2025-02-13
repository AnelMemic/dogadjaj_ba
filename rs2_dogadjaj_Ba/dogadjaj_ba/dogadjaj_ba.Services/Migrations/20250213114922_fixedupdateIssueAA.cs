using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class fixedupdateIssueAA : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7311));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7343));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7345));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7352));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7355));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7356));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7386));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7388));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7389));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7390));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 49, 22, 834, DateTimeKind.Local).AddTicks(7391));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8736));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8765));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8767));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8773));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8777));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8779));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8826));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8828));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8829));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8830));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2025, 2, 13, 12, 32, 24, 140, DateTimeKind.Local).AddTicks(8831));
        }
    }
}
