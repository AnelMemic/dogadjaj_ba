using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace dogadjaj_ba.Services.Migrations
{
    /// <inheritdoc />
    public partial class test4 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserTicket_Events_EventId",
                table: "UserTicket");

            migrationBuilder.DropForeignKey(
                name: "FK_UserTicket_Tickets_TicketId",
                table: "UserTicket");

            migrationBuilder.DropForeignKey(
                name: "FK_UserTicket_Users_UserId",
                table: "UserTicket");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserTicket",
                table: "UserTicket");

            migrationBuilder.DropIndex(
                name: "IX_UserTicket_EventId",
                table: "UserTicket");

            migrationBuilder.DropColumn(
                name: "EventId",
                table: "UserTicket");

            migrationBuilder.AddPrimaryKey(
                name: "PK__UserTick__5B0E19B06A29E69D",
                table: "UserTicket",
                column: "UserTicketID");

            migrationBuilder.AddForeignKey(
                name: "FK__UserTicket__TicketId__87654321",
                table: "UserTicket",
                column: "TicketId",
                principalTable: "Tickets",
                principalColumn: "TicketId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK__UserTicket__UserId__12345678",
                table: "UserTicket",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK__UserTicket__TicketId__87654321",
                table: "UserTicket");

            migrationBuilder.DropForeignKey(
                name: "FK__UserTicket__UserId__12345678",
                table: "UserTicket");

            migrationBuilder.DropPrimaryKey(
                name: "PK__UserTick__5B0E19B06A29E69D",
                table: "UserTicket");

            migrationBuilder.AddColumn<int>(
                name: "EventId",
                table: "UserTicket",
                type: "int",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserTicket",
                table: "UserTicket",
                column: "UserTicketID");

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

            migrationBuilder.AddForeignKey(
                name: "FK_UserTicket_Tickets_TicketId",
                table: "UserTicket",
                column: "TicketId",
                principalTable: "Tickets",
                principalColumn: "TicketId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserTicket_Users_UserId",
                table: "UserTicket",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "UserId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
