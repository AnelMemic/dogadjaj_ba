import 'dart:ui';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/screens/add_ticket_screen.dart';

class KarteScreen extends StatefulWidget {
  const KarteScreen({Key? key}) : super(key: key);

  @override
  State<KarteScreen> createState() => _KarteScreenState();
}

class _KarteScreenState extends State<KarteScreen> {
  final ScrollController controller = ScrollController();
  final TicketProvider ticketProvider = TicketProvider();
  List<Ticket> tickets = [];

  @override
  void initState() {
    super.initState();
    fetchTickets();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> fetchTickets() async {
    try {
      tickets = await ticketProvider.getTicket();
      print("Fetched Tickets: $tickets"); 
      setState(() {});
    } catch (e) {
      print("Error fetching tickets: $e");
    }
  }

  Future<Map<int, String>> fetchUserNames(List<int> userIds) async {
    Map<int, String> userNames = {};
    for (int userId in userIds) {
      User user = await ticketProvider.getUser(userId);
      userNames[userId] = user.korisnickoIme ?? 'Unknown User';
    }
    return userNames;
  }

  Future<Map<int, String>> fetchEventNames(List<int> eventIds) async {
    Map<int, String> eventNames = {};
    for (int eventId in eventIds) {
      Event event = await ticketProvider.getEvent(eventId);
      eventNames[eventId] = event.eventName ?? 'Unknown Event';
    }
    return eventNames;
  }

  void _openAddTicketScreen(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddTicketScreen(),
      ),
    );

    if (result == true) {
      await fetchTickets();
    }
  }

  void _openEditTicketScreen(BuildContext context, Ticket ticket) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTicketScreen(ticket: ticket),
      ),
    );

    if (result == true) {
      await fetchTickets();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregled karata'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.add, size: 24.0),
            label: Text('Add Karte', style: TextStyle(fontSize: 18.0)),
            onPressed: () {
              _openAddTicketScreen(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, 
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Ticket>>(
        future: ticketProvider.getTicket(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            tickets = snapshot.data ?? [];

           
            List<int> userIds = tickets.map((ticket) => ticket.userId).toSet().toList();
            List<int> eventIds = tickets.map((ticket) => ticket.eventId).toSet().toList();

            return FutureBuilder<List<dynamic>>(
              future: Future.wait([
                fetchUserNames(userIds),
                fetchEventNames(eventIds),
              ]),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  Map<int, String> userNames = snapshot.data![0] as Map<int, String>;
                  Map<int, String> eventNames = snapshot.data![1] as Map<int, String>;

                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pregled karata",
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Scrollbar(
                            controller: controller,
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context).copyWith(
                                dragDevices: {PointerDeviceKind.mouse},
                              ),
                              child: SingleChildScrollView(
                                controller: controller,
                                child: DataTable(
                                  border: const TableBorder(
                                    right: BorderSide(),
                                    left: BorderSide(),
                                    top: BorderSide(),
                                    bottom: BorderSide(),
                                    verticalInside: BorderSide(),
                                    horizontalInside: BorderSide(),
                                  ),
                                  columns: const [
                                    DataColumn(label: Text('User Name')),
                                    DataColumn(label: Text('Event Name')),
                                    DataColumn(label: Text('Price')),
                                    DataColumn(label: Text('Opis')),
                                    DataColumn(label: Text('Title/Naziv')),
                                    DataColumn(label: Text('Edit')),
                                  ],
                                  rows: tickets
                                      .map(
                                        (ticket) => DataRow(
                                          cells: [
                                            DataCell(Text(userNames[ticket.userId] ?? 'Unknown User')),
                                            DataCell(Text(eventNames[ticket.eventId] ?? 'Unknown Event')),
                                            DataCell(Text(ticket.cijena?.toString() ?? 'N/A')),
                                            DataCell(Text(ticket.description ?? 'N/A')),
                                            DataCell(Text(ticket.title ?? 'Unknown Title')),
                                            DataCell(
                                              IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  _openEditTicketScreen(context, ticket);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
