import 'package:dogadjaj_ba/constants.dart';
import 'package:dogadjaj_ba/helpers/app_decoration.dart';
import 'package:dogadjaj_ba/helpers/error_dialog.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/models/ticket.dart';
import 'package:dogadjaj_ba/providers/event_provider.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
      
      var Response =
          await _ticketProvider.get();
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
      
      var Response =
          await _eventProvider.get();
      if (mounted) {
        setState(() {
          _events = Response;
             print("Events");
          print(_events);
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
            SizedBox(height: 5,),
            Row(
              children: [
              
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  children: [_buildEvensInfo(context)],
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
                      // if (_events[index].lokacijaId != null) ...[
                      //   Text(
                      //     'Paket: ${_events[index].package!.name} ',
                      //     style: const TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ],
                      _buildEventsData("Naziv eventa: ", _events[index].eventName?? "--"),
                      _buildEventsData("Opis: ", _events[index].opis?? "--"),
                       _buildEventsData('Datum održavnja: ',
                          '${_formatDate(_events[index].eventDate)}'),
                      
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
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: white
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14,color: white),
              
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
