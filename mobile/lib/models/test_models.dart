import 'package:flutter/material.dart';

class EventType {
  final String title;
  final IconData icon;
  final Color? color;

  EventType({required this.title, required this.icon, this.color});
}

class Event {
  final String eventName;
  final String location;
  final String date;
  final String logo;
  final Color color;

  Event({
    required this.eventName,
    required this.location,
    required this.date,
    required this.logo,
    required this.color,
  });
}

final List<EventType> eventTypes = [
  EventType(title: 'Konferencije', icon: Icons.event, color: Colors.blue),
  EventType(title: 'Kongresi', icon: Icons.business, color: Colors.orange),
  EventType(title: 'Seminari', icon: Icons.school, color: Colors.teal),
  EventType(title: 'Workshops', icon: Icons.work, color: Colors.amberAccent),
  EventType(title: 'Sastanci', icon: Icons.people, color: Colors.brown),
  EventType(title: 'Sajmovi', icon: Icons.location_on, color: Colors.green),
];

final List<EventType> eventCategories = [
  EventType(title: 'Gradjevinstvo', icon: Icons.event, color: Colors.blue),
  EventType(title: 'Situacije', icon: Icons.business, color: Colors.orange),
  EventType(title: 'Memoari', icon: Icons.school, color: Colors.teal),
  EventType(title: 'Testiranje', icon: Icons.work, color: Colors.amberAccent),
  EventType(title: 'Anel Memic', icon: Icons.people, color: Colors.brown),
  EventType(
      title: 'Sajmovi i opaske', icon: Icons.location_on, color: Colors.green),
];

final List<Event> events = [
  Event(
      eventName: 'Event 1111111111111111111111',
      location: 'Location 1',
      date: '2023-10-25',
      logo: 'assets/images/logo.png',
      color: Colors.black),
  Event(
      eventName: 'Event 22222222222222222',
      location: 'Location 2',
      date: '2023-11-15',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 209, 69, 69)),
  Event(
      eventName: 'Event 3333333333333333',
      location: 'Location 3',
      date: '2023-12-05',
      logo: 'assets/images/logo.png',
      color: Colors.amber),
  Event(
      eventName: 'Event 4444444444444444444',
      location: 'Location 4',
      date: '2023-11-28',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 63, 54, 26)),
  Event(
      eventName: 'Event 555555555555',
      location: 'Location 5',
      date: '2023-10-30',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 34, 98, 194)),
  Event(
      eventName: 'Event 66666666666666666',
      location: 'Location 6',
      date: '2023-11-10',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 194, 34, 186)),
  Event(
      eventName: 'Event 7777777777777',
      location: 'Location 7',
      date: '2023-12-15',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 81, 37, 241)),
  Event(
      eventName: 'Event 8888888888888',
      location: 'Location 8',
      date: '2023-10-19',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 231, 64, 59)),
  Event(
      eventName: 'Event 99999999999999999999',
      location: 'Location 9',
      date: '2023-12-08',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 240, 123, 234)),
  Event(
      eventName: 'Event 10000000000000',
      location: 'Location 10',
      date: '2023-11-05',
      logo: 'assets/images/logo.png',
      color: const Color.fromARGB(255, 34, 194, 47)),
];
