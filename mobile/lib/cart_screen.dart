import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/cart_payment.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/models/SearchObjects/ticket_search_object.dart';
import 'package:mobile/models/event.dart';
import 'package:mobile/models/ticket.dart';
import 'package:mobile/providers/event_provider.dart';
import 'package:mobile/providers/ticket_provider.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TicketsScreen extends StatefulWidget {
  @override
  _TicketsScreenState createState() => _TicketsScreenState();
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
        eventId: _eventId,
      );
      var Response = await _ticketProvider.getPaged(searchObject: searchObject);
      if (mounted) {
        setState(() {
          _tickets = Response;
          print("Tickets");
          print(_tickets[0].cijena);
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

          // Add the "All" option
          if (_showAllOption) {
            _eventDropdownItems.add(
              DropdownMenuItem<int>(
                value: null,
                child: Text('Svi',style: TextStyle(color: white),),
              ),
            );
          }

          // Populate the dropdown items
          _eventDropdownItems.addAll(
            _events.map(
              (event) => DropdownMenuItem<int>(
                value: event.eventId,
                child: Text(event.eventName ?? "--",style: TextStyle(color: white),),
              ),
            ),
          );
        });
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  // void loadUserTickets() async {
  //   try {
  //     loadUser();
  //   TicketSearchObject searchObject = TicketSearchObject(
  //         eventId: _eventId,
  //         PageNumber: currentPage,
  //         PageSize: pageSize,
  //         userId: _userId);
  //     var Response =
  //         await _ticketProvider.getPaged(searchObject: searchObject);
  //     if (mounted) {
  //       setState(() {
  //         _userTickets = Response;
  //       });
  //     }
  //   } on Exception catch (e) {
  //     showErrorDialog(context, e.toString().substring(11));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Container(
              height: 1.0,
              color: const Color.fromARGB(255, 214, 214, 214),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Eventi",
                      style: TextStyle(
                          color: white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<int>(
                      dropdownColor: black,
                      value: _selectedEventId,
                      items: _eventDropdownItems,
                      onChanged: (value) {
                        setState(() {
                          _selectedEventId = value;
                          _eventId =
                              value; // Set _eventId based on the selected event
                          loadTickets(); // Reload tickets based on the selected event
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildEvensInfo(context)
                  ],
                ),
              ),
            ),
            Spacer(),
            // Container(
            //   width: double.maxFinite,
            //   padding: EdgeInsets.all(16),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(backgroundColor: teal),
            //     onPressed: () async {
            //       showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return TicketPaymentForm();
            //         },
            //       );
            //     },
            //     child: Text(
            //       'Uplati članarinu',
            //       style: TextStyle(color: white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvensInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: AppDecoration.fillBlack.copyWith(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _events.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEventsData(
                          "Naziv eventa: ", _events[index].eventName ?? "--"),
                      _buildEventsData("Opis: ", _events[index].opis ?? "--"),
                      _buildEventsData('Datum održavnja: ',
                          '${_formatDate(_events[index].eventDate)}'),
                      Divider(),
                      ElevatedButton(
                        onPressed: () {
                          _openKupiKartuDialog(_events[index].eventId);
                        },
                        child: Text('Kupi kartu'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventsData(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.normal, color: white),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: white),
            ),
          ],
        ),
        SizedBox(height: 2),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat('dd.MM.yyyy').format(date);
  }

  void _openKupiKartuDialog(int? eventId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KupiKartuDialog(eventId: eventId);
      },
    );
  }
}
