import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/SearchObjects/ticket_search_object.dart';
import 'package:mobile/models/ticket.dart';
import 'package:mobile/providers/base_provider.dart';

class TicketProvider extends BaseProvider<Ticket> {
  TicketProvider() : super("Ticket");

  Future<List<Ticket>> getPaged({TicketSearchObject? searchObject}) async {
    var url = 'http://10.0.2.2:7056/Ticket/getPaged';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';
    final Map<String, String> queryParameters = {};
    if (searchObject != null) {
      if (searchObject.eventId != null) {
        queryParameters['eventId'] = searchObject.eventId.toString();
      }
      if (searchObject.userId != null) {
        queryParameters['userId'] = searchObject.userId.toString();
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
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data.map((d) => fromJson(d)).cast<Ticket>().toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Ticket fromJson(data) {
    // TODO: implement fromJson
    return Ticket.fromJson(data);
  }
}
