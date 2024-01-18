class Event  {
  late int eventId;
  late int? lokacijaId;
  late int? eventTypeId;
  late String? eventName;
  late DateTime? eventDate;
  late String? stateMachine;
  late String? eventImage;
  late String? opis;

  Event({
    required this.eventId,
    this.lokacijaId,
    this.eventTypeId,
    this.eventName,
    this.eventDate,
    this.stateMachine,
    this.eventImage,
    this.opis,
  });

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    eventName = json['eventName'];
    eventTypeId = json['eventTypeId'];
    eventName = json['eventName'];
    eventDate = DateTime.parse(json['eventDate']);
    stateMachine = json['stateMachine'];
    eventImage = json['eventImage'];
    opis = json['opis'];
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['eventName'] = eventName;
    data['eventTypeId'] = eventTypeId;
    data['opis'] = opis;

    return data;
  }
}
