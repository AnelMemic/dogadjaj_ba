import 'package:dogadjaj_ba/models/event.dart';

class Ticket {
  final int ticketId;
  final int userId;
  final int eventId;
  final double? cijena;
  final String? description;
  final String title;
  final String ticketNumber;
  final int available;
  final Event? event;

  Ticket({
    required this.ticketId,
    required this.userId,
    required this.eventId,
    this.cijena,
    required this.description,
    required this.title,
    required this.ticketNumber,
    required this.available,
    this.event,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      ticketId: json['ticketId'],
      userId: json['userId'],
      eventId: json['eventId'],
      cijena: json['cijena']?.toDouble(),
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      ticketNumber: json['ticketNumber'] ?? '',
      available: json['available'] ?? 0,
      event: json['event'] != null ? Event.fromJson(json['event']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'ticketId': ticketId,
      'userId': userId,
      'eventId': eventId,
      'cijena': cijena,
      'description': description,
      'title': title,
      'ticketNumber': ticketNumber,
      'available': available,
    };

    if (event != null) {
      data['event'] = event!.toJson();
    }

    return data;
  }
}
