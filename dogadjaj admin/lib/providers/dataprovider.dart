import 'dart:convert';

import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/providers/baseprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataProvider {
  Future<List<T>> getUsersDistinctIdCount<T>() async {
    final response =
        await http.get(Uri.parse('https://localhost:7056/Users/id'));

    if (response.statusCode == 200) {
      final List<T> data = (jsonDecode(response.body) as List)
          .map<T>((json) => fromJson(json))
          .toList();

      final int distinctIdCount =
          response.headers['x-distinct-id-count'] != null
              ? int.parse(response.headers['x-distinct-id-count']!)
              : 0;

      return [data, distinctIdCount] as List<T>;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  // Similar modifications for getEventsDistinctIdCount and getTicketsDistinctIdCount

  T fromJson<T>(data) {
    throw Exception('Override method');
  }

  getEventsDistinctIdCount() {}

  getTicketsDistinctIdCount() {}
}
