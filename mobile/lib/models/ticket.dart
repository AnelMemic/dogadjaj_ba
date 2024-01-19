class Ticket {
  late int ticketId;
  late int? userId;
  late int? eventId;
  late double? cijena;
  late String? title; 
  late String? description; 
  late String? ticketNumber; 
  late int? available; 

  Ticket({
    required this.ticketId,
    this.userId,
    this.eventId,
    this.cijena,
    this.title,
    this.description,
    this.ticketNumber,
    this.available,
  });

  Ticket.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    userId = json['userId'];
    eventId = json['eventId'];
    cijena = json['cijena'];
    title = json['title'];
    description = json['description'];
    ticketNumber = json['ticketNumber'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketId'] = ticketId;
    data['userId'] = userId;
    data['eventId'] = eventId;
    data['cijena'] = cijena;
    data['title'] = title;
    data['description'] = description;
    data['ticketNumber'] = ticketNumber;
    data['available'] = available;

    return data;
  }
}
