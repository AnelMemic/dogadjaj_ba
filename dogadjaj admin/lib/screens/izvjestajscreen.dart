import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/custom_container.dart';
import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class IzvjestajWidget extends StatefulWidget {
  @override
  _IzvjestajWidgetState createState() => _IzvjestajWidgetState();
}

class _IzvjestajWidgetState extends State<IzvjestajWidget> {
  int? _userId;
  List<Ticket> _tickets = <Ticket>[];
  List<Event> _events = <Event>[];
  List<Event> _filteredEvents = <Event>[]; // For filtered events
  List<User> users = <User>[];
  late TicketProvider _ticketProvider;
  late UserProvider _loginProvider;
  late EventProvider _eventProvider;
  List<DropdownMenuItem<int>> _eventDropdownItems = [];
  bool _showAllOption = true;

  // Add dropdown variables
  String? _selectedMonth;
  String? _selectedYear;
  final List<String> _months = [
    'All Months',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<String> _years = ['All Years'] + List<String>.generate(
      15, (index) => (DateTime.now().year - 1 + index).toString());

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
      var response = await _eventProvider.get();
      if (mounted) {
        setState(() {
          _events = response;
          _filteredEvents = _events; // Initially, all events are shown

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
      var response = await _ticketProvider.get();
      if (mounted) {
        setState(() {
          _tickets = response;
        });
      }
    } on Exception catch (e) {
      // showErrorDialog(context, e.toString().substring(11));
    }
  }

  void _filterEvents() {
    setState(() {
      if (_selectedMonth != null && _selectedYear != null) {
        if (_selectedMonth == 'All Months' && _selectedYear == 'All Years') {
          _filteredEvents = _events;
        } else if (_selectedMonth == 'All Months') {
          _filteredEvents = _events.where((event) {
            if (event.eventDate == null) return false;
            String eventYear = event.eventDate!.year.toString();
            return eventYear == _selectedYear;
          }).toList();
        } else if (_selectedYear == 'All Years') {
          _filteredEvents = _events.where((event) {
            if (event.eventDate == null) return false;
            String eventMonth = DateFormat.MMMM().format(event.eventDate!);
            return eventMonth == _selectedMonth;
          }).toList();
        } else {
          _filteredEvents = _events.where((event) {
            if (event.eventDate == null) return false;
            String eventMonth = DateFormat.MMMM().format(event.eventDate!);
            String eventYear = event.eventDate!.year.toString();
            return eventMonth == _selectedMonth && eventYear == _selectedYear;
          }).toList();
        }
      } else if (_selectedMonth != null) {
        if (_selectedMonth == 'All Months') {
          _filteredEvents = _events;
        } else {
          _filteredEvents = _events.where((event) {
            if (event.eventDate == null) return false;
            String eventMonth = DateFormat.MMMM().format(event.eventDate!);
            return eventMonth == _selectedMonth;
          }).toList();
        }
      } else if (_selectedYear != null) {
        if (_selectedYear == 'All Years') {
          _filteredEvents = _events;
        } else {
          _filteredEvents = _events.where((event) {
            if (event.eventDate == null) return false;
            String eventYear = event.eventDate!.year.toString();
            return eventYear == _selectedYear;
          }).toList();
        }
      } else {
        _filteredEvents = _events;
      }
    });
  }

  Future<void> _generateAndDownloadPdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Events Report', style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.Text('Total Events: ${_events.length}'),
              pw.Text('Total Tickets: ${_tickets.length}'),
              pw.Text('Total Users: ${users.length}'),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: ['Naziv', 'Datum', 'Opis'],
                data: _filteredEvents.map((event) {
                  return [
                    event.eventName ?? "--",
                    event.eventDate != null
                        ? DateFormat.yMMMMd().format(event.eventDate!)
                        : "--",
                    event.opis ?? "--"
                  ];
                }).toList(),
              ),
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final path = "${directory.path}/events_report_$timestamp.pdf";
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to $path')),
    );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<String>(
                  hint: Text('Izaberi mjesec'),
                  value: _selectedMonth,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMonth = newValue;
                      _filterEvents();
                    });
                  },
                  items: _months.map((String month) {
                    return DropdownMenuItem<String>(
                      value: month,
                      child: Text(month),
                    );
                  }).toList(),
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  hint: Text('Izaberi godinu'),
                  value: _selectedYear,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedYear = newValue;
                      _filterEvents();
                    });
                  },
                  items: _years.map((String year) {
                    return DropdownMenuItem<String>(
                      value: year,
                      child: Text(year),
                    );
                  }).toList(),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _generateAndDownloadPdf,
                  child: Text('DOWNLOAD ALL DATA'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: _buildIzvjestajScreen(),
            ),
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
          child: Column(
            children: [
              Row(
                children: [
                  CustomContainer(
                    count: _filteredEvents.length, 
                    title: 'Dogadjaji',
                  ),
                  SizedBox(width: 20),
                  CustomContainer(
                    count: _tickets.length, 
                    title: 'Karte',
                  ),
                  SizedBox(width: 20),
                  CustomContainer(
                    count: users.length, 
                    title: 'Useri',
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildEventsTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventsTable() {
    if (_filteredEvents.isEmpty) {
      return Center(
        child: Text("Nema infromacija za taj mjesec/godinu"),
      );
    }
    return DataTable(
      columns: const [
        DataColumn(label: Text('Naziv')),
        DataColumn(label: Text('Datum')),
        DataColumn(label: Text('Opis')),
      ],
      rows: _filteredEvents.map((event) {
        return DataRow(
          cells: [
            DataCell(Text(event.eventName ?? "--")),
            DataCell(Text(event.eventDate != null
                ? DateFormat.yMMMMd().format(event.eventDate!)
                : "--")),
            DataCell(Text(event.opis ?? "--")),
          ],
        );
      }).toList(),
    );
  }
}
