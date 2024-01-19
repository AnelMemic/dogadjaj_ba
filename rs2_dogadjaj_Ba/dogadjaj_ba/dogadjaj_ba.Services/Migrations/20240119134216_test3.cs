using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class test3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "EventId",
                table: "UserTicket",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserTicket_EventId",
                table: "UserTicket",
                column: "EventId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserTicket_Events_EventId",
                table: "UserTicket",
                column: "EventId",
                principalTable: "Events",
                principalColumn: "EventId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserTicket_Events_EventId",
                table: "UserTicket");

            migrationBuilder.DropIndex(
                name: "IX_UserTicket_EventId",
                table: "UserTicket");

            migrationBuilder.DropColumn(
                name: "EventId",
                table: "UserTicket");
        }
    }
}
