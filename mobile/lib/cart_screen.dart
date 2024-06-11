import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/cart_payment.dart';
import 'package:mobile/constants.dart';


import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/lists/events_list.dart';
import 'package:mobile/models/SearchObjects/ticket_search_object.dart';
import 'package:mobile/models/event.dart';
import 'package:mobile/models/ticket.dart';
import 'package:mobile/providers/event_provider.dart';
import 'package:mobile/providers/ticket_provider.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  late MediaQueryData mediaQueryData;

  late UserProvider _loginProvider;
  late TicketProvider _ticketProvider;
  late EventProvider _eventProvider;
  int currentPage = 1;
  int pageSize = 1000000;
  int? _userId;
  int? _eventId;
  bool? _expired = false;
  int _status = 1;
  List<Ticket> _userTickets = <Ticket>[];
  List<Ticket> _tickets = <Ticket>[];
  List<Event> _events = <Event>[];
  int? _selectedEventId; // Variable to store the selected event
  List<DropdownMenuItem<int>> _eventDropdownItems =
      []; // List of events for the dropdown
  bool _showAllOption = true;

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read<UserProvider>();
    _ticketProvider = context.read<TicketProvider>();
    _eventProvider = context.read<EventProvider>();
    loadUser();
    loadTickets();
    loadEvents();
  }

  void loadUser() async {
    var id = _loginProvider.getUserId();
    _userId = id;
  }

  void loadTickets() async {
    try {
      TicketSearchObject searchObject = TicketSearchObject(
        eventId: _selectedEventId,
      );
      var Response = await _ticketProvider.getPaged(searchObject: searchObject);
      if (mounted) {
        setState(() {
          _tickets = Response;
        });
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  void loadEvents() async {
    try {
      var Response = await _eventProvider.get();
      if (mounted) {
        setState(() {
          _events = Response;

          if (_showAllOption) {
            _eventDropdownItems.add(
              DropdownMenuItem<int>(
                value: null,
                child: Text(
                  'Svi',
                  style: TextStyle(color: white),
                ),
              ),
            );
          }

          _eventDropdownItems.addAll(
            _events.map(
              (event) => DropdownMenuItem<int>(
                value: event.eventId,
                child: Text(
                  event.eventName ?? "--",
                  style: TextStyle(color: white),
                ),
              ),
            ),
          );
        });
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Eventi",
                      style: TextStyle(
                          color: white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    if (dodaniEventi.isNotEmpty) ...[
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dodaniEventi.length,
                        itemBuilder: (context, index) {
                          if (_events.isEmpty) {
                            return const Center(
                                child: Text('No events available.'));
                          }
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 100,
                              color: Color((Random().nextDouble() * 0xFFFFFF)
                                      .toInt())
                                  .withOpacity(1.0),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  // Image container
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      "assets/images/logo.png", // Replace with the actual property name
                                      height: 90,
                                      width: 85,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (_events[index].eventName != null &&
                                            _events[index]
                                                .eventName!
                                                .isNotEmpty)
                                          Text(
                                            _events[index].eventName ?? "",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        if (_events[index].opis != null &&
                                            _events[index].opis!.isNotEmpty)
                                          Text(
                                            _events[index].opis ?? "",
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        if (_events[index].eventDate != null)
                                          Text(
                                            _events[index].eventDate != null
                                                ? DateFormat('dd/MM/yyyy')
                                                    .format(_events[index]
                                                        .eventDate!)
                                                : "--",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        const SizedBox(height: 2),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: SizedBox(
                                            height: 20,
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _openKupiKartuDialog(
                                                    _events[index].eventId);
                                              },
                                              child: const Text(
                                                'Kupi kartu',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openKupiKartuDialog(int? eventId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KupiKartuDialog(eventId: eventId);
      },
    );
  }
}
