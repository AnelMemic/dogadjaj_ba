using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class databaseSeed : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK__Tickets__EventId__5535A963",
                table: "Tickets");

            migrationBuilder.AlterColumn<int>(
                name: "EventId",
                table: "Tickets",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9789));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9824));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9827));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9840));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9844));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9846));

            migrationBuilder.InsertData(
                table: "Posts",
                columns: new[] { "Id", "PublishDate", "content", "title" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9917), "Pridružite nam se na koncertu u Mostaru, zabava je zagarantovana!", "Koncert u Mostaru!" },
                    { 2, new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9920), "Novi događaj u Sarajevu, pogledajte naše događaje i kupite kartu!", "Novi događaj!" },
                    { 3, new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9921), "Dođite na filmski festival u Banjoj Luci i uživajte u najnovijim filmovima!", "Filmski Festival" },
                    { 4, new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9923), "Pozivamo vas na umjetničku izložbu u Tuzli, inspirativna djela očekuju vas!", "Umjetnička Izložba" },
                    { 5, new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9924), "Sportski događaj godine u Zenici! Ne propustite spektakl.", "Sportski Spektakl" },
                    { 6, new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9926), "Pripremite se za tehnološku konferenciju u Mostaru, najnoviji trendovi i inovacije.", "Tehnološka Konferencija" }
                });

            migrationBuilder.AddForeignKey(
                name: "FK__Tickets__EventId__5535A963",
                table: "Tickets",
                column: "EventId",
                principalTable: "Events",
                principalColumn: "EventId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK__Tickets__EventId__5535A963",
                table: "Tickets");

            migrationBuilder.DeleteData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.AlterColumn<int>(
                name: "EventId",
                table: "Tickets",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 1,
                column: "SendOnDate",
                value: new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9827));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 2,
                column: "SendOnDate",
                value: new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9859));

            migrationBuilder.UpdateData(
                table: "Notiffications",
                keyColumn: "Id",
                keyValue: 3,
                column: "SendOnDate",
                value: new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9861));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 1,
                column: "PaymentDate",
                value: new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9875));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                column: "PaymentDate",
                value: new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9878));

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                column: "PaymentDate",
                value: new DateTime(2024, 7, 2, 18, 25, 4, 113, DateTimeKind.Local).AddTicks(9881));

            migrationBuilder.AddForeignKey(
                name: "FK__Tickets__EventId__5535A963",
                table: "Tickets",
                column: "EventId",
                principalTable: "Events",
                principalColumn: "EventId");
        }
    }
}
