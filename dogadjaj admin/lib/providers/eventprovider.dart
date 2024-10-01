import 'dart:convert';

import 'package:dogadjaj_ba/models/event.dart';
import 'package:flutter/material.dart';

import 'baseprovider.dart';

class EventProvider extends BaseProvider<Event> {
  EventProvider() : super("Eventi");

  @override
  Event fromJson(data) {
    return Event.fromJson(data);
  }

  Future<Event> saveEvent(Event event) async {
    var url = 'https://localhost:7056/Eventi';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    var jsonRequest = jsonEncode(event.toJson());

    var response = await http!.post(uri, headers: headers, body: jsonRequest);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      throw Exception(
          'Failed to update event. Status Code: ${response.statusCode}, Response: ${response.body}');
    }
  }

  Future<List<Event>> getAll() async {
    var url = 'https://localhost:7056/Eventi';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    try {
      var response = await http!.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;
        List<Event> users = data.map((json) => Event.fromJson(json)).toList();
        return users;
      } else {
        print('Error fetching users. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Exception during API call: $e');
      return [];
    }
  }
  



    Future<List<Map<String, dynamic>>> getLocations() async {
    final response = await http!.get(Uri.parse('https://localhost:7056/Lokacija'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((location) => {
        'id': location['lokacijaId'],
        'gradId': location['gradId'],
        'adresa': location['adresa'] ?? '',
        'nazivObjekta': location['nazivObjekta'] ?? ''
      }).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }


 Future<bool> updateEvent(int eventId, Event event) async {
    final response = await http!.put(
      Uri.parse('https://localhost:7056/Eventi/$eventId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(event.toJson()),
    );

   

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  

  Future<Map<String, dynamic>> getGrad(int gradId) async {
    final response = await http!.get(Uri.parse('https://localhost:7056/Grad/$gradId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load grad');
    }
  }

}

class Location {
  int id;
  String nazivObjekta;

  Location({required this.id, required this.nazivObjekta});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      nazivObjekta: json['nazivObjekta'],
    );
  }
}



class EventCategoryMapper {
  static String mapCategory(int categoryValue) {
    switch (categoryValue) {
      case 1:
        return 'Konferencija';
      case 2:
        return 'Kongres';
      case 3:
        return 'Seminar';
      case 4:
        return 'Workshop';
      case 5:
        return 'Sastanci';
      case 6:
        return 'Sajmovi';
      default:
        return 'Unknown Category';
    }
  }
}
