using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class fixes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "userId",
                table: "Payment",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "eventId",
                table: "Images",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CountryId",
                table: "Grad",
                type: "int",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Grad",
                keyColumn: "GradId",
                keyValue: 1,
                column: "CountryId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Grad",
                keyColumn: "GradId",
                keyValue: 2,
                column: "CountryId",
                value: null);

            migrationBuilder.UpdateData(
                table: "Grad",
                keyColumn: "GradId",
                keyValue: 3,
                column: "CountryId",
                value: null);

            migrationBuilder.InsertData(
                table: "Images",
                columns: new[] { "id", "eventId", "url" },
                values: new object[,]
                {
                    { 1, 3, "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg" },
                    { 2, 1, "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg" },
                    { 3, 2, "https://spotme.com/wp-content/uploads/2020/07/Hero-1.jpg" }
                });

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
                columns: new[] { "PaymentDate", "userId" },
                values: new object[] { new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3313), null });

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 2,
                columns: new[] { "PaymentDate", "userId" },
                values: new object[] { new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3315), null });

            migrationBuilder.UpdateData(
                table: "Payment",
                keyColumn: "PaymentId",
                keyValue: 3,
                columns: new[] { "PaymentDate", "userId" },
                values: new object[] { new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3317), null });

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

            migrationBuilder.InsertData(
                table: "Reservations",
                columns: new[] { "ReservationId", "ReservationDate", "UserId" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3362), 1 },
                    { 2, new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3364), 1 },
                    { 3, new DateTime(2024, 8, 25, 21, 1, 23, 672, DateTimeKind.Local).AddTicks(3365), 1 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Payment_userId",
                table: "Payment",
                column: "userId");

            migrationBuilder.CreateIndex(
                name: "IX_Images_eventId",
                table: "Images",
                column: "eventId");

            migrationBuilder.CreateIndex(
                name: "IX_Grad_CountryId",
                table: "Grad",
                column: "CountryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Grad_Country_CountryId",
                table: "Grad",
                column: "CountryId",
                principalTable: "Country",
                principalColumn: "countryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Images_Events_eventId",
                table: "Images",
                column: "eventId",
                principalTable: "Events",
                principalColumn: "EventId");

            migrationBuilder.AddForeignKey(
                name: "FK_Payment_Users_userId",
                table: "Payment",
                column: "userId",
                principalTable: "Users",
                principalColumn: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Grad_Country_CountryId",
                table: "Grad");

            migrationBuilder.DropForeignKey(
                name: "FK_Images_Events_eventId",
                table: "Images");

            migrationBuilder.DropForeignKey(
                name: "FK_Payment_Users_userId",
                table: "Payment");

            migrationBuilder.DropIndex(
                name: "IX_Payment_userId",
                table: "Payment");

            migrationBuilder.DropIndex(
                name: "IX_Images_eventId",
                table: "Images");

            migrationBuilder.DropIndex(
                name: "IX_Grad_CountryId",
                table: "Grad");

            migrationBuilder.DeleteData(
                table: "Images",
                keyColumn: "id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Images",
                keyColumn: "id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Images",
                keyColumn: "id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3);

            migrationBuilder.DropColumn(
                name: "userId",
                table: "Payment");

            migrationBuilder.DropColumn(
                name: "eventId",
                table: "Images");

            migrationBuilder.DropColumn(
                name: "CountryId",
                table: "Grad");

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

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1,
                column: "PublishDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9917));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 2,
                column: "PublishDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9920));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 3,
                column: "PublishDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9921));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 4,
                column: "PublishDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9923));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 5,
                column: "PublishDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9924));

            migrationBuilder.UpdateData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 6,
                column: "PublishDate",
                value: new DateTime(2024, 7, 5, 16, 51, 8, 463, DateTimeKind.Local).AddTicks(9926));
        }
    }
}
