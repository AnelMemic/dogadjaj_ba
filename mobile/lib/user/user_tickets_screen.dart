import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/models/SearchObjects/ticket_search_object.dart';
import 'package:mobile/models/SearchObjects/user_ticket_search_object.dart';
import 'package:mobile/models/event.dart';
import 'package:mobile/models/ticket.dart';
import 'package:mobile/models/user_ticket.dart';
import 'package:mobile/providers/event_provider.dart';
import 'package:mobile/providers/ticket_provider.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/providers/user_ticket_provider.dart';
import 'package:provider/provider.dart';

class UserTicketsScreen extends StatefulWidget {
  @override
  _UserTicketsScreenState createState() => _UserTicketsScreenState();
}

class _UserTicketsScreenState extends State<UserTicketsScreen> {
  late MediaQueryData mediaQueryData;

  late UserProvider _loginProvider;
  late TicketProvider _ticketProvider;
  late UserTicketProvider _userTicketProvider;
  late EventProvider _eventProvider;
  int currentPage = 1;
  int pageSize = 1000000;
  int? _userId;
  int? _eventId;
  bool? _expired = false;
  int _status = 1;
  List<UserTicket> _userTickets = <UserTicket>[];
  List<Ticket> _tickets = <Ticket>[];
  List<Event> _events = <Event>[];

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read<UserProvider>();
    _ticketProvider = context.read<TicketProvider>();
    _eventProvider = context.read<EventProvider>();
    _userTicketProvider = context.read<UserTicketProvider>();
    loadUser();
    loadUserTickets();
  }

  void loadUser() async {
    var id = _loginProvider.getUserId();
    _userId = id;
  }

  void loadUserTickets() async {
    try {
      loadUser();
      UserTicketSearchObject searchObject =
          UserTicketSearchObject(userId: _userId);

      var Response = await _userTicketProvider.getUserById(searchObject);
      if (mounted) {
        setState(() {
          _userTickets = Response;
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
                    Text(
                      "Moje karte",
                      style: TextStyle(
                          color: white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    _buildUserTicketsInfo(context)
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

  Widget _buildUserTicketsInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: AppDecoration.fillBlack.copyWith(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _userTickets.length,
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
                      // if (_events[index].lokacijaId != null) ...[
                      //   Text(
                      //     'Paket: ${_events[index].package!.name} ',
                      //     style: const TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ],
                      // Image container
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              "assets/images/fllogo.jpg", // Replace with the actual property name
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            
                              _buildEventsData("Karta za event: ", _userTickets[index].ticket!.event!.eventName.toString()),
                          _buildEventsData("Datum: ", DateFormat('dd/MM/yyyy').format(_userTickets[index].ticket!.event!.eventDate!).toString()),

                            ],
                          ),
                        ],
                      ),
                      
                      _buildEventsData(
                          "Cijena: karte:",
                          _userTickets[index]!.ticket!.cijena.toString() +
                              " KM"),
                      _buildEventsData("Broj karata: ",
                          _userTickets[index].kolicina.toString()),

                      Divider()
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
}
