import 'package:flutter/material.dart';

class Event {
  late int eventId;
  late int? lokacijaId;
  late int? eventType;
  late int? subType;
  late String? eventName;
  late DateTime? eventDate;
  late String? stateMachine;
  late String? eventImage;
  late String? opis;

  Event(
      {required this.eventId,
      this.lokacijaId,
      this.eventType,
      this.eventName,
      this.eventDate,
      this.stateMachine,
      this.eventImage,
      this.opis,
      this.subType});

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    eventName = json['eventName'];
    eventType = json['eventType'];
    eventName = json['eventName'];
    eventDate = DateTime.parse(json['eventDate']);
    stateMachine = json['stateMachine'];
    eventImage = json['eventImage'];
    opis = json['opis'];
    subType = json['subType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['eventName'] = eventName;
    data['eventType'] = eventType;
    data['opis'] = opis;
    data['subType'] = subType;
    return data;
  }

  static List<DropdownMenuItem<Event>> getEventDropdownItems(
      List<Event> events) {
    return events.map((event) {
      return DropdownMenuItem<Event>(
        value: event,
        child: Text(event.eventName ?? 'N/A'),
      );
    }).toList();
  }
}
