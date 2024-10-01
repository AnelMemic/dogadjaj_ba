import 'dart:convert';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/providers/baseprovider.dart';

class TicketProvider extends BaseProvider<Ticket> {
  TicketProvider() : super("Ticket");

  @override
  Ticket fromJson(data) {
    return Ticket.fromJson(data);
  }

  Future<bool> insertTickets(Ticket ticket) async {
    final requestBody = jsonEncode(ticket.toJson());
    final response = await http.post(
      Uri.parse('https://localhost:7056/Ticket'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBody,
    );

   
    print('Request: $requestBody'); // Log the request
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      // Log the error without throwing an exception
      print('Failed to insert ticket: ${response.body}');
      return false;
    }
  }

      Future<bool> updateTicket(Ticket ticket) async {
    final response = await http.put(
      Uri.parse('https://localhost:7056/Ticket/${ticket.ticketId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ticket.toJson()),
    );

    return response.statusCode == 200;
  }



  Future<List<Ticket>> getTicket() async {
    final response = await http.get(Uri.parse('https://localhost:7056/Ticket'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((ticket) => Ticket.fromJson(ticket)).toList();
    } else {
      throw Exception('Failed to load tickets');
    }
  }

  Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse('https://localhost:7056/User/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<Event> getEvent(int eventId) async {
    final response = await http.get(Uri.parse('https://localhost:7056/Eventi/$eventId'));

    if (response.statusCode == 200) {
      return Event.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }

  Future<List<Ticket>> getAll() async {
    var url = 'https://localhost:7056/Ticket';
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    headers['Content-Type'] = 'application/json';

    try {
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;
        List<Ticket> tickets = data.map((json) => Ticket.fromJson(json)).toList();
        return tickets;
      } else {
        print('Error fetching tickets. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Exception during API call: $e');
      return [];
    }
  }
}
