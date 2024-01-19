import 'package:dogadjaj_ba/custom_container.dart';
import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IzvjestajWidget extends StatefulWidget {
  @override
  _IzvjestajWidgetState createState() => _IzvjestajWidgetState();
}

class _IzvjestajWidgetState extends State<IzvjestajWidget> {
  int? _userId;
  List<Ticket> _tickets = <Ticket>[];
  List<Event> _events = <Event>[];
  List<User> users = <User>[];
  late TicketProvider _ticketProvider;
  late UserProvider _loginProvider;
  late EventProvider _eventProvider;
  List<DropdownMenuItem<int>> _eventDropdownItems = [];
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
    loadUsers();
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
                child: Text(
                  'Svi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }

          // Populate the dropdown items
          _eventDropdownItems.addAll(
            _events.map(
              (event) => DropdownMenuItem<int>(
                value: event.eventId,
                child: Text(
                  event.eventName ?? "--",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        });
      }
    } on Exception catch (e) {
      //showErrorDialog(context, e.toString().substring(11));
    }
  }

  void loadUser() async {
    var id = _loginProvider.getUserId();
    _userId = id;
  }

  void loadUsers() async {
    try {
      var usersResponse = await _loginProvider.getAll();
      setState(() {
        users = usersResponse;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  void loadTickets() async {
    try {
      var Response = await _ticketProvider.get();
      if (mounted) {
        setState(() {
          _tickets = Response;
          print("Tickets");
          print(_tickets[0].cijena);
        });
      }
    } on Exception catch (e) {
      // showErrorDialog(context, e.toString().substring(11));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Izvjestaj App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            _buildIzvjestajScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildIzvjestajScreen() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            children: [
              CustomContainer(
                count: _events.length, // Count of events
                title: 'Dogadjaji',
              ),
              SizedBox(width: 20),
              CustomContainer(
                count: _tickets.length, // Count of tickets
                title: 'Karte',
              ),
              SizedBox(width: 20),
              CustomContainer(
                count: users.length, // Count of users
                title: 'Useri',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
