import 'dart:convert';

import 'package:dogadjaj_ba/helpers/constants.dart';
import 'package:dogadjaj_ba/models/notifications.dart';
import 'package:dogadjaj_ba/models/searchObjects/notification_search_object.dart';
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/providers/baseprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NotificationProvider extends BaseProvider<Notifications> {
  NotificationProvider() : super("Notification");

  @override
  Notifications fromJson(data) {
    // TODO: implement fromJson
    return Notifications.fromJson(data);
  }

  Future<List<Notifications>> getAll() async {
    var url =
        'https://localhost:7056/Notification'; // Replace with your API endpoint
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    try {
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;
        List<Notifications> notifications =
            data.map((json) => Notifications.fromJson(json)).toList();
        print(notifications);
        return notifications;
      } else {
        print(
            'Error fetching notifications. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return []; // Return an empty list in case of an error
      }
    } catch (e) {
      print('Exception during API call: $e');
      return []; // Return an empty list in case of an exception
    }
  }

  Future<List<Notifications>> getPaged(
      {NotificationsSearchObject? searchObject}) async {
    var uri = Uri.parse('$apiUrl/Notification');

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    final Map<String, String> queryParameters = {};
    if (searchObject != null) {
      if (searchObject.content != null) {
        queryParameters['content'] = searchObject.content!;
      }

      if (searchObject.userId != null) {
        queryParameters['userId'] = searchObject.userId.toString();
      }

      if (searchObject.seen != null) {
        queryParameters['seen'] = searchObject.seen.toString();
      }
      if (searchObject.PageNumber != null) {
        queryParameters['PageNumber'] = searchObject.PageNumber.toString();
      }
      if (searchObject.PageSize != null) {
        queryParameters['PageSize'] = searchObject.PageSize.toString();
      }
    }
    uri = uri.replace(queryParameters: queryParameters);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var items = data['items'];
      return items.map((d) => fromJson(d)).cast<Notifications>().toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
//  Future<Event> saveEvent(Event event) async {
//     var url = 'https://localhost:7056/Eventi';
//     var uri = Uri.parse(url);

//     Map<String, String> headers = createHeaders();
//     headers['Content-Type'] = 'application/json';

//     var jsonRequest = jsonEncode(event.toJson());

//     var response = await http!.post(uri, headers: headers, body: jsonRequest);

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       return fromJson(data);
//     } else {
//       throw Exception(
//           'Failed to update event. Status Code: ${response.statusCode}, Response: ${response.body}');
//     }
//   }
  Future<dynamic> sendRabbitNotification(dynamic object) async {
    var url = 'https://localhost:7144/api/Notification/SendNotification';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    var jsonRequest = jsonEncode(object);

    var response = await http.post(uri, headers: headers, body: jsonRequest);

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      throw Exception(
          'Failed to add notification. Status Code: ${response.statusCode}, Response: ${response.body}');
    }
  }
}
