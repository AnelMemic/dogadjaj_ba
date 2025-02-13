import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/screens/dodaj_dogadjaj_screen.dart';
import 'package:dogadjaj_ba/screens/edit_event_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DogadjajiScreen extends StatefulWidget {
  const DogadjajiScreen({Key? key}) : super(key: key);

  @override
  State<DogadjajiScreen> createState() => _DogadjajiScreenState();
}

class _DogadjajiScreenState extends State<DogadjajiScreen> {
  TextEditingController searchController = TextEditingController(text: '');
  final ScrollController controller = ScrollController();
  final EventProvider eventProvider = EventProvider();
  String searchEventName = '';
  Map<int, String> locationNames = {};

  @override
  void initState() {
    super.initState();
    fetchLocationNames();
  }

  @override
  void dispose() {
    searchController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _openAddEventScreen(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DodajDogadjajScreen(),
      ),
    );

    if (result == true) {
      setState(() {});
    }
  }

  void _openEditEventScreen(BuildContext context, Event event) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditEventScreen(event: event),
      ),
    );

    if (result == true) {
      setState(() {});
    }
  }

  Future<void> fetchLocationNames() async {
    try {
      List<Map<String, dynamic>> locations = await eventProvider.getLocations();
      setState(() {
        locationNames = {
          for (var loc in locations) loc['id']: loc['nazivObjekta']
        };
      });
    } catch (e) {
      print("Failed to load locations: $e");
    }
  }
  String formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String hour = date.month.toString().padLeft(2, '0');
      String minute = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return '$day-$month-$year $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogadjaji'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.add, size: 24.0),
            label: Text('Add Dogadjaj', style: TextStyle(fontSize: 18.0)),
            onPressed: () {
              _openAddEventScreen(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, 
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Filter po EventName:'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchEventName = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Unesi ime eventa...',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Scrollbar(
                controller: controller,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(dragDevices: {PointerDeviceKind.mouse}),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: FutureBuilder<List<Event>>(
                      future: eventProvider.get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          List<Event> events = snapshot.data ?? [];

                          return DataTable(
                            border: const TableBorder(
                              right: BorderSide(),
                              left: BorderSide(),
                              top: BorderSide(),
                              bottom: BorderSide(),
                              verticalInside: BorderSide(),
                              horizontalInside: BorderSide(),
                            ),
                            columns: const [
                              DataColumn(label: Text('Naziv')),
                              DataColumn(label: Text('Datum')),
                              DataColumn(label: Text('Kategorija')),
                              DataColumn(label: Text('Opis')),
                              DataColumn(label: Text('Lokacija')),
                              DataColumn(label: Text('Edit')),
                            ],
                            rows: events
                                .where((event) =>
                                    searchEventName.isEmpty ||
                                    event.eventName!.toLowerCase().contains(
                                        searchEventName.toLowerCase()))
                                .map(
                                  (event) => DataRow(
                                    cells: [
                                      DataCell(Text(event.eventName ?? 'N/A')),
                                      DataCell(Text(
                                          event.eventDate!=null ? formatDate(event.eventDate!) : 'N/A')),
                                      DataCell(Text(
                                          EventCategoryMapper.mapCategory(
                                                  event.eventType!) ??
                                              'N/A')),
                                      DataCell(Text(event.opis ?? 'N/A')),
                                      DataCell(Text(
                                          locationNames[event.lokacijaId] ?? 'N/A')),
                                      DataCell(
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            _openEditEventScreen(context, event);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
