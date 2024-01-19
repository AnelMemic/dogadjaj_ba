import 'package:mobile/models/ticket.dart';
import 'package:mobile/models/user.dart';

class UserTicket {
  late int userTicketID;

  late User? user;
  late int? userID;

  late Ticket? ticket;
  late int? ticketID;

  UserTicket({
    required this.userTicketID,
    this.user,
    this.userID,
    this.ticket,
    this.ticketID,
  });

  UserTicket.fromJson(Map<String, dynamic> json) {
    userTicketID = json['userTicketID'];
    userID = json['userID'];
    ticketID = json['ticketID'];
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    } else {
      user = null;
    }
    if (json['ticket'] != null) {
      ticket = Ticket.fromJson(json['ticket']);
    } else {
      user = null;
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}
