class Ticket  {
  late int ticketId;
  late int userId;
  late int eventId;
  late double? cijena;

  Ticket({
    required this.ticketId,
    required this.userId,
    required this.eventId,
     this. cijena,
  });

  Ticket.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    userId = json['userId'];
    eventId = json['eventId'];
    cijena = json['cijena'];
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketId'] = ticketId;
    data['userId'] = userId;
    data['eventId'] = eventId;
    data['cijena'] = cijena;

    return data;
  }
}