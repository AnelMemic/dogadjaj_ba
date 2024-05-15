import 'dart:convert';

import 'package:mobile/constants.dart';
import 'package:mobile/models/SearchObjects/event_search_object.dart';

import '../models/event.dart';
import 'base_provider.dart';

class EventProvider extends BaseProvider<Event> {
  EventProvider() : super("Eventi");

  Future<List<Event>> getPaged({EventSearchObject? searchObject}) async {
    var url = '$apiUrl/Eventi/getEvents';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';
    final Map<String, String> queryParameters = {};
    if (searchObject != null) {
      if (searchObject.PodKategorija != null) {
        queryParameters['PodKategorija'] =
            searchObject.PodKategorija.toString();
      }
      if (searchObject.kategorija != null) {
        queryParameters['kategorija'] = searchObject.kategorija.toString();
      }
      if (searchObject.Page != null) {
        queryParameters['Page'] = searchObject.Page.toString();
      }
      if (searchObject.PageSize != null) {
        queryParameters['PageSize'] = searchObject.PageSize.toString();
      }
    }
    uri = uri.replace(queryParameters: queryParameters);
    final response = await http!.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      return data.map((d) => fromJson(d)).cast<Event>().toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Event fromJson(data) {
    return Event.fromJson(data);
  }
}
