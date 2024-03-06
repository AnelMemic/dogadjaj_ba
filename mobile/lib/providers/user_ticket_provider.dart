import 'dart:convert';

import 'package:mobile/constants.dart';
import 'package:mobile/models/SearchObjects/user_ticket_search_object.dart';
import 'package:mobile/models/user_ticket.dart';
import 'base_provider.dart';

class UserTicketProvider extends BaseProvider<UserTicket> {
  UserTicketProvider() : super("UserTicket");


 Future<List<UserTicket>> getUserById(UserTicketSearchObject searchObject) async {
    var url = '$apiUrl/UserTicket/getByUserId';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';
    final Map<String, String> queryParameters = {};

   if (searchObject != null) {
      if (searchObject.userId != null) {
        queryParameters['userId'] = searchObject.userId.toString();
      }
    }

    uri = uri.replace(queryParameters: queryParameters);


     final response = await http!.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data.map((d) => fromJson(d)).cast<UserTicket>().toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  UserTicket fromJson(data) {
    return UserTicket.fromJson(data);
  }
}
