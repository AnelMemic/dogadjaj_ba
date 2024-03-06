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
    var url = 'http://localhost:7056/Eventi';
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
    var url = 'http://localhost:7056/Eventi';
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
