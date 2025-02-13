class Event {
  final int? eventId;
  final String? eventName;
  final int? lokacijaId; 
  final DateTime? eventDate;
  final int? eventTypeId;
  final int? subType;
  final String? opis;
  final String? stateMachine;
  final String? eventImage;

  Event({
    this.eventId,
    this.eventName,
    this.lokacijaId, 
    this.eventDate,
    this.eventTypeId,
    this.subType,
    this.opis,
    this.stateMachine,
    this.eventImage,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['eventId'],
      eventName: json['eventName'] ?? "Nepoznat događaj",
      lokacijaId: json['lokacijaId'], 
      eventDate: json['eventDate'] != null ? DateTime.parse(json['eventDate']) : null,
      eventTypeId: json['eventType'],
      subType: json['subType'],
      opis: json['opis'],
      stateMachine: json['stateMachine'],
      eventImage: json['eventImage'],
    );
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['eventName'] = eventName;
    data['eventTypeId'] = eventTypeId;
    data['opis'] = opis;
 data['lokacijaId'] = lokacijaId;
    return data;
  }

}