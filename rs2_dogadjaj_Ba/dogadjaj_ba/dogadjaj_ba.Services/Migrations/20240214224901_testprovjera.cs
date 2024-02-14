using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class testprovjera : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Grad",
                columns: new[] { "GradId", "Drzava", "ImeGrada" },
                values: new object[,]
                {
                    { 1, "BIH", "Mostar" },
                    { 2, "BIH", "Sarajevo" },
                    { 3, "BIH", "Banja Luka" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Grad",
                keyColumn: "GradId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Grad",
                keyColumn: "GradId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Grad",
                keyColumn: "GradId",
                keyValue: 3);
        }
    }
}
