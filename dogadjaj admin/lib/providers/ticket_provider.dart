import 'dart:convert';

import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/providers/baseprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TicketProvider extends BaseProvider<Ticket> {
  TicketProvider() : super("Ticket");

  @override
  Ticket fromJson(data) {
    // TODO: implement fromJson
    return Ticket.fromJson(data);
  }

  Future<List<Ticket>> getAll() async {
    var url = 'http://localhost:7056/User'; // Replace with your API endpoint
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    try {
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;
        List<Ticket> users = data.map((json) => Ticket.fromJson(json)).toList();
        return users;
      } else {
        print('Error fetching users. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return []; // Return an empty list in case of an error
      }
    } catch (e) {
      print('Exception during API call: $e');
      return []; // Return an empty list in case of an exception
    }
  }
}
